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
namespace Phanbook\Oauth;

use Phalcon\Loader;
use Phalcon\DiInterface;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\View;
use Phalcon\Db\Adapter\Pdo\Mysql as DbAdapter;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Config\Adapter\Php  as AdapterPhp;
use Phalcon\Events\Manager as EventsManager;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $dependencyInjector = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            'Phanbook\Oauth\Controllers' => __DIR__ . '/controllers/',
            'Phanbook\Oauth\Forms'       => __DIR__ . '/forms/'
        ]);

        $loader->register();
    }

    /**
     * Register the services here to make them general
     * or register in the ModuleDefinition to make them module-specific
     */
    public function registerServices(DiInterface $di)
    {
        /**
         * Read configuration
         */
        //$config = include __DIR__ . "/config/config.php";

        //Registering a dispatcher
        $di->set('dispatcher', function () {
            $eventsManager = new EventsManager();
            $eventsManager->attach("dispatch", function ($event, $dispatcher, $exception) {
                //controller or action doesn't exist
                if ($event->getType() == 'beforeException') {
                    switch ($exception->getCode()) {
                        case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                        case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                            $dispatcher->forward([
                                'module'        => 'backend',
                                'controller'    => 'index',
                                'action'        => 'notFound'
                            ]);
                            return false;
                    }
                }
            });
            $dispatcher = new Dispatcher();
            $dispatcher->setDefaultNamespace("Phanbook\Oauth\Controllers");
            $dispatcher->setEventsManager($eventsManager);
            return $dispatcher;
        });
        /**
         * Setting up the view component
         */
        $di->set(
            'view',
            function () {
                $view = new View();
                $view->setViewsDir(__DIR__ . '/views/');
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
