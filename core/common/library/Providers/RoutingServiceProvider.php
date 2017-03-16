<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Common\Library\Providers;

use Phalcon\Mvc\Router as MvcRouter;
use Phalcon\Cli\Router as CliRouter;
use Phalcon\Mvc\Router\GroupInterface;

/**
 * \Phanbook\Common\Library\Providers\RoutingServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class RoutingServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'router';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->setShared(
            $this->serviceName,
            function () {
                $bootstrap = container('bootstrap');

                if ($bootstrap->getMode() == 'cli') {
                    $router = new CliRouter();
                    $router->setDefaultModule('cli');
                } else {
                    $router = new MvcRouter(false);
                    $router->removeExtraSlashes(true);

                    foreach (container('modules') as $module) {
                        if (empty($module->router)) {
                            continue;
                        }

                        /** @noinspection PhpIncludeInspection */
                        $group = require $module->router;

                        if (!$group || !$group instanceof GroupInterface) {
                            continue;
                        }

                        $router->mount($group);
                        $router->setEventsManager(container('eventsManager'));
                    }
                }

                $router->setDI(container());

                return $router;
            }
        );
    }
}
