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

use Phalcon\Di\InjectionAwareInterface;

/**
 * \Phanbook\Common\Library\Providers\ServiceProviderInterface
 *
 * @package Phanbook\Common\Library\Providers
 */
interface ServiceProviderInterface extends InjectionAwareInterface
{
    /**
     * Register application service.
     *
     * @return void
     */
    public function register();

    /**
     * Package boot method.
     *
     * @return void
     */
    public function boot();

    /**
     * Configures the current service provider.
     *
     * @return void
     */
    public function configure();

    /**
     * Get the Service name.
     *
     * @return string
     */
    public function getName();
}
