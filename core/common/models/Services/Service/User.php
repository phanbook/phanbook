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
namespace Phanbook\Models\Services\Service;

use Phanbook\Models\Karma;
use Phanbook\Models\Users;
use Phalcon\Mvc\Model\Exception;
use Phanbook\Models\Services\Service;

/**
 * \Phanbook\Models\Services\Service\User
 *
 * @package Phanbook\Models\Services\Service
 */
class User extends Service
{
    /**
     * Finds User by ID.
     *
     * @param  int $id The User ID.
     * @return Users|null
     */
    public function findFirstById($id)
    {
        return Users::findFirstById($id) ?: null;
    }

    /**
     * Get User by ID.
     *
     * @param  int $id The User ID.
     * @return Users
     *
     * @throws Exception
     */
    public function getById($id)
    {
        if (!$user = $this->findFirstById($id)) {
            throw new Exception(
                sprintf('No Users found for ID %d', $id)
            );
        }

        return $user;
    }

    /**
     * Checks whether the User is moderator.
     *
     * @param  Users $user
     * @return bool
     */
    public function isModerator(Users $user)
    {
        return $user->getModerator() == 'Y';
    }

    /**
     * Increase User karma.
     *
     * @param  Users $user
     * @return $this
     */
    public function increaseAuthorKarmaByVisit(Users $user)
    {
        if ($this->isModerator($user)) {
            $user->increaseKarma(Karma::MODERATE_VISIT_POST);
        } else {
            $user->increaseKarma(Karma::VISIT_POST);
        }

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $this->logError($message);
            }
        }

        return $this;
    }
}
