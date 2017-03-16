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

use Phalcon\Http\Response\Cookies;

/**
 * \Phanbook\Common\Library\Providers\CookiesServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class CookiesServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'cookies';

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
                $cookies = new Cookies();
                $cookies->useEncryption(true);

                return $cookies;
            }
        );
    }
}
