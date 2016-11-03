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

use Phalcon\Mvc\Dispatcher as MvcDi;
use Phalcon\Cli\Dispatcher as CliDi;

/**
 * \Phanbook\Common\Library\Providers\MvcDispatcherServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class MvcDispatcherServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'dispatcher';

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
                /** @var \Phanbook\Common\Application $bootstrap */
                $bootstrap = $this->getShared('bootstrap');
                $dispatcher = $bootstrap->getMode() == 'cli'  ? new CliDi() : new MvcDi();

                $dispatcher->setEventsManager($this->getShared('eventsManager'));

                return $dispatcher;
            }
        );
    }
}
