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
use Phalcon\DiInterface;
use Phanbook\Common\Module as BaseModule;
use Phanbook\Common\Library\Events\ViewListener;
use Phanbook\Common\Library\Events\AccessListener;
use Phanbook\Common\Library\Events\DispatcherListener;

/**
 * \Phanbook\Backend\Module
 *
 * @package Phanbook\Backend
 */
class Module extends BaseModule
{
    /**
     * {@inheritdoc}
     *
     * @return string
     */
    public function getHandlersNamespace()
    {
        return 'Phanbook\Backend\Controllers';
    }

    /**
     * Registers an autoloader related to the module.
     *
     * @param DiInterface $di
     */
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $namespaces = [
            $this->getHandlersNamespace() => __DIR__ . '/controllers/',
            'Phanbook\Backend\Forms'      => __DIR__ . '/forms/',
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
        $url = $di->getShared('url');
        $url->setBaseUri($moduleConfig->application->baseUri);

        // Setting up the MVC Dispatcher
        $eventsManager = $di->getShared('eventsManager');
        $eventsManager->attach('dispatch:beforeDispatch', new AccessListener($di), 1000);
        $eventsManager->attach('dispatch:beforeException', new DispatcherListener($di), 999);

        // Setting up the View Component
        $eventsManager->attach('view:notFoundView', new ViewListener($di));
        $view = $di->getShared('view');
        $view->setViewsDir($moduleConfig->application->viewsDir);

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
