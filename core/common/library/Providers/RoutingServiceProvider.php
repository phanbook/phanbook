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

use Phalcon\Cli\Router;

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
                if (PHP_SAPI == 'cli') {
                    return new Router();
                }

                /** @noinspection PhpIncludeInspection */
                return require_once config_path('routing.php');
            }
        );
    }
}
