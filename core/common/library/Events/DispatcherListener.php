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
namespace Phanbook\Common\Library\Events;

use Phalcon\Dispatcher;
use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher\Exception;

/**
 * \Phanbook\Common\Library\Events\DispatcherListener
 *
 * @package Phanbook\Plugins\Mvc\Dispatcher
 */
class DispatcherListener extends AbstractEvent
{
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
        if ($exception instanceof Exception) {
            $message  = $exception->getMessage();

            switch ($exception->getCode()) {
                case Dispatcher::EXCEPTION_INVALID_HANDLER:
                case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
                    $this->response->redirect();
                    break;

                case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                    $this->response->redirect('action-not-found?msg=' . $message);
                    break;

                case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                    $this->response->redirect('cyclic-routing?msg=' . $message);
                    break;
            }

            $this->logger->error($dispatcher->getModuleName() . ': ' . $exception->getMessage());
        } elseif (APPLICATION_ENV !== ENV_PRODUCTION && $exception instanceof \Exception) {
            $this->logger->error($dispatcher->getModuleName() . ': ' . $exception->getMessage());

            throw $exception;
        }

        if ($event->isCancelable()) {
            $event->stop();
        }

        return false;
    }
}
