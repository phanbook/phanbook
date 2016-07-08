<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Frontend;

use Phalcon\Loader;
use Phalcon\DiInterface;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\View;
use Phalcon\Mvc\Url;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Events\Manager as EventsManager;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $dependencyInjector = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            'Phanbook\Frontend\Controllers' => __DIR__ . '/controllers/',
            'Phanbook\Frontend\Forms'       => __DIR__ . '/forms/'
        ]);

        $loader->register();
    }

    /**
     * Register the services here to make them general
     * or register in the ModuleDefinition to make them module-specific
     */
    public function registerServices(DiInterface $di)
    {

        //Read configuration
        $config = include __DIR__ . "/config/config.php";

        $configGlobal = $di->getConfig();

        $di->set('url', function () use ($config, $configGlobal) {
            $url = new Url();
            if (APPLICATION_ENV == 'production') {
                $url->setStaticBaseUri($configGlobal->application->production->staticBaseUri);
            } else {
                $url->setStaticBaseUri($configGlobal->application->development->staticBaseUri);
            }
            $url->setBaseUri($config->application->baseUri);

            return $url;
        });

        //Registering a dispatcher
        $di->set('dispatcher', function () use ($di) {
            $eventsManager = new EventsManager();
            $eventsManager->attach("dispatch", function ($event, $dispatcher, $exception) use ($di) {
                //controller or action doesn't exist
                if ($event->getType() == 'beforeException') {
                    $message  = $exception->getMessage();
                    $response = $di->getResponse();
                    switch ($exception->getCode()) {
                        case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                            $response->redirect();
                            return false;
                        case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                            $response->redirect('action-not-found?msg=' . $message);
                            return false;

                        case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                            $response->redirect('cyclic-routing?msg=' . $message);
                            return false;
                    }
                }
            });
            $dispatcher = new Dispatcher();
            $dispatcher->setDefaultNamespace("Phanbook\Frontend\Controllers");
            $dispatcher->setEventsManager($eventsManager);
            return $dispatcher;
        });
        /**
         * Setting up the view component
         */
        $di->set(
            'view',
            function () use ($di) {
                $config = $di->get('config');
                $view = new View();
                $view->setViewsDir(ROOT_DIR . 'content/themes/' . $config->theme);
                $view->disableLevel([View::LEVEL_MAIN_LAYOUT => true, View::LEVEL_LAYOUT => true]);
                $view->registerEngines(['.volt' => 'volt']);

                // Create an event manager
                $eventsManager = new EventsManager();
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
    }
}
