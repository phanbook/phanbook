<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
use Phalcon\DI;
use Phalcon\Crypt;
use Phalcon\Security;
use Phalcon\Mvc\Router;
use Phalcon\Flash\Session;
use Phalcon\DI\FactoryDefault;
use Phalcon\Http\Response\Cookies;
use Phalcon\Mvc\Collection\Manager     as CollectionManager;
use Phalcon\Cache\Frontend\Data;
use Phalcon\Cache\Frontend\None        as FrontendNone;
use Phalcon\Cache\Frontend\Output      as FrontendOutput;
use Phalcon\Db\Adapter\Pdo\Mysql;
use Phalcon\Cache\Backend\Memcache;
use Phalcon\Cache\Backend\Memory       as MemoryBackend;
use Phalcon\Cache\Backend\File         as FileCache;
use Phalcon\Mvc\Url                    as UrlResolver;
use Phalcon\Translate\Adapter\Gettext;
use Phalcon\Mvc\Model\Manager          as ModelsManager;
use Phalcon\Events\Manager             as EventsManager;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Queue\Beanstalk;
use Phalcon\Config\Adapter\Php        as AdapterPhp;

use Phanbook\Mail\Mail;
use Phanbook\Auth\Auth;
use Phanbook\Utils\Phanbook;
use Phanbook\Queue\DummyServer;
use Phanbook\Markdown\ParsedownExtra;
use Phanbook\Plugins\Security          as SecurityPlugin;
use Phanbook\Plugins\NotFound          as NotFoundPlugin;
use Phanbook\Notifications\Checker     as NotificationsChecker;

/**
 * The FactoryDefault Dependency Injector automatically register the right services providing a full stack framework
 */
$di = new FactoryDefault();

// Create an event manager
$eventsManager = new EventsManager();

/**
 * Register the configuration itself as a service
 */
$config = include __DIR__ . '/config.php';
if (file_exists(__DIR__ . '/config.global.php')) {
    $overrideConfig = include __DIR__ . '/config.global.php';
    $config->merge($overrideConfig);
}
//It crreated when save in admin dashboard
if (file_exists(ROOT_DIR . 'content/options/options.php')) {
    $overrideConfig = new AdapterPhp(ROOT_DIR . 'content/options/options.php');
    $config->merge($overrideConfig);
}

if (file_exists(__DIR__ . '/config.' . APPLICATION_ENV . '.php')) {
    $overrideConfig = include __DIR__ . '/config.' . APPLICATION_ENV . '.php';
    $config->merge($overrideConfig);
}
$di->set('config', $config, true);

// setup timezone
date_default_timezone_set($di->get('config')->application->timezone ?: 'UTC');

/**
 * Router
 */
$di->set(
    'router',
    function () {
        return include ROOT_DIR . "core/config/routes.php";
    },
    true
);

/**
 * The URL component is used to generate all kind of urls in the application
 */
$di->set(
    'url',
    function () use ($di) {
        $url = new UrlResolver();
        $config = $di->get('config');
        $url->setBaseUri($config->application->baseUri);
        if (!$config->application->debug) {
            $url->setStaticBaseUri($config->application->production->staticBaseUri);
        } else {
            $url->setStaticBaseUri($config->application->development->staticBaseUri);
        }
        return $url;
    }
);

/**
 * Start the session the first time some component request the session service
 */
$di->set(
    'session',
    function () use ($di) {
        $sessionAdapter = $di->get('config')->application->session->adapter;
        $session        = new $sessionAdapter($di->get('config')->application->session->options->toArray());
        $session->start();

        return $session;
    },
    true
);

/**
 * This service controls the initialization of models, keeping record of relations
 * between the different models of the application.
 */
$di->setShared(
    'collectionManager',
    function () use ($eventsManager) {
        $collectionManager = new CollectionManager();
        $collectionManager->setEventsManager($eventsManager);

        return $collectionManager;
    }
);
$di->setShared(
    'modelsManager',
    function () use ($eventsManager) {
        $modelsManager = new ModelsManager();
        $modelsManager->setEventsManager($eventsManager);

        return $modelsManager;
    }
);

// Set the views cache service
$di->set(
    'viewCache',
    function () use ($di) {
        $config = $di->get('config');
        if ($config->application->debug) {
            return new MemoryBackend(new FrontendNone());
        } else {
            // Cache data for one day by default
            $frontCache = new FrontendOutput(['lifetime' => $config->cache->lifetime]);
            return new FileCache(
                $frontCache,
                [
                    'cacheDir' => $config->cache->cacheDir,
                    'prefix'   => $config->cache->prefix
                ]
            );
        }
    }
);


//  Setting up the view component
$di->set(
    'view',
    function () use ($di, $eventsManager) {
        $config = $di->get('config');
        $view = new View($config->toArray());
        $view->setViewsDir($config->application->view->viewsDir);
        $view->disableLevel([View::LEVEL_MAIN_LAYOUT => true, View::LEVEL_LAYOUT => true]);
        $view->registerEngines(
            [
                '.volt' => function () use ($view, $config) {
                        $volt = new Volt($view);
                        $volt->setOptions(
                            [
                                'compiledPath'      => $config->application->view->compiledPath,
                                'compiledSeparator' => $config->application->view->compiledSeparator,
                                'compiledExtension' => $config->application->view->compiledExtension,
                                'compileAlways'     => $config->application->debug,
                            ]
                        );
                        $compiler = $volt->getCompiler();
                        $compiler->addExtension(new \Phanbook\Tools\VoltFunctions());
                        return $volt;
                }
            ]
        );

        // Attach a listener for type 'view'
        $eventsManager->attach(
            'view',
            function ($event, $view) {
                if ($event->getType() == 'notFoundView') {
                    throw new \Exception('View not found!!! (' . $view->getActiveRenderPath() . ')');
                }
            }
        );

        // Bind the eventsManager to the view component
        $view->setEventsManager($eventsManager);

        return $view;
    }
);

