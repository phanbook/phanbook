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
namespace Phanbook\Auth;

use Phalcon\Mvc\User\Component;
use Phanbook\Models\Users;
use Phanbook\Models\RememberTokens;
use Phanbook\Models\SuccessLogins;
use Phanbook\Models\FailedLogins;

/**
 * \Phanbook\Auth\Auth
 *
 * Manages Authentication/Identity Management in Phanbook
 *
 * @package Phanbook\Auth
 */
class Auth extends Component
{
    /**
     * Checks the user credentials
     *
     * @param  array $credentials
     * @return boolean
     */
    public function check(array $credentials)
    {

        // Check if the user exist
        $user = Users::findByEmailOrUsername($credentials['email']);
        if (!$user) {
            $this->registerUserThrottling(0);
            $this->flashSession->error(t('Wrong email/password combination!'));
            return false;
        }

        // Check the password
        if (!$this->security->checkHash($credentials['password'], $user->getPasswd())) {
            //$this->registerUserThrottling($user->id);
            $this->flashSession->error(t('Wrong email/password combination!'));
            return false;
        }

        // Check if the user was flagged
        $this->checkUserFlags($user);

        // Register the successful login
        $this->saveSuccessLogin($user);

        // Check if the remember me was selected
        if (isset($credentials['remember'])) {
            $this->setRememberEnvironment($user);
        }

        $this->setSession($user);
        return true;
    }

    /**
     * Creates the remember me environment settings the related cookies and generating tokens
     *
     * @param \Phanbook\Models\Users $user
     */
    public function saveSuccessLogin(Users $user)
    {
        $successLogin = new SuccessLogins();
        $successLogin->setUsersId($user->getId());
        $successLogin->setIpaddress($this->request->getClientAddress());
        $successLogin->setUserAgent($this->request->getUserAgent());
        if (!$successLogin->save()) {
            $messages = $successLogin->getMessages();
            error_log('saveSuccessLogin false ' . __LINE__. ' and ' . __CLASS__ . $messages[0]);
            return false;
        }
    }

    /**
     * Implements login throttling
     * Reduces the effectiveness of brute force attacks
     *
     * @param int $userId
     */
    public function registerUserThrottling($userId)
    {
        $failedLogin = new FailedLogins();
        $failedLogin->setUsersId($userId);
        $failedLogin->setIpaddress($this->request->getClientAddress());
        $failedLogin->setAttempted(time());
        $failedLogin->save();

        $attempts = FailedLogins::count(
            array(
            'ipAddress = ?0 AND attempted >= ?1',
            'bind' => array(
                $this->request->getClientAddress(),
                time() - 3600 * 6
            )
            )
        );

        switch ($attempts) {
            case 1:
            case 2:
                // no delay
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
            $expire = time() + $this->config->application->cookieLifetime;
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
     * Logs on using the information in the cookies, it will call in beforeExecuteRoute
     *
     * @return \Phalcon\Http\Response
     */
    public function loginWithRememberMe()
    {
        $userId = $this->cookies->get('RMU')->getValue();
        $cookieToken = $this->cookies->get('RMT')->getValue();

        $user = Users::findFirstById($userId);
        if ($user) {
            $userAgent = $this->request->getUserAgent();
            $token = md5($user->getEmail() . $user->getPasswd() . $userAgent);

            if ($cookieToken == $token) {
                $remember = RememberTokens::findFirst(
                    [
                    'usersId = ?0 AND token = ?1',
                    'bind' => [ $user->getId(), $token ],
                    'order' => 'createdAt DESC' //it mean only remember token
                    ]
                );
                if ($remember) {
                    // Check if the cookie has not expired
                    if ((time() - $this->config->application->cookieLifetime) < $remember->getCreatedAt()) {
                        // Register identity
                        $this->setSession($user);
                        // Register the successful login
                        $this->saveSuccessLogin($user);
                        // Check if the user was flagged
                        if (!$this->checkUserFlags($user)) {
                            $this->flashSession->error('banned');
                            $this->remove();
                        }
                    } else {
                        $this->cookies->get('RMU')->delete();
                        $this->cookies->get('RMT')->delete();
                    }
                }
            }
        }
    }

    /**
     * Checks if the user is banned/inactive/suspended
     *
     * @param  \Phanbook\Models\Users $user
     * @return bool
     */
    public function checkUserFlags(Users $user)
    {
        return ($user->getStatus() == Users::STATUS_ACTIVE);
    }

    /**
     * Returns the current identity
     *
     * @return array
     */
    public function getAuth()
    {
        return $this->session->get('auth');
    }

    /**
     * Returns the current identity
     *
     * @return string
     */
    public function getName()
    {
        $identity = $this->session->get('auth');
        return $identity['name'];
    }
    /**
     * Returns the current user id
     *
     * @return int
     */
    public function getUserId()
    {
        if (!$this->session->has('auth')) {
            return null;
        }
        $identity = $this->session->get('auth');
        return (int) $identity['id'];
    }
    /**
     * Returns the current identity
     *
     * @return string
     */
    public function getFullName()
    {
        $identity = $this->session->get('auth');
        return $identity['fullname'];
    }

    /**
     * Returns the current identity
     *
     * @return string
     */
    public function getUsername()
    {
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
        if (!$this->session->has('auth')) {
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
        $identity = $this->session->get('auth');

        return ($identity['admin'] == 'Y');
    }
    public function isModerator()
    {
        $identity = $this->session->get('auth');

        return ($identity['moderator'] == 'Y');
    }
    public function isLogin()
    {
        return $this->session->get('auth') ? :false;
    }
     /**
     * Checking user is have permission admin
     *
     * @return boolean
     */
    public function isTrustModeration()
    {
        $identity = $this->session->get('auth');
        if ($identity['admin'] == 'Y') {
            return true;
        }
        if ($identity['moderator'] == 'Y') {
            return true;
        }
        return false;
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
        $this->cookies->get('RMT')->delete();
        $this->cookies->get('RMU')->delete();


        $this->session->remove('auth');
    }

    /**
     * Authorize the user by his/her id
     *
     * @param int $id
     * @return Users|bool
     */
    public function authUserById($id)
    {
        $user = Users::findFirstById($id);
        if (!$user) {
            error_log('The user does not exist');
            return false;
        }
        return $user;
    }

    /**
     * Get the entity related to user in the active identity
     *
     * @return \Phanbook\Models\Users
     */
    public function getUser()
    {
        $identity = $this->session->get('auth');
        if (!isset($identity['id'])) {
            return false;
        }

        $user = Users::findFirstById($identity['id']);
        if (!$user) {
            error_log('The user does not exist' . __CLASS__ . ' and '. __LINE__);
            return false;
        }
        return $user;
    }
    /**
     * Check condition to allow comment or vote
     *
     * @return mixed
     */
    public function getVote()
    {
        $identity = $this->session->get('auth');
        if (!isset($identity['id'])) {
            return false;
        }

        $user = Users::findFirstById($identity['id']);
        if (!$user) {
            error_log('The user does not exist' . __CLASS__ . ' and '. __LINE__);
            return false;
        }

        return $user->getVote();
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
                'admin'     => $object->getAdmin(),
                'moderator' => $object->getModerator(),
                'theme'     => $object->getTheme(),
                'name'      => $object->getInforUser(),
                'fullname'  => $object->getFullName(),
                'username'  => $object->getUsername(),
                'email'     => $object->getEmail(),
            ]
        );
    }
}
