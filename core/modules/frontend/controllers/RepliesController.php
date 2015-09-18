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
namespace Phanbook\Frontend\Controllers;

use Phanbook\Models\Posts;
use Phanbook\Models\Users;
use Phanbook\Models\Karma;
use Phanbook\Models\PostsReply;
use Phanbook\Models\PostsBounties;
use Phanbook\Models\ActivityNotifications;
use Phanbook\Frontend\Forms\ReplyForm;
use Phanbook\Models\PostsReplyHistory;

/**
 * Class HelpController.
 */
class RepliesController extends ControllerBase
{
    public function indexAction()
    {
        $this->view->disable();
    }

    /**
     * Accepts a reply as correct answer
     */
    public function acceptAction()
    {
        $this->view->disable();

        $this->setJsonResponse();

        if (!$this->request->isPost()) {
            return false;
        }

        //Find the post by Id
        $postReply = PostsReply::findFirstById($this->request->getPost('objectId'));
        if (!$postReply) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('Post reply does not exist')
            ];
            return $this->jsonMessages;
        }
        $user = Users::findFirstById($this->auth->getAuth()['id']);
        if (!$user) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('You must log in first to accepted answer')
            ];
            return $this->jsonMessages;
        }
        if ($postReply->getAccepted() == 'Y') {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('This reply is already accepted as answer')
            ];
            return $this->jsonMessages;
        }

        if ($postReply->post->getDeleted()) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('Post associated to the reply is deleted')
            ];
            return $this->jsonMessages;
        }
        if ($postReply->post->getAcceptedAnswer() == 'Y') {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('This post already has an accepted answer')
            ];
            return $this->jsonMessages;
        }
        if ($postReply->post->getUsersId() != $user->getId() && $user->getModerator() != 'Y') {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('You can\'t accept this answer as correct')
            ];
        }
        /*@todo later*/
        $postQuestionByUser = $postReply->post->getUsersId();
        $postReplyByUser = $postReply->getUsersId();
        $kConst = Karma::SOMEONE_ELSE_ACCEPT_YOUR_REPLY;
        if ($postQuestionByUser != $postReplyByUser) {
            $k      = $kConst + $postReply->post->user->getKarma();
            $v      = $kConst + $postReply->post->user->getVotePoint();
            $points = (50 + intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000));

            $parametersBounty = [
                'usersId = ?0 AND postsReplyId = ?1',
                'bind' => [$postReply->getUsersId(), $postReply->getId()]
            ];
            $postBounty = PostsBounties::findFirst($parametersBounty);
            if ($postBounty) {
                $points += $postBounty->getPoints();
            }
            //$postReply->post->user->setKarma($k);
            //$postReply->post->user->setVotePoint($v);

            /**@ Getting an own reply as 'accepted answer' by someone else */
            $postReply->user->setKarma($points + $postReply->user->getKarma());
            $postReply->user->setVotePoint($points + $postReply->user->getVotePoint());

            if ($postReplyByUser != $user->getId() && $postQuestionByUser != $user->getId()) {
                //$user->setKarma($kConst + $user->getKarma());
                // $user->setVotePoint($kConst + $user->getVotePoint());
            }
            //Adding notification @todo
        }
        $postReply->setAccepted('Y');
        $postReply->post->setAcceptedAnswer('Y');
        if ($postReply->save()) {
            if (!$user->save()) {
                foreach ($user->getMessages() as $message) {
                    $this->jsonMessages['messages'][] = [
                        'type'  => 'error',
                        'content' => $message->getMessage()
                    ];
                    return $this->jsonMessages;
                }
            }
        }
        //Return data display ajax when every ok
        return (['data' => 1]);
    }

    /**
     * The answer a question
     * @return mixed
     */
    public function answerAction()
    {
        $this->view->disable();
        $auth = $this->auth->getAuth();
        if (!$auth) {
            $this->flashSession->error(t('You must be logged in first to post answer'));
            return $this->currentRedirect();
        }
        if ($this->request->isPost()) {
            $postId = $this->request->getPost('id');
            $content = $this->request->getPost('content', 'trim');
            if (str_word_count($content) < 10) {
                $this->flashSession->error(t('Body must be at least 15 word'));
                return $this->currentRedirect();
            }
            $post = Posts::findFirstById($postId);
            $user = Users::findFirstById($auth['id']);
            //Only update the number of replies if the user that commented isn't the same that posted
            if ($user->getId() != $post->getUsersId()) {
                $post->setNumberReply($post->getNumberReply() + 1);
                $post->user->increaseKarma(Karma::SOMEONE_REPLIED_TO_MY_POST);
                $user->increaseKarma(Karma::REPLY_ON_SOMEONE_ELSE_POST);

                if (!$post->save() || !$user->save()) {
                    error_log('Save fail answerAction. I am on here ' . __LINE__);
                    return false;
                }
            }
            $object = new PostsReply();
            $object->setPostsId($postId);
            $object->setContent($content);
            $object->setUsersId($auth['id']);
            if (!$object->save()) {
                foreach ($object->getMessages() as $message) {
                    $this->flashSession->error($message);
                }

                return $this->currentRedirect();
            }
            $this->flashSession->success(t('Data was successfully saved'));
            return $this->currentRedirect();
        }
    }

    /**
     * Delete spam posts
     */
    public function deleteAction($id)
    {
        $auth = $this->auth->getAuth();
        if (!$auth) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }
        $parameters = [
            "id = ?0 AND (usersId = ?1 OR 'Y' = ?2 OR 'Y' = ?3)",
            "bind" => [$id, $auth['id'], $auth['moderator'], $auth['admin']]
        ];
        if (!$object = PostsReply::findFirst($parameters)) {
            $this->flashSession->error(t('Post doesn\'t exist.'));

            return $this->indexRedirect();
        }
        if (!$object->delete()) {
            $this->saveLoger($object->getMessages());
        }
        $this->flashSession->success(t('Data was successfully deleted'));
        return $this->currentRedirect();
    }

    public function editAnswerAction($id)
    {
        $auth = $this->auth->getAuth();
        $postReply = PostsReply::findFirstById($id);
        if (!$auth) {
            $this->flashSession->error(t('You must be logged in first to post answer'));
            return $this->currentRedirect();
        }
        if (!$this->auth->isTrustModeration() && $auth['id'] != $postReply->getUsersId()) {
            $this->flashSession->error(t('You don\'t have permission'));
            return $this->currentRedirect();
        }
        if (!$postReply) {
            $this->flashSession->error(t('The posts replies not exist!'));
            return $this->currentRedirect();
        }
        if ($this->request->isPost()) {
            //save history  postreplies table, it just for admin or moderator
            if ($this->auth->isTrustModeration() && $auth['id'] != $postReply->getUsersId()) {
                $postReplyHistory = new PostsReplyHistory;
                $postReplyHistory->setContent($this->request->getPost('content'));
                $postReplyHistory->setPostsReplyId($id);
                $postReplyHistory->setUsersId($auth['id']);
                if (!$postReplyHistory->save()) {
                    $this->saveLoger($postReplyHistory->getMessages());
                }
            }
            //Update replies post
            $postReply->setContent($this->request->getPost('content'));
            if (!$postReply->save()) {
                $this->saveLoger($postReply->getMessages());
            }
            $this->flashSession->success(t('Data was successfully saved'));
            return $this->response->redirect($this->request->getHTTPReferer());
        }
        $this->view->hotPosts   = Posts::getHotPosts();
        $this->view->form       = new ReplyForm($postReply);
        $this->view->firstTime  = null;
        $this->view->type       = 'postReply';
        $this->tag->setTitle(t('Edit answer'));
        return $this->view->pick('edit');
    }
}