// Register the flash service with custom CSS classes
$di->set(
    'flashSession',
    function () {
        $flash = new Session(
            [
                'error'   => 'alert alert-danger',
                'success' => 'alert alert-success',
                'notice'  => 'alert alert-info',
                'warning' => 'alert alert-warning'
            ]
        );

        return $flash;
    }
);

// Database connection is created based in the parameters defined in the configuration file
$di->set(
    'db',
    function () use ($di) {
        return new Mysql(
            [
                'host'     => $di->get('config')->database->mysql->host,
                'username' => $di->get('config')->database->mysql->username,
                'password' => $di->get('config')->database->mysql->password,
                'dbname'   => $di->get('config')->database->mysql->dbname,
                //'schema'   => $di->get('config')->database->mysql->schema,
                'options'  => [
                    \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . $di->get('config')->database->mysql->charset
                ]
            ]
        );
    },
    true // shared
);

$di->set(
    'cookies',
    function () {
        $cookies = new Cookies();
        $cookies->useEncryption(false);
        return $cookies;
    },
    true
);

$di->set(
    'crypt',
    function () use ($di) {
        $crypt = new Crypt();
        $crypt->setKey($di->get('config')->application->cryptSalt); //Use your own key!

        return $crypt;
    }
);

$di->set(
    'security',
    function () {

        $security = new Security();
        //Set the password hashing factor to 12 rounds
        $security->setWorkFactor(12);

        return $security;
    },
    true
);

//Set the models cache service
$di->set(
    'modelsCache',
    function () {
        // Cache data for one day by default
        $frontCache = new Data(['lifetime' => 86400]);

        // Memcached connection settings
        $cache = new Memcache(
            $frontCache,
            [
                'host' => 'localhost',
                'port' => 11211
            ]
        );

        return $cache;
    }
);

//Set mail swift
$di->set(
    'mail',
    function () {
        return new Mail();
    }
);
//Markdown renderer
$di->set(
    'markdown',
    function () {
        $parsedown = new ParsedownExtra();
        return $parsedown;
    },
    true
);

$di->set(
    'dispatcher',
    function () use ($di) {
        $eventsManager = new EventsManager;
        //$eventsManager->attach('dispatch:beforeDispatch', new SecurityPlugin);
        //$eventsManager->attach('dispatch:beforeException', new NotFoundPlugin);
        $dispatcher = new Dispatcher;
        $dispatcher->setEventsManager($eventsManager);

        return $dispatcher;
    }
);
$di->set(
    'auth',
    function () {
        return new Auth();
    }
);
//Real-Time notifications checker
$di->set(
    'notifications',
    function () {
        return new NotificationsChecker();
    },
    true
);
//Translation application use gettext
$di->set(
    'translation',
    function () use ($di) {
        $translation = new Gettext(
            [
            'locale' => $di->get('config')->language,
            'directory' => ROOT_DIR . '/apps/lang',
            'defaultDomain'=> 'messages',

            ]
        );
        return $translation;
    },
    true
);
//Queue to deliver e-mails in real-time
$di->set(
    'queue',
    function () use ($di) {
        $config = $di->get('config');
        if (isset($config->beanstalk->disabled) && $config->beanstalk->disabled) {
            return new DummyServer();
        }
        if (!isset($config->beanstalk->host)) {
            throw new \Exception('Beanstalk is not configured');
        }
        return new Beanstalk(['host' => $config->beanstalk->host]);
    },
    true
);
/**
 * Setting up volt
 */
$di->set(
    'volt',
    function ($view, $di) use ($config) {
        $volt = new Volt($view);
        $volt->setOptions(
            [
                'compiledPath'      => $config->application->view->compiledPath,
                'compiledSeparator' => $config->application->view->compiledSeparator,
                'compiledExtension' => $config->application->view->compiledExtension,
                'compileAlways'     => true,
            ]
        );
        $compiler = $volt->getCompiler();
        $compiler->addExtension(new \Phanbook\Tools\VoltFunctions());
        return $volt;
    },
    true
);
/**
 * Adding utils
 *
 */
$di->set(
    'phanbook',
    function () use ($di) {
        $theme = $di->get('config')->theme;
        $info  = ROOT_DIR . 'content/themes/' . $theme . '/info.php';
        if (!file_exists($info)) {
            throw new \Exception('You need to created a file info theme', 1);

        }
        return new Phanbook(include $info);
    },
    true
);

/**
 * Translation function call anywhere
 *
 * @param $string
 *
 * @return mixed
 */
if (!function_exists('t')) {
    function t($string)
    {
        $translation = DI::getDefault()->get('translation');
        return $translation->_($string);
    }
}
//Phalcon Debugger
if ($config->application->debug) {
    (new \Phalcon\Debug)->listen();
    if (!function_exists('d')) {
        function d($object, $kill = true)
        {
            echo '<pre style="text-aling:left">', print_r($object, true), '</pre>';
            $kill && exit(1);
        }
    }
}
