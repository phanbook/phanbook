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
     * @param Event  $event
     * @param object $source
     * @param array  $data
     *
     * @return bool
     */
    public function failedLogin(Event $event, $source, array $data)
    {
        $failedLoginService = $this->getDI()->getShared(Service\FailedLogin::class);

        $address = ip2long($data['ipAddress']);
        $userId  = empty($data['usersId']) ? null : $data['usersId'];
        $time    = time();

        try {
            $failedLoginService->createOrFail([
                'usersId'   => $userId,
                'ipAddress' => $address,
                'attempted' => $time,
            ]);
        } catch (EntityException $e) {
            $this->logger->error($event->getType() . ': ' . $e->getMessage());
        }

        $attempts = $failedLoginService->countAttempts($address, $time - self::FROM_TIME_FETCH);
        $this->throttling($attempts);

        return false;
    }

    /**
     * Register the successful login.
     *
     * @param Event  $event
     * @param object $source
     * @param array  $data
     *
     * @return bool
     */
    public function successLogin(Event $event, $source, array $data)
    {
        $successLoginService = $this->getDI()->getShared(Service\SuccessLogin::class);

        $address = ip2long($data['ipAddress']);
        $userAgent = empty($data['userAgent']) ? 'Unknown' : $data['userAgent'];

        try {
            $successLoginService->createOrFail([
                'usersId'   => $data['usersId'],
                'ipAddress' => $address,
                'userAgent' => $userAgent,
            ]);
        } catch (EntityException $e) {
            $this->logger->error($event->getType() . ': ' . $e->getMessage());
        }

        return true;
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
