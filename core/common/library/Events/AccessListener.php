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

use Phalcon\Text;
use Phalcon\Events\Event;
use Phalcon\DispatcherInterface;
use Phalcon\Mvc\Dispatcher\Exception;
use Phanbook\Models\Services\Service;
use Phanbook\Common\Library\Acl\Manager;

/**
 * \Phanbook\Common\Library\Events\AccessListener
 *
 * @package Phanbook\Common\Library\Events
 */
class AccessListener extends AbstractEvent
{
    /**
     * This action is executed before execute any action in the application.
     *
     * @param Event               $event   Event object.
     * @param DispatcherInterface $dispatcher Dispatcher object.
     * @param array               $data    The event data.
     *
     * @return mixed
     */
    public function beforeDispatch(Event $event, DispatcherInterface $dispatcher, array $data = null)
    {
        /** @var Service\User $userService */
        $userService = $this->getDI()->getShared(Service\User::class);

        /** @var Manager $aclManager */
        $aclManager = $this->getDI()->getShared('aclManager');

        $roles = $userService->getRoleNamesForCurrentViewer();
        $controller = $dispatcher->getControllerName();

        // @todo Get secure resources e.g. controllers from module config
        $protectedResource = $dispatcher->getModuleName() === 'backend' || Text::startsWith($controller, 'Admin', true);

        if ($protectedResource && !$aclManager->isAllowed($roles, Manager::ADMIN_AREA, 'access')) {
            $resource = "{$dispatcher->getControllerClass()}::{$dispatcher->getActiveMethod()}";
            $this->getDI()->getShared('eventsManager')->fire(
                'dispatch:beforeException',
                $dispatcher,
                new Exception("Unauthorized attempt to access protected resource: {$resource}.")
            );
        }

        return !$event->isStopped();
    }
}
