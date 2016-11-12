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

use Phanbook\Auth\Auth;
use Phalcon\Events\Event;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityException;

/**
 * \Phanbook\Common\Library\Events\UserLogins
 *
 * @package Phanbook\Common\Library\Events
 */
class UserLogins extends AbstractEvent
{
    const FROM_TIME_FETCH = 21600;

    /**
     * @param Event $event
     * @param Auth  $auth
     * @param mixed $userId
     *
     * @return bool
     */
    public function failedLogin(Event $event, Auth $auth, $userId = null)
    {
        $failedLoginService = $this->getDI()->getShared(Service\FailedLogin::class);

        $address = ip2long($this->getRequest()->getClientAddress());
        $time    = time();

        try {
            $failedLoginService->createOrFail([
                'usersId'   => $userId,
                'ipAddress' => $address,
                'attempted' => $time,
            ]);
        } catch (EntityException $e) {
            $this->getLogger()->error($e->getMessage());
        }

        $attempts = $failedLoginService->countAttempts($address, $time - self::FROM_TIME_FETCH);
        $this->throttling($attempts);

        return false;
    }

    /**
     * Implements login throttling.
     *
     * Reduces the effectiveness of brute force attacks
     *
     * @param int $attempts Failed login attempts
     */
    protected function throttling($attempts)
    {
        switch ($attempts) {
            case 1:
            case 2:
                break;
            case 3:
            case 4:
                sleep(2);
                break;
            default:
                sleep(4);
                break;
        }
    }
}
