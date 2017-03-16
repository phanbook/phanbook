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
namespace Phanbook\Models\Services;

use Phalcon\Di;
use Phalcon\DiInterface;
use Phalcon\Di\Injectable;

/**
 * \Phanbook\Models\Services\Service
 *
 * @property \Phalcon\Config $config
 * @property \Phanbook\Auth\Auth $auth
 * @property \Phalcon\Security\Random $random
 * @property \Phalcon\Logger\AdapterInterface $logger
 *
 * @package Phanbook\Models\Services
 */
abstract class Service extends Injectable
{
    /**
     * Service constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->setDI($di ?: Di::getDefault());
    }

    protected function resolveClientAddress($ipAddress)
    {
        if (!$ipAddress && $this->getDI()->has('request')) {
            $ipAddress = $this->getDI()->getShared('request')->getClientAddress();
        }

        return $ipAddress;
    }

    protected function resolveVisitorId($visitorId)
    {
        if (!$visitorId && $this->getDI()->has('auth')) {
            $visitorId = $this->getDI()->getShared('auth')->getUserId();
        }

        return $visitorId;
    }
}
