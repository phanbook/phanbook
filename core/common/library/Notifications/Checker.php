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
namespace Phanbook\Notifications;

use Phanbook\Models\ActivityNotifications;
use Phalcon\Di\Injectable;

/**
 * Checker
 *
 * Checks if the user has unread notifications or not
 */
class Checker extends Injectable
{
    /**
     * Check whether there are unread notifications or not
     *
     * @return boolean
     */
    public function has()
    {
        $usersId = $this->auth->getAuth()['id'];
        if (!$usersId) {
            return false;
        }

        $number = ActivityNotifications::count(
            [
            'usersId = ?0 AND wasRead = "N"',
            'bind' => array($usersId)
            ]
        );

        return $number > 0;
    }

    /**
     * Check whether there are unread notifications or not
     *
     * @return integer
     */
    public function getNumber()
    {
        $usersId = $this->auth->getAuth()['id'];
        if (!$usersId) {
            return 0;
        }

        $number = ActivityNotifications::count(
            array(
            'usersId = ?0 AND wasRead = "N"',
            'bind' => array($usersId)
            )
        );

        return $number;
    }

    public function getNotifications($usersId)
    {
        $notifications = ActivityNotifications::find(
            array(
            'usersId = ?0 AND wasRead ="N"',
            'bind'  => array($usersId),
            'limit' => 7,
            'order' => 'createdAt DESC'
            )
        );
        return $notifications;
    }
}
