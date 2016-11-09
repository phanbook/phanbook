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
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

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
     * @throws EntityNotFoundException
     */
    public function getFirstById($id)
    {
        if (!$user = $this->findFirstById($id)) {
            throw new EntityNotFoundException($id);
        }

        return $user;
    }

    /**
     * Finds User by email address.
     *
     * @param  string $email The email address.
     * @return Users|null
     */
    public function findFirstByEmail($email)
    {
        $user = Users::query()
            ->where('email = :email:', ['email' => $email])
            ->limit(1)
            ->execute();

        return $user->valid() ? $user->getFirst() : null;
    }

    /**
     * Get User by email address.
     *
     * @param  string $email The email address.
     * @return Users
     *
     * @throws EntityNotFoundException
     */
    public function getFirstByEmail($email)
    {
        if (!$user = $this->findFirstByEmail($email)) {
            throw new EntityNotFoundException($email, 'email');
        }

        return $user;
    }

    /**
     * Finds User by username.
     *
     * @param  string $name The username.
     * @return Users|null
     */
    public function findFirstByUsername($name)
    {
        $user = Users::query()
            ->where('username = :name:', ['name' => $name])
            ->limit(1)
            ->execute();

        return $user->valid() ? $user->getFirst() : null;
    }

    /**
     * Get User by username.
     *
     * @param  string $name The username.
     * @return Users
     *
     * @throws EntityNotFoundException
     */
    public function getFirstByUsername($name)
    {
        if (!$user = $this->findFirstByUsername($name)) {
            throw new EntityNotFoundException($name, 'username');
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

    /**
     * Update User's digest settings.
     *
     * @param Users  $user
     * @param string $value
     *
     * @return array
     */
    public function updateDigestSettings(Users $user, $value)
    {
        $messages = [];
        $user->setDigest($value);

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $messages[] = (string) $message;
            }
        }

        return $messages;
    }
}
