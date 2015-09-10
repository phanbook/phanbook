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
namespace Phanbook\Plugins;

use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Dispatcher;
use Phalcon\Mvc\Dispatcher\Exception as DispatchException;
use Phalcon\Mvc\Dispatcher as MvcDispatcher;

/**
 * NotFoundPlugin
 *
 * Handles not-found controller/actions
 */
class NotFound extends Plugin
{
    /**
     * This action is executed before execute any action in the application
     *
     * @param Event               $event
     * @param Dispatcher          $dispatcher
     * @param DispatcherException $exception
     */
    public function beforeException(Event $event, MvcDispatcher $dispatcher, $exception)
    {
        $object = $event->getData();
        $this->view->setVar('message', $object->getMessage());
        switch ($exception->getCode()) {
            case Dispatcher::EXCEPTION_HANDLER_NOT_FOUND:
            case Dispatcher::EXCEPTION_ACTION_NOT_FOUND:
                $dispatcher->forward(array(
                    'controller' => 'error',
                    'action' => 'show404'
                ));
                return false;
            case Dispatcher::EXCEPTION_CYCLIC_ROUTING:
                $dispatcher->forward([
                    'controller' => 'errors',
                    'action' => 'reports',
                ]);
                return false;
        }
    }
}
