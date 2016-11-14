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
                /** @var \Phalcon\DiInterface $this */
                $bootstrap = $this->getShared('bootstrap');

                if ($bootstrap->getMode() == 'cli') {
                    $router = new CliRouter();
                    $router->setDefaultModule('cli');
                } else {
                    $router = new MvcRouter(false);
                    $router->removeExtraSlashes(true);

                    foreach ($this->getShared('modules') as $module) {
                        if (empty($module->router)) {
                            continue;
                        }

                        /** @noinspection PhpIncludeInspection */
                        $group = require $module->router;

                        if (!$group || !$group instanceof GroupInterface) {
                            continue;
                        }

                        $router->mount($group);
                    }
                }

                $router->setDI($this);

                return $router;
            }
        );
    }
}
