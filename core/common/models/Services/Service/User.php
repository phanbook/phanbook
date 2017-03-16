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
namespace Phanbook\Models\Services\Service;

use DateTime;
use DateTimeZone;
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
     * @var Users
     */
    protected $viewer;

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
     * Finds User by passwdForgotHash.
     *
     * @param  string $hash The hash string generated on sign up time.
     * @return Users|null
     */
    public function findFirstByPasswdForgotHash($hash)
    {
        $user = Users::query()
            ->where('passwdForgotHash = :hash:', ['hash' => $hash])
            ->limit(1)
            ->execute();

        return $user->valid() ? $user->getFirst() : null;
    }

    /**
     * Get User by passwdForgotHash.
     *
     * @param  string $hash The hash string generated on reset password up time.
     * @return Users
     *
     * @throws Exceptions\EntityNotFoundException
     */
    public function getFirstByPasswdForgotHash($hash)
    {
        if (!$user = $this->findFirstByRegisterHash($hash)) {
            throw new Exceptions\EntityNotFoundException($hash, 'passwdForgotHash');
        }

        return $user;
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

        $endpoint = $this->url->get(
            ['for' => 'register'],
            ['registerhash' => $registerHash],
            null,
            env('APP_URL') . '/'
        );

        return [
            'link' => $endpoint
        ];
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

    /**
     * Validates reset password interval.
     *
     * @todo Create separated policy/validator.
     * @param Users $entity
     *
     * @throws Exceptions\EntityException
     */
    public function validateResetPasswordInterval(Users $entity)
    {
        $timezone = $this->config->get('application')->timezone;
        $passwdResetInterval = abs($this->config->get('application')->passwdResetInterval);

        $lastResetDate = $entity->getLastPasswdReset();
        if (!empty($lastResetDate) && $passwdResetInterval) {
            $nextDateForReset = new DateTime(
                date('Y-m-d H:i:s', $lastResetDate + $passwdResetInterval),
                new DateTimeZone($timezone)
            );
            $now = new DateTime('now', new DateTimeZone($timezone));

            if ($nextDateForReset > $now) {
                $nextReset = $nextDateForReset->format('Y-m-d H:i:s') . ' ' . $timezone;
                throw new Exceptions\EntityException(
                    $entity,
                    t("Oh no! You can't reset the password so often. Please try after: %time%", ['time' => $nextReset])
                );
            }
        }
    }

    /**
     * Reset password for user.
     *
     * @param  Users $entity
     * @return array
     *
     * @throws Exceptions\EntityException
     */
    public function resetPassword(Users $entity)
    {
        $this->validateResetPasswordInterval($entity);

        $newAttributes = [
            'passwdForgotHash' => $this->random->base58(),
            'lastPasswdReset'  => time(),
        ];

        $entity->assign($newAttributes);
        if (!$entity->save()) {
            throw new Exceptions\EntityException(
                $entity,
                t('We were unable to reset your password. Please try again later.')
            );
        }

        $endpoint = $this->url->get(
            ['for' => 'resetpassword'],
            ['forgothash' => $newAttributes['passwdForgotHash']],
            null,
            env('APP_URL') . '/'
        );

        return [
            'firstname' => $entity->getFirstname(),
            'lastname'  => $entity->getLastname(),
            'link'      => $endpoint
        ];
    }

    /**
     * Assign a new password for the User.
     *
     * @param  Users  $entity
     * @param  string $password
     *
     * @throws Exceptions\EntityException
     */
    public function assignNewPassword(Users $entity, $password)
    {
        $newAttributes = [
            'passwdForgotHash' => null,
            'passwd'           => $this->security->hash($password),
        ];

        $entity->assign($newAttributes);
        if (!$entity->save()) {
            throw new Exceptions\EntityException(
                $entity,
                t('We were unable to create a new password. Please try again later.')
            );
        }
    }

    /**
     * Gets current viewer.
     *
     * @return Users
     */
    public function getCurrentViewer()
    {
        if ($this->viewer) {
            return $this->viewer;
        }

        $entity = null;
        if ($this->auth->isAuthorizedVisitor()) {
            $entity = $this->findFirstById($this->auth->getUserId());
        }

        if (!$entity) {
            $entity = $this->createDefaultViewer();
        }

        $this->viewer = $entity;

        return $entity;
    }

    /**
     * Sets current viewer.
     *
     * @param Users $entity
     */
    public function setCurrentViewer(Users $entity)
    {
        $this->viewer = $entity;
    }

    /**
     * Gets role names for current viewer.
     *
     * @return string[]
     */
    public function getRoleNamesForCurrentViewer()
    {
        $entity = $this->getCurrentViewer();
        if ($entity->getId() == 0 || $entity->countRoles() == 0) {
            return [Role::ANONYMOUS_SYSTEM_ROLE];
        }

        return array_column($entity->getRoles(['columns' => ['name']])->toArray(), 'name');
    }

    protected function createDefaultViewer()
    {
        $entity = new Users(['id' => 0]);

        return $entity;
    }

    /**
     * Checks whether the User is Admin.
     *
     * @return bool
     */
    public function isAdmin()
    {
        return in_array(Role::ADMINS_SYSTEM_ROLE, $this->getRoleNamesForCurrentViewer());
    }
    /**
     * Checks whether the User is moderator.
     *
     * @return bool
     */
    public function isModerator()
    {
        return in_array(Role::MODERATORS_SYSTEM_ROLE, $this->getRoleNamesForCurrentViewer());
    }
}
