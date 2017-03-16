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
namespace Phanbook\Oauth\Controllers;

use Phalcon\Mvc\Model;
use Phanbook\Models\Users;
use Phanbook\Oauth\Forms\LoginForm;
use Phalcon\Mvc\DispatcherInterface;
use Phanbook\Github\Auth as GithubAuth;
use Phanbook\Google\Auth as GoogleAuth;
use Phanbook\Facebook\Auth as FacebookAuth;
use Phanbook\Auth\Exception as AuthException;

/**
 * \Phanbook\Oauth\Controllers\LoginController
 *
 * @package Phanbook\Oauth\Controllers
 */
class LoginController extends ControllerBase
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
     * @return array|\Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function githubAction()
    {
        $this->view->disable();
        if (!$this->auth->isAuthorizedVisitor()) {
            $config= $this->config->github;
            $auth = new GithubAuth($config);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->currentRedirect();
    }

    /**
     * @return array|\Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function googleAction()
    {
        $this->view->disable();
        if (!$this->auth->isAuthorizedVisitor()) {
            $auth = new GoogleAuth($this->config->google);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->indexRedirect();
    }

    /**
     * @return array|\Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function facebookAction()
    {
        $this->view->disable();
        if (!$this->auth->isAuthorizedVisitor()) {
            $auth = new FacebookAuth($this->config->facebook);
            return $auth->authorize();
        }
        $this->flashSession->success(t('Welcome back '. $this->auth->getName()));
        return $this->indexRedirect();
    }

    public function twitterAction()
    {
        //@todo later because Twitter use oauth v1
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
            //Edit/Create the user because token github not change every time
            //$object = Users::findFirstByTokenGithub($token->accessToken);

            //Now it change every time
            $object = Users::findFirstByUuidGithub($uid);

            $this->commonOauthSave($uid, $user, $token, $object, 'Github');
        } else {
            $this->flashSession->error('Invalid Github response. Please try again');
            return $this->response->redirect();
        }
    }

    /**
     * @return \Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function tokenGoogleAction()
    {
        $this->view->disable();
        $auth = new GoogleAuth($this->config->google);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token) && isset($uid)) {
            //Edit/Create the user
            $object = Users::findFirstByUuidGoogle($uid);
            $this->commonOauthSave($uid, $user, $token, $object, 'Google');
        } else {
            $this->flashSession->error('Invalid Google response. Please try again');
            return $this->response->redirect();
        }
    }

    /**
     * @return \Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function tokenFacebookAction()
    {
        $this->view->disable();
        $auth = new FacebookAuth($this->config->facebook);
        list($uid, $token, $user) = $auth->authorize();
        if (isset($token) && is_object($token)) {
            //Edit/Create the user
            $object = Users::findFirstByUuidFacebook($uid);
            $this->commonOauthSave($uid, $user, $token, $object, 'Facebook');
        } else {
            $this->flashSession->error('Invalid Google response. Please try again');
            return $this->response->redirect();
        }
    }

    public function indexAction()
    {
        if ($this->auth->isAuthorizedVisitor()) {
            $this->view->disable();

            return $this->response->redirect();
        }

        $url = $this->request->getHTTPReferer();
        if (!empty($url)) {
            $url = $this->url->get(['for' => 'signin'], null, null, env('APP_URL') . '/');

            if ($this->cookies->has('HTTPBACK')) {
                $this->cookies->delete('HTTPBACK');
            }

            $this->cookies->set('HTTPBACK', serialize($url));
        }

        $form = new LoginForm;

        try {
            if ($this->request->isPost()) {
                if (!$form->isValid($this->request->getPost())) {
                    $messages = [];
                    foreach ($form->getMessages() as $message) {
                        $messages[] = $message;
                    }

                    $this->flashSession->error(implode('<br>', $messages));
                } else {
                    $this->auth->check([
                        'email'    => $this->request->getPost('email'),
                        'password' => $this->request->getPost('password'),
                        'remember' => true,
                    ]);

                    $this->flashSession->success(t('Welcome back '. $this->auth->getName()));

                    return $this->currentRedirect();
                }
            }
        } catch (AuthException $e) {
            $this->response->setStatusCode(422);
            $this->flashSession->error(t($e->getMessage()));
        }

        $this->view->setVar('form', $form);
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
            $this->flashSession->success('Welcome ' . $object->getFullName());
        } else {
            $this->flashSession->success('Welcome back ' . $object->getFullName());
        }
    }
}
