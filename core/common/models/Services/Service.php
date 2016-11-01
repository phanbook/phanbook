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
namespace Phanbook\Models\Services;

use Phalcon\DiInterface;
use Phalcon\Di\InjectionAwareInterface;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;

/**
 * \Phanbook\Models\Services\Service
 *
 * @package Phanbook\Models\Services
 */
abstract class Service implements InjectionAwareInterface
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * Service constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
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

    protected function logError($message)
    {
        if (!$this->getDI()->has('logger')) {
            return;
        }

        $this->getDI()->getShared('logger')->error((string) $message);
    }
}
