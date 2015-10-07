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
namespace Phanbook\Oauth\Controllers;

use Phanbook\Oauth\Forms\LoginForm;
use Phanbook\Oauth\Forms\SignupForm;
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
class LoginController extends ControllerBase
{
    public function githubAction()
    {
        $this->view->disable();
        if (!$this->auth->getAuth()) {
            $config= $this->config->github;
            // if (!isset($config)) {
            //     $this->flashSession->error(t('You need add config github token'));
            // }
            $auth = new GithubAuth($config);
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
     * @return \Phalcon\Http\ResponseInterface
     */
    public function indexAction()
    {
        $this->session->set('urlCurrent', $this->request->getHTTPReferer());
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
        $this->view->loginForm  = $form;
        $this->view->signupForm = new SignupForm;
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
        }
    }
}
