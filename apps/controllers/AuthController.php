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
namespace Phanbook\Controllers;

use Phanbook\Forms\LoginForm;
use Phanbook\Forms\SignupForm;
use Phanbook\Forms\ForgotPasswordForm;
use Phanbook\Forms\ResetPasswordForm;
use Phanbook\Models\Users;
use Phalcon\Mvc\Model;
use Phanbook\Github\Auth as GithubAuth;
use Phanbook\Google\Auth as GoogleAuth;
use Phanbook\Twitter\Auth as TwitterAuth;
use Phanbook\Facebook\Auth as FacebookAuth;
use Phanbook\Models\Karma;
use Phanbook\Models\RememberTokens;
use Phanbook\Models\NotificationsBounces;

/**
 * AuthController class.
 *
 * @extends ControllerBase
 */
class AuthController extends ControllerBase
{
    public function githubAction()
    {
        $this->view->disable();
        if (!$this->auth->getAuth()) {
            $auth = new GithubAuth($this->config->github);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->currentRedirect();
    }
    public function googleAction()
    {
        $this->view->disable();
        if (!$this->auth->getAuth()) {
            $auth = new GoogleAuth($this->config->google);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->indexRedirect();
    }
    public function facebookAction()
    {
        $this->view->disable();
        if (!$this->auth->getAuth()) {
            $auth = new FacebookAuth($this->config->facebook);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->indexRedirect();
    }
    public function twitterAction()
    {
        //@todo later because Twitter use oauth v1
        $this->view->disable();
        if (!$this->auth->getAuth()) {
            $auth = new TwitterAuth($this->config->twitter);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->indexRedirect();
    }
    /**
     *
     * @return \Phalcon\Http\ResponseInterface
     */
    public function tokenGithubAction()
    {
        $this->view->disable();
        $auth = new GithubAuth($this->config->github);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token) && isset($uid)) {
            //Edit/Create the user because token github not change everytime
            $object = Users::findFirstByTokenGithub($token->accessToken);
            $this->commonOauthSave($uid, $user, $token, $object, 'Github');
        } else {
            $this->flashSession->error('Invalid Github response. Please try again');
            return $this->response->redirect();
        }
    }
    public function tokenGoogleAction()
    {
        $this->view->disable();
        $auth = new GoogleAuth($this->config->google);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token) && isset($uid)) {
            //Edit/Create the user
            $object = Users::findFirstByUid($uid);
            $this->commonOauthSave($uid, $user, $token, $object, 'Google');
        } else {
            $this->flashSession->error('Invalid Google response. Please try again');
            return $this->response->redirect();
        }
    }
    public function tokenFacebookAction()
    {
        $this->view->disable();
        $auth = new FacebookAuth($this->config->facebook);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token)) {
            //Edit/Create the user
            $object = Users::findFirstByUid($uid);
            $this->commonOauthSave($uid, $user, $token, $object, 'Facebook');
        } else {
            $this->flashSession->error('Invalid Google response. Please try again');
            return $this->response->redirect();
        }
    }
    public function tokenTwitterkAction()
    {
        $this->view->disable();
        $auth = new TwitterAuth($this->config->twitter);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token)) {
            //Edit/Create the user
            $object = Users::findFirstByUid($uid);
            $this->commonOauthSave($uid, $user, $token, $object, 'Facebook');
        } else {
            $this->flashSession->error('Invalid Google response. Please try again');
            return $this->response->redirect();
        }
    }

    /**
     * @param string $uid       to checking condition when authentication again
     * @param object $user      here is oauth
     * @param object $toekn     here it is token get by oauth
     * @param object $object    here is it is find in database
     * @param string $nameOauth there are google, github, facebook...
     *
     * @return mixed
     */
    public function commonOauthSave($uid, $user, $token, $object, $nameOauth)
    {
        if (!$object) {
            $object = new Users();
            //setTokenGithub or setTokenGoogle
            $tokenName = 'setToken'. $nameOauth;
            $object->$tokenName($token->accessToken);
            $object->setTokenType(Users::TOKEN_TYPE);
            $object->setUid($uid);
            $object->setEmail($user->email);
            $object->setFirstname($user->firstName);
            //@ Todo later, it perfect if we do haven't delete in database
            $username = 'users' . (Users::count() + 1);
            $object->setUsername($username);
            if (empty($user->email)) {
                $object->setEmail($username .'+@phalconbook.com');
            }
            $object->setStatus(Users::STATUS_ACTIVE);
            $object->increaseKarma(Karma::LOGIN);
        }
        //Update session id
        session_regenerate_id(true);

        if (!$object->save()) {
            $this->displayModelErrors($object);
            return $this->indexRedirect();
        }

        //Store the user data in session
        $this->auth->setSession($object);

        //Store the user data in cookies
        $this->auth->setRememberEnviroment($object);

        //Dispaly notification when user login
        $this->notification($object);

        return $this->currentRedirect();
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function loginAction()
    {
        $this->session->set('urlCurrent', $this->request->getHTTPReferer());
        //Resets any "template before" layouts because we use mutiple theme
        $this->view->cleanTemplateBefore();
        if ($this->auth->getAuth()) {
            $this->view->disable();

            return $this->response->redirect();
        }

        $form = new LoginForm;

        try {
            if ($this->request->isPost()) {
                if (!$form->isValid($this->request->getPost())) {
                    foreach ($form->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                    }
                } else {
                    $this->auth->check(
                        [
                        'email' => $this->request->getPost('email'),
                        'password' => $this->request->getPost('password'),
                        'remember' => true
                        ]
                    );
                }
            }
        } catch (\Exception $e) {
            $this->flashSession->error($e->getMessage());
        }
        $this->assets->addCss('css/login.css');
        $this->view->loginForm  = $form;
        $this->view->signupForm = new SignupForm;
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function signupAction()
    {
        $this->view->disable();
        if ($this->auth->getAuth()) {
            return $this->response->redirect();
        }

        $form = new SignupForm;

        if ($this->request->isPost()) {
            $object = new Users();
            $form->bind($_POST, $object);

            if (!$form->isValid($_POST)) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $registerHash = md5(uniqid(rand(), true));
                $randomPasswd = substr(md5(microtime()), 0, 7);

                $object->setPasswd($this->security->hash($randomPasswd));
                $object->setRegisterhash($registerHash);
                $object->setStatus(Users::STATUS_PENDING);
                $object->setGender(Users::GENDER_UNKNOWN);

                if (!$object->save()) {
                    $this->displayModelErrors($object);
                    return $this->response->redirect('login');
                } else {
                    $params = [
                        'link'      => ($this->request->isSecureRequest()
                                ? 'https://' : 'http://') . $this->request->getHttpHost()
                            . '/auth/register/' . $registerHash
                    ];
                    if (!$this->mail->send($object->getEmail(), 'registration', $params)) {
                        error_log('Email not sent' . $object->getEmail());
                        $this->flashSession->error(t('Error sending registration email.'));
                    } else {
                        $this->flashSession->success(
                            t(
                                'Your account was successfully created.
                                An email was sent to your address in order to continue the process.'
                            )
                        );
                    }

                    return $this->response->redirect();
                }
            }
        }
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function forgotpasswordAction()
    {
        //Resets any "template before" layouts because we use mutiple theme
        $this->view->cleanTemplateBefore();
        if ($this->session->has('auth')) {
            $this->view->disable();

            return $this->response->redirect();
        }

        $form = new ForgotPasswordForm;

        if ($this->request->isPost()) {
            if (!$form->isValid($_POST)) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $object = Users::findFirstByEmail($this->request->getPost('email'));
                if (!$object) {
                    // @TODO: Implement brute force protection
                    $this->flashSession->error(t('User not found.'));

                    return $this->response->redirect('auth/forgotpassword');
                }
                $lastpass = $object->getLastPasswdReset();
                if (!empty($lastpass)
                    && (date('Y-m-d H:i:s') - $object->getLastPasswdReset())> $this->config->application->passwdResetInterval //password reset interval on configuration
                ) {
                    $this->flashSession->error(
                        t('You need to wait ') . (date('Y-m-d H:i:s') - $object->getLastPasswdReset()) . ' minutes'
                    );

                    return $this->response->redirect('auth/forgotpassword');
                }

                $passwordForgotHash = sha1('forgot' . microtime());
                $object->setPasswdForgotHash($passwordForgotHash);
                $object->setLastPasswdReset(date('Y-m-d H:i:s'));

                if (!$object->save()) {
                    $this->displayModelErrors($object);
                } else {
                    $params = [
                        'firstname' => $object->getFirstname(),
                        'lastname'  => $object->getLastname(),
                        'link'      => ($this->request->isSecureRequest()
                                ? 'https://' : 'http://') . $this->request->getHttpHost()
                            . '/auth/resetpassword/' . $passwordForgotHash
                    ];
                    if (!$this->mail->send($object->getEmail(), 'forgotpassword', $params)) {
                        $this->flashSession->error(t('Error sendig email.'));
                    } else {
                        $this->flashSession->success(
                            t('An email was sent to your address in order to continue with the reset password process.')
                        );

                        return $this->response->redirect();
                    }
                }
            }
        }
        $this->assets->addCss('css/login.css');
        $this->view->form = $form;
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function resetpasswordAction()
    {
        if ($this->session->has('auth')) {
            $this->view->disable();

            return $this->response->redirect();
        }

        if (empty($this->dispatcher->getParams()[0])) {
            $this->flashSession->error('Hack attempt!!!');

            return $this->response->redirect();
        }

        $passwordForgotHash = $this->router->getParams()[0];
        $object             = Users::findFirstByPasswdForgotHash($passwordForgotHash);

        if (!$object) {
            $this->flashSession->error(t('Invalid data.'));

            return $this->response->redirect();
        }

        $form             = new ResetPasswordForm;
        $this->view->form = $form;

        if ($this->request->isPost()) {
            if (!$form->isValid($_POST)) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $object->setPasswd($this->security->hash($this->request->getPost('password_new_confirm')));
                $object->setPasswdForgotHash(null);
                if (!$object->save()) {
                    $this->displayModelErrors($object);
                } else {
                    $this->flashSession->success(t('Your password was changed successfully.'));

                    return $this->response->redirect();
                }
            }
        }
    }

    /**
     * logoutAction
     *
     * @return void
     */
    public function logoutAction()
    {
        // Destroy the whole session
        $this->auth->remove();
        $this->view->disable();
        $this->response->redirect();
    }

    /**
     * registerAction function.
     *
     * @access public
     * @return void
     */
    public function registerAction()
    {
        if (empty($this->router->getParams()[0])) {
            $this->flashSession->error('Hack attempt!!!');

            return $this->response->redirect('/');
        }

        if ($this->auth->getAuth()) {
            $this->view->disable();

            return $this->response->redirect();
        }

        $registerHash = $this->router->getParams()[0];
        $object         = Users::findFirstByRegisterHash($registerHash);

        if (!$object) {
            $this->flashSession->error('Invalid data.');

            return $this->response->redirect();
        }

        $form             = new ResetPasswordForm;
        $this->view->form = $form;

        if ($this->request->isPost()) {
            if (!$form->isValid($_POST)) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $object->setPasswd($this->security->hash($this->request->getPost('password_new_confirm')));
                $object->setRegisterHash(null);
                $object->setStatus(Users::STATUS_ACTIVE);
                if (!$object->save()) {
                    $this->displayModelErrors($object);
                } else {
                    $this->flashSession->success(t('Your password was changed successfully.'));

                    return $this->response->redirect();
                }
            }
        }

        $this->view->pick(['auth/resetpassword']);
    }

    /**
     * unauthorizedAction
     *
     * @return void
     */
    public function unauthorizedAction()
    {
        $this->response->setStatusCode(401, 'Unauthorized');
        $this->view->disable();
    }

    /**
     * Method indexAction
     *
     * @return void
     */
    public function forbiddenAction($object)
    {
        $this->response->setHeader(403, 'Forbidden');
    }
    /**
     * Display notification
     */
    public function notification($object)
    {
        if ($object->getOperationMade() == Model::OP_CREATE) {
            $this->flashSession->success('Welcome ' . $object->getInforUser());
        } else {
            $email = $object->getEmail();
            $this->flashSession->success('Welcome back ' . $object->getInforUser());
            //Show a notification to users that have e-mail bounces
            /*$parametersBounces = [
                'email = ?0 AND reported = "N"',
                'bind' => array($email)
            ];
            $bounces = NotificationsBounces::find($parametersBounces);

            if (count($bounces)) {
                foreach ($bounces as $bounce) {
                    $bounce->setReported('Y');
                    $bounce->save();
                }

                $messageFailid
                    = 'We have failed to deliver you some email notifications,'
                    . ' this might be caused by an invalid email associated to your Github account or '
                    . 'its mail server is rejecting our emails. Your current e-mail is: '
                    . $this->escaper->escapeHtml($email);

                $this->flashSession->notice($messageFailid);

                $parametersBouncesMax = [
                    'email = ?0 AND created_at >= ?1',
                    'bind' => array($email, time() - 86400 * 7)
                ];

                $bounces = NotificationsBounces::find($parametersBouncesMax);

                if (count($bounces) >= NotificationsBounces::MAX_BOUNCES) {
                    $messageRepeat
                        = 'Due to a repeated number of email bounces we have disabled email '
                        . 'notifications for your email. You can re-enable them in your settings';
                    $this->flashSession->notice($messageRepeat);
                    $object->notifications = 'N';
                    $object->save();
                }
            }*/
        }
    }
}
