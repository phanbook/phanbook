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
namespace Phanbook\Frontend\Controllers;

use Phanbook\Models\Posts;
use Phanbook\Models\Users;
use Phanbook\Models\Subscribe;
use Phanbook\Models\PostsSubscribers;

/**
 * Class SubcribeController
 */
class SubscribeController extends ControllerBase
{
    /**
     * Subscribe to a post to receive e-mail notifications
     *
     * @return mixed
     */
    public function indexAction()
    {
        $this->view->disable();
        $this->setJsonResponse();

        if (!$this->request->isPost()) {
            return false;
        }

        //Find the post by Id
        $post = Posts::findFirstById($this->request->getPost('objectId'));
        if (!$post) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => 'The Post does not exist'
            ];
            return $this->jsonMessages;
        }

        /**
        * Sometime We need to get object User login, so I do check user like below
        * By the way, you can checking session
        *
        * {code} Users::findFirstById($this->auth->getAuth()['id'] {/code}
        */
        $userId = $this->auth->getAuth()['id'];
        if (!$userId) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => 'You must log in first to subscribe post'
            ];
            return $this->jsonMessages;
        }
        $subscription = PostsSubscribers::findFirst(
            [
            'postsId = ?0 AND usersId = ?1',
            'bind' => [$post->getId(), $userId]
            ]
        );
        if (!$subscription) {
            $subscription = new PostsSubscribers();
            $subscription->setPostsId($post->getId());
            $subscription->setUsersId($userId);
            if (!$subscription->save()) {
                foreach ($subscription->getMessages() as $message) {
                    error_log('Subscribe save false '. $message->getMessage() . __LINE__ .'and'. __CLASS__);
                }
            }
            $this->jsonMessages['messages'][] = [
                'type'    => 'info',
                'content' => 'You have just subscribe post',
                'flag'    => 1
            ];
            return $this->jsonMessages;
        } else {
            //unsubsribe posts
            if (!$subscription->delete()) {
                foreach ($subscription->getMessages() as $message) {
                    error_log('Unsubscribe delete false '. $message->getMessage() . __LINE__ .'and'. __CLASS__);
                }
            }
            $this->jsonMessages['messages'][] = [
                'type'    => 'info',
                'content' => 'You have just unsubscribe post'
            ];
            return $this->jsonMessages;
        }
    }
    /**
     * Get the weekly newsletter!
     * @todo   implement
     * @return mixed
     */
    public function weeklyAction()
    {
        if (!$this->request->isPost()) {
            return false;
        }
        $email = $this->request->getPost('email');
        if (!$email) {
            $this->flashSession->error(t('Please input your Emai'));
            return $this->indexRedirect();
        }
        $subscribe = new Subscribe();
        $subscribe->setStatus('Y');
        $subscribe->setEmail($email);

        if (!$subscribe->save()) {
            foreach ($subscribe->getMessages() as $message) {
                $this->flashSession->error($message);
                return $this->indexRedirect();
            }
        }
        $this->flashSession->success(t('Thank you for subscribing to our newsletter'));
        return $this->indexRedirect();
    }
}
