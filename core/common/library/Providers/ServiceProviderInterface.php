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
     * @return mixed
     */
    public function register();

    /**
     * Get the Service name.
     *
     * @return string
     */
    public function getName();
}
