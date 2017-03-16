<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Oauth\Controllers;

use Phanbook\Models\Users;
use Phalcon\Mvc\DispatcherInterface;
use Phanbook\Oauth\Forms\SignupForm;
use Phanbook\Models\Services\Service;
use Phanbook\Oauth\Forms\ResetPasswordForm;
use Phanbook\Oauth\Forms\ForgotPasswordForm;
use Phanbook\Models\Services\Exceptions\EntityException;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

/**
 * Class RegisterController
 *
 * @package Phanbook\Oauth\Controllers
 */
class RegisterController extends ControllerBase
{
    /**
     * @var Service\User
     */
    protected $userService;

    public function inject(Service\User $userService)
    {
        $this->userService = $userService;
    }

    /**
     * Triggered before executing the controller/action method.
     *
     * @param  DispatcherInterface $dispatcher
     * @return bool
     */
    public function beforeExecuteRoute(DispatcherInterface $dispatcher)
    {
        if ($this->auth->hasRememberMe()) {
            $this->auth->loginWithRememberMe();
        }

        if ($this->auth->isAuthorizedVisitor()) {
            $this->response->redirect();
        }

        return true;
    }

    public function resetpasswordAction()
    {
        $forgotHash = $this->request->getQuery('forgothash');

        if (empty($forgotHash)) {
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'for'        => 'frontend',
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        if (!$user = $this->userService->findFirstByPasswdForgotHash($forgotHash)) {
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'for'        => 'frontend',
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $form = new ResetPasswordForm();

        if ($this->request->isPost()) {
            if (!$form->isValid($this->request->getPost())) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $password = $this->request->getPost('password_new_confirm');

                try {
                    $this->userService->assignNewPassword($user, $password);
                    $this->flashSession->success(t('Your password was changed successfully.'));
                    $this->response->redirect();

                    return;
                } catch (EntityException $e) {
                    $this->flashSession->error($e->getMessage());
                }
            }
        }

        $this->view->setVar('form', $form);
    }

    public function indexAction()
    {
        $registerHash = $this->request->getQuery('registerhash');

        if (empty($registerHash)) {
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'for'        => 'frontend',
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        if (!$user = $this->userService->findFirstByRegisterHash($registerHash)) {
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'for'        => 'frontend',
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $form = new ResetPasswordForm();

        if ($this->request->isPost()) {
            if (!$form->isValid($this->request->getPost())) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                $password = $this->request->getPost('password_new_confirm');

                try {
                    $this->userService->confirmRegistration($user, $password);
                    $this->flashSession->success(t('Your password was changed successfully.'));
                    $this->response->redirect();

                    return;
                } catch (EntityException $e) {
                    $this->flashSession->error($e->getMessage());
                }
            }
        }

        $this->view->setVar('form', $form);
        $this->view->pick('register/resetpassword');
    }

    public function signupAction()
    {
        $form = new SignupForm();

        if ($this->request->isPost()) {
            $user = new Users();
            $form->bind($this->request->getPost(), $user, ['firstname', 'lastname', 'email', 'username']);

            if (!$form->isValid()) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                try {
                    $params = $this->userService->registerNewMemberOrFail($user);

                    if (!$this->mail->send($user->getEmail(), 'registration', $params)) {
                        $this->flashSession->error(t('err_send_registration_email'));
                    } else {
                        $this->flashSession->success(t('account_successfully_created'));
                        $this->response->redirect();

                        return;
                    }
                } catch (EntityException $e) {
                    $this->flashSession->error($e->getMessage());
                }
            }
        }

        $this->view->setVar('form', $form);
    }

    public function forgotpasswordAction()
    {
        $this->view->cleanTemplateBefore();

        $form = new ForgotPasswordForm();

        if ($this->request->isPost()) {
            if (!$form->isValid($this->request->getPost())) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message);
                }
            } else {
                try {
                    $user = $this->userService->getFirstByEmail($this->request->getPost('email', 'email'));
                    $params = $this->userService->resetPassword($user);

                    if (!$this->mail->send($user->getEmail(), 'forgotpassword', $params)) {
                        $this->flashSession->error(t('err_send_reset_passwd_email'));
                    } else {
                        $this->flashSession->success(t('an_email_with_reset_pass_was_sent'));
                        $this->response->redirect();

                        return;
                    }
                } catch (EntityNotFoundException $e) {
                    $this->response->setStatusCode(422);
                    $this->flashSession->error(t('user_not_exist'));

                    $userData = [
                        'usersId'   => null,
                        'userAgent' => $this->request->getUserAgent(),
                        'ipAddress' => $this->request->getClientAddress(true),
                    ];

                    $this->getDI()->getShared('eventsManager')->fire('user:failedLogin', $this, $userData);
                } catch (EntityException $e) {
                    $this->flashSession->error($e->getMessage());
                }
            }
        }

        $this->view->setVar('form', $form);
    }
}
