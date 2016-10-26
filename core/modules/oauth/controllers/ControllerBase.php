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

use Phalcon\Mvc\Controller;
use Phanbook\Models\Users;
use Phanbook\Models\Karma;

/**
 * Class TestsController
 *
 * @package Phanbook\Frontend\Controllers
 */
class ControllerBase extends Controller
{
    public function initialize()
    {
        $this->loadDefaultAssets();
    }

    /**
     * Set a flash message with messages from objects
     *
     * @param $object
     */
    public function displayModelErrors($object)
    {
        if (is_object($object) && method_exists($object, 'getMessages')) {
            foreach ($object->getMessages() as $message) {
                $this->flashSession->error($message);
            }
        } else {
            $this->flashSession->error(t('No object found. No errors.'));
        }
    }

    /**
     * @param string $uid       to checking condition when authentication again
     * @param object $user      here is oauth
     * @param object $token     here it is token get by oauth
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
            $uuidName  = 'setUuid' . $nameOauth;
            $tokenName = 'setToken'. $nameOauth;
            $object->$tokenName($token->accessToken);
            $object->setTokenType(Users::TOKEN_TYPE);
            //$object->setUid($uid);
            $object->$uuidName($uid);
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
            if (!$object->save()) {
                $this->displayModelErrors($object);
                return $this->indexRedirect();
            }
        }
        //Update session id
        session_regenerate_id(true);



        //Store the user data in session
        $this->auth->setSession($object);

        //Store the user data in cookies
        $this->auth->setRememberEnviroment($object);

        //Display notification when user login
        $this->notification($object);

        return $this->currentRedirect();
    }

    public function currentRedirect()
    {
        if ($this->cookies->has('HTTPBACK')) {
            $url   = $this->cookies->get('HTTPBACK');
            $clone = clone $url;
            $url->delete();

            return $this->response->redirect(unserialize($clone->getValue()));
        }
        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    public function indexRedirect()
    {
        return $this->response->redirect('oauth/login');
    }

    /**
     * loadDefaultAssets function.
     *
     * @access private
     * @return void
     */
    private function loadDefaultAssets()
    {
        $this->assets
            ->addCss('core/assets/css/bootstrap.min.css')
            ->addCss('core/assets/css/font-awesome.min.css')
            ->addCss('oauth/assets/css/app.css')
            ->addCss('core/assets/css/icheck/blue.css')
        ;
        $this->assets
            ->addJs('core/assets/js/jquery.js')
            ->addJs('core/assets/js/icheck/icheck.min.js')
            ->addJs('oauth/assets/js/app.js')
        ;
    }
}
