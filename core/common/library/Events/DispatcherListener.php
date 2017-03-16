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
namespace Phanbook\Common\Library\Events;

use Phalcon\Dispatcher;
use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher\Exception;
use Phalcon\Di\Exception as DiException;

/**
 * \Phanbook\Common\Library\Events\DispatcherListener
 *
 * @package Phanbook\Plugins\Mvc\Dispatcher
 */
class DispatcherListener extends AbstractEvent
{
    /**
     * Before forwarding is happening.
     *
     * @param Event      $event      Event object.
     * @param Dispatcher $dispatcher Dispatcher object.
     * @param array      $forward    The forward data.
     *
     * @return bool
     * @throws Exception
     * @throws DiException
     */
    public function beforeForward(Event $event, Dispatcher $dispatcher, array $forward)
    {
        if (!empty($forward['module'])) {
            if (!container('modules')->offsetExists($forward['module'])) {
                throw new Exception("Module {$forward['module']} does not exist.");
            }

            $moduleDefinition = container('modules')->offsetGet($forward['module']);

            if (!container()->has($moduleDefinition->className)) {
                throw new DiException(
                    "Service '{$moduleDefinition->className}' wasn't found in the dependency injection container"
                );
            }

            /** @var \Phanbook\Common\ModuleInterface $module */
            $module = container($moduleDefinition->className);

            $dispatcher->setModuleName($forward['module']);
            $dispatcher->setNamespaceName($module->getHandlersNamespace());
        }

        return true;
    }

    /**
     * Before exception is happening.
     *
     * @param Event      $event      Event object.
     * @param Dispatcher $dispatcher Dispatcher object.
     * @param \Exception $exception  Exception object.
     *
     * @throws \Exception
     * @return bool
     */
    public function beforeException(Event $event, Dispatcher $dispatcher, $exception)
    {
        $module = $dispatcher->getModuleName();

        if ($exception instanceof Exception) {
            $dispatcher->setModuleName('error');

            switch ($exception->getCode()) {
                case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                    $code = 400;
                    $dispatcher->forward([
                        'module'     => 'error',
                        'namespace'  => 'Phanbook\Error\Controllers',
                        'controller' => 'index',
                        'action'     => 'show400',
                    ]);

                    break;
                default:
                    $code = 404;
                    $dispatcher->forward([
                        'module'     => 'error',
                        'namespace'  => 'Phanbook\Error\Controllers',
                        'controller' => 'index',
                        'action'     => 'show404',
                    ]);

                    break;
            }

            $this->logger->error($module . " [$code]: " . $exception->getMessage());

            return false;
        }

        if (APPLICATION_ENV !== ENV_PRODUCTION && $exception instanceof \Exception) {
            $this->logger->error($module . " [{$exception->getCode()}]: " . $exception->getMessage());

            throw $exception;
        }

        $dispatcher->forward([
            'module'     => 'error',
            'namespace'  => 'Phanbook\Error\Controllers',
            'controller' => 'index',
            'action'     => 'show500',
        ]);

        return $event->isStopped();
    }
}
