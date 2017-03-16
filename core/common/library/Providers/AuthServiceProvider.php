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

use Phanbook\Auth\Auth;

/**
 * \Phanbook\Common\Library\Providers\AuthServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class AuthServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'auth';

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
                $auth = new Auth();
                $auth->setDI($this);
                $auth->setEventsManager($this->getShared('eventsManager'));

                return $auth;
            }
        );
    }
}
