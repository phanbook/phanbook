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
        $module = $dispatcher->getModuleName();

        if ($exception instanceof Exception) {
            switch ($exception->getCode()) {
                case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                    $code = 400;
                    $dispatcher->forward([
                        'for' => 'bad-request'
                    ]);

                    break;
                default:
                    $code = 404;
                    $dispatcher->forward([
                        'for' => 'page-not-found'
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

        return $event->isStopped();
    }
}
