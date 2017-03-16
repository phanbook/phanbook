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
namespace Phanbook\Auth;

use Phanbook\Models\Users;
use Phalcon\Mvc\User\Component;
use Phanbook\Models\RememberTokens;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Auth\Auth
 *
 * Manages Authentication/Identity Management in Phanbook
 *
 * @property \Phalcon\Config $config
 * @package Phanbook\Auth
 */
class Auth extends Component
{
    /**
     * @var Service\User
     */
    protected $userService;

    /**
     * @var int
     */
    protected $cookieLifetime;

    /**
     * Auth constructor.
     *
     * @param null $cookieLifetime
     */
    public function __construct($cookieLifetime = null)
    {
        $this->userService = $this->di->getShared(Service\User::class);

        if ($cookieLifetime === null) {
            $cookieLifetime = $this->config->get('application')->cookieLifetime;
        }

        $this->cookieLifetime = $cookieLifetime;
    }

    /**
     * Performs an authentication attempt.
     *
     * @param  array $credentials
     * @throws Exception
     */
    public function check(array $credentials)
    {
        $clientIp  = $this->request->getClientAddress(true);
        $userAgent = $this->request->getUserAgent();

        try {
            // Check if the user exist
            $user = $this->userService->getFirstByEmailOrUsername($credentials['email']);
            $userData = [
                'usersId'   => $user->getId(),
                'userAgent' => $userAgent,
                'ipAddress' => $clientIp,
            ];

            // Check the password
            if (!$this->security->checkHash($credentials['password'], $user->getPasswd())) {
                $this->getEventsManager()->fire('user:failedLogin', $this, $userData);
                throw new Exception('Wrong email/password combination');
            }

            // Check if the user was flagged
            if (!$this->userService->isActiveMember($user)) {
                throw new Exception('The user is inactive');
            }

            $this->getEventsManager()->fire('user:successLogin', $this, $userData);

            // Check if the remember me was selected
            if (isset($credentials['remember'])) {
                $this->setRememberEnvironment($user);
            }

            $this->setSession($user);
        } catch (EntityNotFoundException $e) {
            $this->getEventsManager()->fire('user:failedLogin', $this, ['ipAddress' => $clientIp]);
            throw new Exception('Wrong email/password combination');
        }
    }

    /**
     * Creates the remember me environment settings the related cookies
     * and generating tokens there is only remember token
     *
     * @param \Phanbook\Models\Users $user
     */
    public function setRememberEnvironment(Users $user)
    {
        $userAgent = $this->request->getUserAgent();
        $token = md5($user->getEmail() . $user->getPasswd() . $userAgent);

        $remember = new RememberTokens();
        $remember->setUsersId($user->getId());
        $remember->setToken($token);
        $remember->setUserAgent($userAgent);

        if ($remember->save()) {
            $expire = time() + $this->cookieLifetime;
            $this->cookies->set('RMU', $user->getId(), $expire);
            $this->cookies->set('RMT', $token, $expire);
        }
    }

    /**
     * Check if the session has a remember me cookie
     *
     * @return boolean
     */
    public function hasRememberMe()
    {
        return $this->cookies->has('RMU');
    }

    /**
     * Check if the session has a remember token
     *
     * @return boolean
     */
    public function hasRememberToken()
    {
        return $this->cookies->has('RMT');
    }

