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
use Phanbook\Models\Services\Exceptions;

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
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstById($id)
    {
        if (!$user = $this->findFirstById($id)) {
            throw new Exceptions\EntityNotFoundException($id);
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
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstByEmail($email)
    {
        if (!$user = $this->findFirstByEmail($email)) {
            throw new Exceptions\EntityNotFoundException($email, 'email');
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
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstByUsername($name)
    {
        if (!$user = $this->findFirstByUsername($name)) {
            throw new Exceptions\EntityNotFoundException($name, 'username');
        }

        return $user;
    }

    /**
     * Finds User by email or username.
     *
     * @param  string $name The username.
     * @return Users|null
     */
    public function findFirstByEmailOrUsername($name)
    {
        $user = Users::query()
            ->where('email = :email:', ['email' => $name])
            ->orWhere('username = :name:', ['name' => $name])
            ->limit(1)
            ->execute();

        return $user->valid() ? $user->getFirst() : null;
    }

    /**
     * Get User by email or username.
     *
     * @param  string $name The username.
     * @return Users
     *
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstByEmailOrUsername($name)
    {
        if (!$user = $this->findFirstByEmailOrUsername($name)) {
            throw new Exceptions\EntityNotFoundException($name, 'email or username');
        }

        return $user;
    }

    /**
     * Finds User by registerHash.
     *
     * @param  string $hash The hash string generated on sign up time.
     * @return Users|null
     */
    public function findFirstByRegisterHash($hash)
    {
        $user = Users::query()
            ->where('registerHash = :hash:', ['hash' => $hash])
            ->limit(1)
            ->execute();

        return $user->valid() ? $user->getFirst() : null;
    }

    /**
     * Get User by registerHash.
     *
     * @param  string $hash The hash string generated on sign up time.
     * @return Users
     *
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstByRegisterHash($hash)
    {
        if (!$user = $this->findFirstByRegisterHash($hash)) {
            throw new Exceptions\EntityNotFoundException($hash, 'registerHash');
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
                $this->logger->error((string) $message);
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
     * @return bool
     */
    public function updateDigestSettings(Users $user, $value)
    {
        $user->setDigest($value);

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $this->logger->error((string) $message);
            }

            return false;
        }

        return true;
    }

    /**
     * Register a new member and returns register unique URL to confirm registration.
     *
     * @param Users $entity
     *
     * @return string
     * @throws Exceptions\EntityException
     */
    public function registerNewMemberOrFail(Users $entity)
    {
        $registerHash = $this->random->base58();

        $defaults = [
            'registerHash' => $registerHash,
            'passwd'       => $this->security->hash($this->random->base58()),
            'status'       => Users::STATUS_PENDING,
            'gender'       => Users::GENDER_UNKNOWN,
        ];

        $entity->assign($defaults);
        if (!$entity->save()) {
            throw new Exceptions\EntityException($entity, t('New member could not be registered.'));
        }

        return $this->url->get(['for' => 'register'], ['registerhash' => $registerHash], null, env('APP_URL') . '/');
    }

    /**
     * Confirm registration the new membership.
     *
     * @param Users  $entity
     * @param string $password
     *
     * @throws Exceptions\EntityException
     */
    public function confirmRegistration(Users $entity, $password)
    {
        $attributes = [
            'registerHash' => null,
            'passwd'       => $this->security->hash($password),
            'status'       => Users::STATUS_ACTIVE,
        ];

        $entity->assign($attributes);
        if (!$entity->save()) {
            throw new Exceptions\EntityException($entity, t("Couldn't to confirm the registration a new membership."));
        }

        $this->auth->check(
            [
                'email'    => $entity->getEmail(),
                'password' => $password,
                'remember' => true
            ]
        );
    }
}
