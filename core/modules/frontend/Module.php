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
use Phalcon\Mvc\View;
use Phalcon\DiInterface;
use Phalcon\Mvc\ModuleDefinitionInterface;
use Phanbook\Frontend\Plugins\Mvc\View\ErrorHandler as ViewErrorHandler;
use Phanbook\Frontend\Plugins\Mvc\Dispatcher\ErrorHandler as DispatcherErrorHandler;

/**
 * \Phanbook\Frontend\Module
 *
 * @package Phanbook\Frontend
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
            'Phanbook\Frontend\Controllers' => __DIR__ . '/controllers/',
            'Phanbook\Frontend\Forms'       => __DIR__ . '/forms/',
            'Phanbook\Frontend\Plugins'     => __DIR__ . '/plugins/',
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
        $config = require __DIR__ . '/config/config.php';

        // Tune Up the URL Component
        $url = $di->getShared('url');
        $url->setBaseUri($config->application->baseUri);

        // Listen the required events
        $eventsManager = $di->getShared('eventsManager');
        $eventsManager->attach('dispatch:beforeException', new DispatcherErrorHandler($di));
        $eventsManager->attach('view:notFoundView', new ViewErrorHandler($di));

        // Setting up the MVC Dispatcher
        $dispatcher = $di->getShared('dispatcher');
        $dispatcher->setDefaultNamespace('Phanbook\Frontend\Controllers');

        // Setting up the View Component
        $view = $di->getShared('view');
        $view->setViewsDir(themes_path($config->theme));
        $view->disableLevel(
            [
                View::LEVEL_MAIN_LAYOUT => true,
                View::LEVEL_LAYOUT      => true
            ]
        );
    }
}