    /**
     * Logs on using the information in the cookies, it will call in beforeExecuteRoute
     */
    public function loginWithRememberMe()
    {
        if (!$this->hasRememberMe() || !$this->hasRememberToken() || $this->isAuthorizedVisitor()) {
            // Do nothing
            return;
        }

        $cToken = $this->cookies->get('RMT')->getValue();
        $userId = $this->cookies->get('RMU')->getValue();

        try {
            $user = $this->userService->getFirstById($userId);

            // Check if the user was flagged
            if (!$this->userService->isActiveMember($user)) {
                $this->remove();

                return;
            }
        } catch (EntityNotFoundException $e) {
            $this->remove();

            return;
        }

        $userAgent = $this->request->getUserAgent();
        $uToken    = md5($user->getEmail() . $user->getPasswd() . $userAgent);
        $userData  = [
            'usersId'   => $user->getId(),
            'userAgent' => $userAgent,
            'ipAddress' => $this->request->getClientAddress(true),
        ];

        if (strcmp($cToken, $uToken) === 0) {
            $remember = RememberTokens::findFirst([
                'usersId = ?0 AND token = ?1',
                'bind' => [$user->getId(), $uToken],
                'order' => 'createdAt DESC' // it mean only remember token
            ]);

            if ($remember) {
                // Check if the cookie has not expired
                if ((time() - $this->cookieLifetime) < $remember->getCreatedAt()) {
                    // Register identity
                    $this->setSession($user);
                    $this->getEventsManager()->fire('user:successLogin', $this, $userData);

                    return;
                }
            }
        }

        $this->cookies->get('RMU')->delete();
        $this->cookies->get('RMT')->delete();
    }

    /**
     * Returns the current identity
     *
     * @return array|null
     */
    public function getAuth()
    {
        return $this->session->get('auth');
    }

    /**
     * Returns the current identity
     *
     * @return string|null
     */
    public function getName()
    {
        if (!$this->isAuthorizedVisitor()) {
            return null;
        }

        $identity = $this->session->get('auth');

        return $identity['name'];
    }

    /**
     * Returns the current user id
     *
     * @return int|null
     */
    public function getUserId()
    {
        if (!$this->isAuthorizedVisitor()) {
            return null;
        }

        $identity = $this->session->get('auth');

        return (int) $identity['id'];
    }

    /**
     * Returns the current identity
     *
     * @return string|null
     */
    public function getFullName()
    {
        if (!$this->isAuthorizedVisitor()) {
            return null;
        }

        $identity = $this->session->get('auth');

        return $identity['fullname'];
    }

    /**
     * Returns the current identity
     *
     * @return string|null
     */
    public function getUsername()
    {
        if (!$this->isAuthorizedVisitor()) {
            return null;
        }

        $identity = $this->session->get('auth');

        return $identity['username'];
    }

    /**
     * Gets current user's email if any.
     *
     * @return string|null
     */
    public function getEmail()
    {
        if (!$this->isAuthorizedVisitor()) {
            return null;
        }

        $identity = $this->session->get('auth');

        return $identity['email'];
    }

    /**
     * Checking user is have permission admin
     *
     * @return boolean
     */
    public function isAdmin()
    {
        if (!$this->isAuthorizedVisitor()) {
            return false;
        }
        return $this->userService->isAdmin();
    }

    /**
     * @return bool
     */
    public function isModerator()
    {
        if (!$this->isAuthorizedVisitor()) {
            return false;
        }
        return $this->userService->isModerator();
    }

    /**
     * Check whether the user is authorized.
     *
     * @return bool
     */
    public function isAuthorizedVisitor()
    {
        return $this->session->has('auth');
    }

     /**
      * Checking user is have permission admin
      *
      * @return boolean
      */
    public function isTrustModeration()
    {
        return $this->isAdmin() || $this->isModerator();
    }

    /**
     * Removes the user identity information from session
     */
    public function remove()
    {
        if ($this->cookies->has('RMU')) {
            $this->cookies->get('RMU')->delete();
        }

        if ($this->cookies->has('RMT')) {
            $this->cookies->get('RMT')->delete();
        }

        $this->session->remove('auth');
    }

    /**
     * Save user session.
     *
     * @param \Phanbook\Models\Users $object
     */
    public function setSession($object)
    {
        $this->session->set(
            'auth',
            [
                'id'        => $object->getId(),
                'theme'     => $object->getTheme(),
                'name'      => $object->getFullName(),
                'fullname'  => $object->getFullName(),
                'username'  => $object->getUsername(),
                'email'     => $object->getEmail(),
            ]
        );
    }
}
