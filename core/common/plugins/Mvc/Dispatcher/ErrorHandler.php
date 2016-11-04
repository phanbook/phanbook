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
namespace Phanbook\Plugins\Mvc\Dispatcher;

use Phalcon\Di;
use Phalcon\Dispatcher;
use Phalcon\DiInterface;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Mvc\Dispatcher\Exception as DispatchException;

/**
 * \Phanbook\Plugins\Mvc\Dispatcher\ErrorHandler
 *
 * @package Phanbook\Plugins\Mvc\Dispatcher
 */
class ErrorHandler extends Plugin
{
    /**
     * @var DiInterface
     */
    protected $di;

    /**
     * ErrorHandler constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->di = $di ?: Di::getDefault();
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
        if ($exception instanceof DispatchException) {
            $message  = $exception->getMessage();
            $response = $this->getDI()->getShared('response');

            switch ($exception->getCode()) {
                case Dispatcher::EXCEPTION_INVALID_HANDLER:
                case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                    $response->redirect();
                    break;

                case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                    $response->redirect('action-not-found?msg=' . $message);
                    break;

                case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                    $response->redirect('cyclic-routing?msg=' . $message);
                    break;
            }

            $this->di->getShared('logger')->error($dispatcher->getModuleName() . ': ' . $exception->getMessage());

            $event->stop();
        }

        if (APPLICATION_ENV !== ENV_PRODUCTION && $exception instanceof \Exception) {
            $this->di->getShared('logger')->error($dispatcher->getModuleName() . ': ' . $exception->getMessage());

            throw $exception;
        }

        return $event->isStopped();
    }
}
