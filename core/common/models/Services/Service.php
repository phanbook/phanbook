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
use Phanbook\Common\Library\Behavior\Di as DiBehavior;
use Phanbook\Models\Services\Service\ServiceInterface;
use Phanbook\Models\Services\Exceptions\InvalidServiceException;

/**
 * \Phanbook\Models\Services\Service
 *
 * @method static Service\Post getPost()
 * @method static Service\PostViews getPostViews()
 * @method static Service\User getUser()
 *
 * @package Phanbook\Models\Services
 */
abstract class Service implements ServiceInterface
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * @var ServiceInterface[]
     */
    private static $services = [];

    /**
     * Service constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
    }

    /**
     * Get concrete Entity service.
     *
     * @param  string $name The service class name.
     * @return ServiceInterface
     *
     * @throws InvalidServiceException
     */
    public static function getService($name)
    {
        $className = "\\Phanbook\\Models\\Services\\Service\\{$name}";

        if (!empty(self::$services[$className])) {
            return self::$services[$className];
        }

        if (!class_exists($className)) {
            throw new InvalidServiceException(
                "Service class '{$className}' doesn't exists."
            );
        }

        $service = new $className();

        if (!$service instanceof ServiceInterface) {
            throw new InvalidServiceException(
                "Service {$className} must implement " . ServiceInterface::class . '.'
            );
        }

        self::$services[$className] = $service;

        return $service;
    }

    /**
     * Handle dynamic static method calls into the Service::getService method.
     *
     * @param  string $method
     * @param  array  $parameters
     * @return ServiceInterface
     *
     * @throws InvalidServiceException
     */
    public static function __callStatic($method, $parameters)
    {
        return self::getService(substr($method, 3));
    }

    protected function resolveClientAddress($ipAddress = null)
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
