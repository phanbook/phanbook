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
namespace Phanbook\Backend;

use Phalcon\Loader;
use Phalcon\Mvc\Url;
use Phalcon\Mvc\View;
use Phalcon\DiInterface;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phanbook\Plugins\Mvc\View\ErrorHandler as ViewErrorHandler;
use Phanbook\Plugins\Mvc\Dispatcher\ErrorHandler as DispatcherErrorHandler;

/**
 * \Phanbook\Backend\Module
 *
 * @package Phanbook\Backend
 */
class Module implements ModuleDefinitionInterface
{
    /**
     * Registers an autoloader related to the module.
     *
     * @param DiInterface $di
     */
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $namespaces = [
            'Phanbook\Backend\Controllers' => __DIR__ . '/controllers/',
            'Phanbook\Backend\Forms'       => __DIR__ . '/forms/',
            'Phanbook\Plugins'             => app_path('core/common/plugins/'),
        ];

        $loader->registerNamespaces($namespaces);

        $loader->register();
    }

    /**
     * Registers services related to the module.
     *
     * @param DiInterface $di
     */
    public function registerServices(DiInterface $di)
    {
        // Read configuration
        $moduleConfig = require __DIR__ . '/config/config.php';

        // Tune Up the URL Component
        $di->setShared(
            'url',
            function () use ($moduleConfig) {
                /** @var DiInterface $this */
                $config = $this->getShared('config');

                $url = new Url();

                if (isset($config->application->staticBaseUri)) {
                    $url->setStaticBaseUri($config->application->staticBaseUri);
                } else {
                    $url->setStaticBaseUri('/');
                }

                $url->setBaseUri($moduleConfig->application->baseUri);

                return $url;
            }
        );

        // Setting up the MVC Dispatcher
        $di->setShared(
            'dispatcher',
            function () {
                /** @var DiInterface $this */
                $eventsManager = $this->getShared('eventsManager');

                // Listen the required events
                $eventsManager->attach('dispatch:beforeException', new DispatcherErrorHandler($this));

                $dispatcher = new Dispatcher();
                $dispatcher->setDefaultNamespace('Phanbook\Backend\Controllers');
                $dispatcher->setEventsManager($eventsManager);
                $dispatcher->setDI($this);

                return $dispatcher;
            }
        );

        // Setting up the View Component
        $di->setShared(
            'view',
            function () use ($moduleConfig) {
                /** @var DiInterface $this */
                $view = new View();

                $view->setDI($this);
                $view->setViewsDir($moduleConfig->application->viewsDir);

                $view->registerEngines(
                    [
                        '.volt' => $this->getShared('volt', [$view, $this])
                    ]
                );

                $view->disableLevel(
                    [
                        View::LEVEL_MAIN_LAYOUT => true,
                        View::LEVEL_LAYOUT      => true
                    ]
                );

                $eventsManager = $this->getShared('eventsManager');
                $eventsManager->attach('view:notFoundView', new ViewErrorHandler($this));

                $view->setEventsManager($eventsManager);

                return $view;
            }
        );

        // @todo if structure received from db table instead getting from $config
        // we need to store it to cache for reducing db connections
        $configMenu = require __DIR__ . '/config/config.menu.php';
        $di->setShared(
            'menuStruct',
            function () use ($configMenu) {
                return $configMenu->get('menuStruct')->toArray();
            }
        );
    }
}
