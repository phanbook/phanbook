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
            throw new Exception(sprintf('No Users found for ID %d', $id));
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
     * Checks whether the User is active.
     *
     * @param  Users $user
     * @return bool
     */
    public function isActiveMember(Users $user)
    {
        return $user->getStatus() == Users::STATUS_ACTIVE;
    }

    /**
     * Increase User karma.
     *
     * @param  Users $visitor
     * @return bool
     */
    public function increaseVisitorKarmaForViewingPost(Users $visitor)
    {
        if (!$this->isActiveMember($visitor)) {
            return false;
        }

        if ($this->isModerator($visitor)) {
            $visitor->increaseKarma(Karma::MODERATE_VISIT_POST);
        } else {
            $visitor->increaseKarma(Karma::VISIT_POST);
        }

        if (!$visitor->save()) {
            foreach ($visitor->getMessages() as $message) {
                $this->getLogger()->error($message);
            }

            return false;
        }

        return true;
    }
}
