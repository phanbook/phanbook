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

use Phanbook\Models\Tags;
use Phanbook\Models\Vote;
use Phanbook\Models\Users;
use Phanbook\Models\Karma;
use Phanbook\Models\Posts;
use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Phanbook\Models\Comment;
use Phanbook\Models\ModelBase;
use Phanbook\Models\PostsReply;
use Phanbook\Frontend\Forms\CommentForm;
use Phanbook\Models\ActivityNotifications;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phalcon\Paginator\Adapter\NativeArray  as PaginatorNativeArray;

/**
 * Class ControllerBase
 *
 * @package Phanbook\Controllers
 */
class ControllerBase extends Controller
{
    /**
     * @var array
     */
    private $unsecuredRoutes = [];

    /**
     * @var bool
     */
    protected $jsonResponse = false;

    /**
     * @var array
     */
    public $jsonMessages = [];

    /**
     * @var string
     */
    public $currentOrder = null;

    /**
     * @var int
     */
    public $numberPage = 1;

    /**
     * @var int
     */
    public $perPage = 30;

    /**
     * Check if we need to throw a json response. For ajax calls.
     *
     * @return bool
     */
    public function isJsonResponse()
    {
        return $this->jsonResponse;
    }

    /**
     * Set a flag in order to know if we need to throw a json response.
     *
     * @return $this
     */
    public function setJsonResponse()
    {
        $this->jsonResponse = true;

        return $this;
    }

    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        // @TODO: something
        if ($this->auth->hasRememberMe() && !$this->request->isPost()) {
            $this->auth->loginWithRememberMe();
        }
    }


    /**
     * After execute route event
     *
     * @param Dispatcher $dispatcher
     */
    public function afterExecuteRoute(Dispatcher $dispatcher)
    {
        if ($this->request->isAjax() && $this->isJsonResponse()) {
            $this->view->disable();
            $this->response->setContentType('application/json', 'UTF-8');

            $data = $dispatcher->getReturnedValue();
            if (is_array($data)) {
                $this->response->setJsonContent($data);
            }
            echo $this->response->getContent();
        }
    }

    public function initialize()
    {
        $this->view->setVars(
            [
            'tab'           => $this->currentOrder,
            'tags'          => Tags::find(),
            'hotPosts'      => Posts::getHotPosts(5),
            'totalPost'     => Posts::totalPost(),
            'highestKarma'  => Users::highestKarma(),
            'totalReply'    => PostsReply::totalReply(),

            ]
        );
        if (isset($this->config->perPage)) {
            $this->perPage = $this->config->perPage;
        }
    }


    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    private function isUnsecuredRoute(Dispatcher $dispatcher)
    {
        foreach ($this->unsecuredRoutes as $route) {
            if ($route['controller'] == $dispatcher->getControllerName()
                && $route['action'] == $dispatcher->getActionName()
            ) {
                return true;
            }
        }

        return false;
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


    public function toggleAction($id)
    {
        $this->view->disable();
        if ($this->toggleObject($id)) {
            $this->flashSession->success(t('Entry status changed successfully'));
        } else {
            $this->flashSession->error(t('An error occurred on changing entry status'));
        }

        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    /**
     * Method to toggle objects
     *
     * @return mixed
     */
    private function toggleObject($id, $method = 'status')
    {
        $class = 'Phanbook\Models\\' . ucfirst($this->router->getControllerName());

        if (!class_exists($class)) {
            return false;
        }

        $id     = $this->filter->sanitize($id, ['int']);
        $object = $class::findFirstById($id);

        if (!is_object($object)) {
            return false;
        }
        $setter = 'set' . ucfirst($method);
        $getter = 'get' . ucfirst($method);

        if (!method_exists($object, $getter) || !method_exists($object, $setter)) {
            return false;
        }

        $value = $object->$getter() == 0 ? 1 : 0;
        $object->$setter($value);

        return $object->save();
    }

    /**
     * Method to delete objects
     *
     * @return mixed
     */
    private function delete($id, $model = null)
    {
        $this->view->disable();

        if (empty($model)) {
            $class = 'Phanbook\Models\\' . ucfirst($this->router->getControllerName());
        }

        if (!class_exists($class)) {
            return false;
        }

        if (is_array($id)) {
            $ids    = array_map(
                function ($key) {
                    return (int)$key;
                },
                $id
            );
            $object = $class::find('id IN (' . implode(',', $ids) . ')');
        } else {
            $id     = $this->filter->sanitize($id, ['int']);
            $object = $class::findFirstById($id);
        }
        if (!$object) {
            $this->flashSession->error(t('Entry was not found'));

            return $this->response->redirect($this->request->getHTTPReferer(), true);
        }

        if (!$object->delete()) {
            foreach ($object->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
            }
        } else {
            $this->flashSession->success(t('Entry was successfully deleted'));
        }

        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    public function deleteAction($id)
    {
        $this->view->disable();

        return $this->delete($id);
    }

    /**
     * Method for voting a task
     *
     * @return mixed
     */
    public function voteAction()
    {
        $this->view->disable();
        if (!$this->request->isPost()) {
            return $this->response->redirect($this->router->getControllerName());
        }

        $way = 'positive';
        if ($this->request->getPost('way') == 'negative') {
            $way = 'negative';
        }
        $objectId = $this->request->getPost('objectId');
        $object   = $this->request->getPost('object');
        $user     = Users::findFirstById($this->auth->getAuth()['id']);
        $this->setJsonResponse();

        if (!$user) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' =>  'You need to login first'
            ];
            return $this->jsonMessages;
        }
        $this->db->begin();
        if ($object == Vote::OBJECT_POSTS) {
            if (!$post = Posts::findFirstById($objectId)) {
                $this->jsonMessages['messages'][] = [
                    'type'    => 'error',
                    'content' => 'Post does not exist'
                ];
                return $this->jsonMessages;
            }
            $this->setPointPost($way, $user, $post);

            //Adding notification when you have receive vote on the post, and not for now for post replies
            if ($user->getId() != $post->getUsersId()) {
                $this->setActivityNotifications($user, $post);
            }
        }
        if ($object == Vote::OBJECT_POSTS_REPLIES) {
            if (!$postReply = PostsReply::findFirstById($objectId)) {
                $this->jsonMessages['messages'][] = [
                    'type'    => 'error',
                    'content' => 'Post reply does not exist'
                ];
                return $this->jsonMessages;
            }

            //Set karam Voting someone else's post (positive or negative) on posts reply
            $this->setPointReply($way, $user, $postReply);
        }
        $vote = Vote::vote($objectId, $object, $way);
        if (!$vote) {
            $this->db->rollback();
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' =>  'Vote have a problem :)'
            ];
            return $this->jsonMessages;
        }
        if ($user->getVote() <= 0) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' =>  t('You don\'t have enough votes available :)')
            ];
            return $this->jsonMessages;
        }
        //checking the user have already voted this post yet
        if (is_array($vote)) {
            $this->db->rollback();
            $this->jsonMessages['messages'][] = $vote;
            return $this->jsonMessages;
        }
        $this->db->commit();

        if ($this->request->isAjax()) {
            $vote = (new Vote)->getVotes($objectId, $object);
            return (['data' => $vote['positive'] - $vote['negative']]);
        }
        echo 0;
        return 0;
    }

    /**
     * Comments are temporary "Post-It" notes left on a question or answer.
     * They can be up-voted (but not down-voted) and flagged, but do not generate reputation.
     * There's no revision history, and when they are deleted they're gone for good.
     *
     * @return mixed
     */
    public function commentAction()
    {
        $this->view->disable();

        if (!$this->request->isPost()) {
            return $this->response->redirect($this->router->getControllerName());
        }
        $user = Users::findFirstById($this->auth->getAuth()['id']);

        if (!$user) {
            $this->flashSession->error(t('You need to login first'));
            return $this->currentRedirect();
        }
        if ($user->getVote() < 9) {
            $this->flashSession->error(t('You must have 10 points to add comment'));
            return $this->currentRedirect();
        }
        $object = new Comment();
        $form   = new CommentForm($object);
        $form->bind($_POST, $object);

        if (!$form->isValid($this->request->getPost())) {
            foreach ($form->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
            }
        } else {
            if (!$object->save()) {
                $this->displayModelErrors($object);
            }
        }
        return $this->currentRedirect();
    }

    /**
     * Attempt to determine the real file type of a file.
     *
     * @param string $extension Extension (eg 'jpg')
     *
     * @return boolean
     */
    public function imageCheck($extension)
    {
        $allowedTypes = [
            'image/gif',
            'image/jpg',
            'image/png',
            'image/bmp',
            'image/jpeg'
        ];

        return in_array($extension, $allowedTypes);
    }

    /**
     * Create a paginator default use adapter PaginatorQueryBuilder,
     * show 30 rows by page starting from $page
     *
     * @return array
     */
    public function paginator($query, $adapter = null)
    {
        $page  = isset($_GET['page']) ? (int)$_GET['page'] : $this->numberPage;
        $perPage  = isset($_GET['perPage']) ? (int)$_GET['perPage'] : $this->perPage;
        $builder  = ModelBase::modelQuery($query);

        if (is_null($adapter)) {
            $paginator  = new PaginatorQueryBuilder(
                [
                    'builder'  => $builder,
                    'limit'     => $perPage,
                    'page'      => $page
                ]
            );
        } else {
            $paginator = new PaginatorNativeArray(
                [
                    'data'  => $builder->getQuery()->execute()->toArray(),
                    'limit' => $perPage,
                    'page'  => $page
                ]
            );
        }
        return $paginator;
    }

    public function indexRedirect()
    {
        return $this->response->redirect();
    }

    public function currentRedirect()
    {
        if ($url = $this->cookies->get('urlCurrent')->getValue()) {
            $this->cookies->delete('urlCurrent');
            return $this->response->redirect($url);
        }
        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    /**
     * Set karma Voting someone else's post (positive or negative) on posts reply.
     *
     * @param string $way
     * @param \Phanbook\Models\Users $user
     * @param \Phanbook\Models\PostsReply $postReply
     * @return array
     */
    public function setPointReply($way, $user, $postReply)
    {
        if ($postReply->getUsersId() != $user->getId()) {
            if ($way == 'positive') {
                if ($postReply->post->getUsersId() != $user->getId()) {
                    $karamCount = intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                    $points = Karma::VOTE_UP_ON_MY_REPLY_ON_MY_POST + $karamCount;
                } else {
                    $points = Karma::VOTE_UP_ON_MY_REPLY;
                    $points += intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                }
                $postReply->user->increaseKarma($points);
                $user->increaseKarma(Karma::VOTE_UP_ON_SOMEONE_ELSE_REPLY);
            } else {
                if ($postReply->post->getUsersId() != $user->getId()) {
                    $karamCount = intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                    $points = Karma::VOTE_DOWN_ON_MY_REPLY_ON_MY_POST + $karamCount;
                } else {
                    $points = Karma::VOTE_DOWN_ON_MY_REPLY;
                    $points += intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                }
                $postReply->user->decreaseKarma($points);
                $user->decreaseKarma(Karma::VOTE_DOWN_ON_SOMEONE_ELSE_REPLY);
            }
        }
        if ($postReply->save()) {
            //decrease vote when user up or down post
            $user->setVote($user->getVote() - 1);
            if (!$user->save()) {
                foreach ($user->getMessages() as $message) {
                    $this->jsonMessages['messages'][] = [
                        'type'  => 'error',
                        'message' => $message->getMessage()
                    ];
                    return $this->jsonMessages;
                }
            }
        } else {
            error_log('todo setPointReply');
        }
    }

    /**
     * Set karma Voting someone else's post (positive or negative) on posts
     *
     * @param string $way  positive or negative
     * @param object $user Phanbook\Models\Users
     * @param object $post Phanbook\Models\Posts
     * @return array
     */
    public function setPointPost($way, $user, $post)
    {
        if ($post->getUsersId() != $user->getId()) {
            if ($way == 'positive') {
                $post->user->increaseKarma(Karma::SOMEONE_DID_VOTE_MY_POST);
                $user->increaseKarma(Karma::VOTE_ON_SOMEONE_ELSE_POST);
            } else {
                $post->user->decreaseKarma(Karma::SOMEONE_DID_VOTE_MY_POST);
                $user->increaseKarma(Karma::VOTE_ON_SOMEONE_ELSE_POST);
            }
        }
        if ($post->save()) {
            $user->setVote($user->getVote() - 1);
            if (!$user->save()) {
                foreach ($user->getMessages() as $message) {
                    $this->jsonMessages['messages'][] = [
                        'type'  => 'error',
                        'message' => $message->getMessage()
                    ];
                    return $this->jsonMessages;
                }
            }
        } else {
            $this->saveLoger('todo setPointReply');
        }
    }

    /**
     * These is it will save ActivityNotifications when the user have comment,
     * vote, etc to post or post reply, which just display for user
     *
     * @param  object $user   this is session user Phanbook\Models\Users
     * @param  object $object Phanbook\Models\{Posts, PostsReply...}
     * @return mixed
     */
    public function setActivityNotifications($user, $object)
    {
        $activity = new ActivityNotifications();
        //set user receive a notification when it have a post comment or reply
        $activity->setUsersOriginId($user->getId());

        //If is posts, it will use when user vote post
        if (method_exists($object, 'isPost')) {
            $activity->setUsersId($object->getUsersId());
            $activity->setPostsId($object->getId());
            $activity->setPostsReplyId(null);
            $activity->setType(ActivityNotifications::TYPE_POSTS);
        }
        if (method_exists($object, 'isComment')) {
            //@todo
        }

        if (method_exists($object, 'isReply')) {
            $activity->setUsersId($object->post->getUsersId());
            $activity->setPostsId($object->post->getId());
            $activity->setPostsReplyId($object->getId());
            $activity->setType(ActivityNotifications::TYPE_REPLY);
        }

        if (!$activity->save()) {
            $this->saveLoger('Save fail, I am on here' . __LINE__);
        }
    }

    /**
     * The function sending log for nginx or apache, it will to analytic later
     *
     * @param $e
     */
    public function saveLoger($e)
    {
        $logger = $this->logger;
        if (is_object($e)) {
            $logger->error($e[0]->getMessage());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                $logger->error($message->getMessage());
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }
    }
    /**
     * Transfer values from the controller to views
     *
     * @param array $parmas
     */
    public function setViewVariable($parmas)
    {
        foreach ($parmas as $key => $value) {
            $this->view->setVar($key, $value);
        }
    }
}
