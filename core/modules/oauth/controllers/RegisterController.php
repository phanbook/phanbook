<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Oauth\Controllers;

use Phanbook\Models\Users;
use Phalcon\Mvc\DispatcherInterface;
use Phanbook\Oauth\Forms\SignupForm;
use Phanbook\Oauth\Forms\ResetPasswordForm;
use Phanbook\Oauth\Forms\ForgotPasswordForm;

/**
 * Class RegisterController
 *
 * @package Phanbook\Oauth\Controllers
 */
class RegisterController extends ControllerBase
{
    /**
     * Triggered before executing the controller/action method.
     *
     * @param  DispatcherInterface $dispatcher
     * @return bool
     */
    public function beforeExecuteRoute(DispatcherInterface $dispatcher)
    {
        if ($this->auth->hasRememberMe() && !$this->request->isPost()) {
            $this->auth->loginWithRememberMe();
        }

        if ($this->auth->isAuthorizedVisitor() && !$this->request->isPost()) {
            $this->currentRedirect();
        }

        return true;
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
        $passwordForgotHash = $this->request->getQuery('forgothash');
        if (empty($passwordForgotHash)) {
            $this->flashSession->error('Hack attempt!!!');

            return $this->response->redirect();
        }

        $object  = Users::findFirstByPasswdForgotHash($passwordForgotHash);

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
     * It will render form after user signup
     *
     */
    public function indexAction()
    {
        $registerHash = $this->request->getQuery('registerhash');


        if (empty($registerHash)) {
            $this->flashSession->error('Hack attempt!!!');

            return $this->response->redirect();
        }

        if ($this->auth->isAuthorizedVisitor()) {
            $this->view->disable();

            return $this->response->redirect();
        }

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
                $password = $this->request->getPost('password_new_confirm');

                $object->setPasswd($this->security->hash($password));
                $object->setRegisterHash(null);
                $object->setStatus(Users::STATUS_ACTIVE);
                if (!$object->save()) {
                    $this->displayModelErrors($object);
                } else {
                    $this->flashSession->success(t('Your password was changed successfully.'));

                    //Assign to session
                    $this->auth->check(
                        [
                            'email' => $object->getEmail(),
                            'password' => $password,
                            'remember' => true
                        ]
                    );

                    return $this->response->redirect();
                }
            }
        }
        $this->view->pick('register/resetpassword');
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function signupAction()
    {
        if ($this->auth->isAuthorizedVisitor()) {
            return $this->response->redirect();
        }

        $form = new SignupForm;

        if ($this->request->isPost()) {
            $object = new Users();
            $form->bind($this->request->getPost(), $object);

            if (!$form->isValid($this->request->getPost())) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
                return $this->currentRedirect();
            }

            $registerHash = md5(uniqid(rand(), true));
            $randomPasswd = substr(md5(microtime()), 0, 7);

            $object->setPasswd($this->security->hash($randomPasswd));
            $object->setRegisterhash($registerHash);
            $object->setStatus(Users::STATUS_PENDING);
            $object->setGender(Users::GENDER_UNKNOWN);

            if (!$object->save()) {
                $this->displayModelErrors($object);
                return $this->currentRedirect();
            }

            $scheme = $this->request->isSecure() ? 'https://' : 'http://';
            $params = [
                'link' => $scheme . $this->request->getHttpHost() . '/oauth/register?registerhash=' . $registerHash
            ];

            if (!$this->mail->send($object->getEmail(), 'registration', $params)) {
                $this->flashSession->error(t('Error sending registration email.'));
            } else {
                $this->flashSession->success(
                    t(
                        'Your account was successfully created. ' .
                        'An email was sent to your address in order to continue the process.'
                    )
                );
            }

            return $this->response->redirect();
        }

        $this->view->setVar('form', $form);
    }

        /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function forgotpasswordAction()
    {
        // Resets any "template before" layouts because we use multiple theme
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
                    return $this->currentRedirect();
                }
                $lastpass = $object->getLastPasswdReset();
                if (!empty($lastpass)
                    && (date('Y-m-d H:i:s') - $object->getLastPasswdReset())> $this->config->application->passwdResetInterval //password reset interval on configuration
                ) {
                    $this->flashSession->error(
                        t('You need to wait ') . (date('Y-m-d H:i:s') - $object->getLastPasswdReset()) . ' minutes'
                    );
                    return $this->currentRedirect();
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
                                        . '/oauth/resetpassword?forgothash=' . $passwordForgotHash
                    ];
                    if (!$this->mail->send($object->getEmail(), 'forgotpassword', $params)) {
                        $this->flashSession->error(t('Error sending email.'));
                    } else {
                        $this->flashSession->success(
                            t('An email was sent to your address in order to continue with the reset password process.')
                        );

                        return $this->response->redirect();
                    }
                }
            }
        }
        $this->view->form = $form;
    }
}
