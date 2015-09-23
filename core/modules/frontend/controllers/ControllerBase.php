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

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Logger\Adapter\File as Logger;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;
use Phanbook\Models\Vote;
use Phanbook\Models\Users;
use Phanbook\Models\Karma;
use Phanbook\Models\Posts;
use Phanbook\Models\Comment;
use Phanbook\Models\PostsReply;
use Phanbook\Forms\CommentForm;
use Phanbook\Models\ActivityNotifications;

/**
 * Class ControllerBase
 *
 * @package Phanbook\Controllers
 */
class ControllerBase extends Controller
{
    /**
     * Display item in a page
     */
    const ITEM_IN_PAGE = 30;
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
     * Check if we need to throw a json respone. For ajax calls.
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
        // @todo something
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
        $this->view->tab = $this->currentOrder;
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
        $vote     = Vote::vote($objectId, $object, $way);
        $user     = Users::findFirstById($this->auth->getAuth()['id']);
        $this->setJsonResponse();

        if (!$user) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' =>  'You need to login first'
            ];
            return $this->jsonMessages;
        }

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
        if ($object == Vote::OBJECT_POSTS_REPLY) {
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

        if (!$vote) {
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
            $this->jsonMessages['messages'][] = $vote;
            return $this->jsonMessages;
        }

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
     * This method prepares the queries to be executed in each list of posts
     * The returned builders are used as base in the search, tagged list and index lists.
     *
     * @param array  $join  The Model need to join {code} $join = [ 'type'  => 'join', 'model' => 'Phanbook\\Models\\PostsReply', 'on'    => 'r.postsId = p.id', 'alias' => 'r' ]; {/code} {code} $join = [ 'type'  => 'join', 'model' => 'Phanbook\\Models\\PostsReply', 'on'    => 'r.postsId = p.id', 'alias' => 'r' ]; {/code}
     * {code}
     * $join = [
     *   'type'  => 'join',
     *   'model' => 'Phanbook\\Models\\PostsReply',
     *   'on'    => 'r.postsId = p.id',
     *   'alias' => 'r'
     * ];
     * {/code}
     * @param string $where The condition you want to get.
     * @param int    $limit The option limit post in a page.
     *
     * @return array It return two object
     */
    protected function prepareQueries($join, $where, $limit = 15)
    {

        /**
         *
         * @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder
         */
        $itemBuilder = $this
            ->modelsManager
            ->createBuilder()
            ->from(['p' => 'Phanbook\Models\Posts'])
            ->orderBy('p.sticked DESC, p.createdAt DESC');

        if (isset($join) && is_array($join)) {
            $itemBuilder->$join['type']($join['model'], $join['on'], $join['alias']);
        }
        if (isset($where)) {
            $itemBuilder->where($where);
        }

        $totalBuilder = clone $itemBuilder;

        $itemBuilder
            ->columns(array('p.*'))
            ->limit($limit);

        $totalBuilder
            ->columns('COUNT(*) AS count');

        return array($itemBuilder, $totalBuilder);
    }
    /**
     * Create a QueryBuilder paginator, show 15 rows by page starting from $page
     *
     * @param array $model The model need to retrieve and someoption {code} $mode = [ 'name'      => 'Phanbook\Models\Users' 'orderBy'   => 'username' 'currentOrder'=> 'users'// mean adding class for menu ] {/code}
     * {code}
     *      $mode = [
     *          'name'      => 'Phanbook\Models\Users'
     *          'orderBy'   => 'username'
     *          'currentOrder'=> 'users'// mean adding class for menu
     *      ]
     * {/code}
     * @param int   $page  Current page to show
     *
     * @return array the conatainer object...
     */
    public function paginatorQueryBuilder($model, $page)
    {
        $builder = $this->modelsManager->createBuilder()
            ->from($model['name'])
            ->orderBy($model['orderBy']);
        //Create a Model paginator, show 15 rows by page starting from $page
        $paginator   = (new PaginatorQueryBuilder(
            [
                'builder'  => $builder,
                'limit'     => self::ITEM_IN_PAGE,
                'page'      => $page
            ]
        ))->getPaginate();
        $this->view->setVars(
            [
                'tab'           => $model['currentOrder'],
                'object'        => $paginator->items,
                'canonical'     => '',
                'totalPages'    => $paginator->total_pages,
                'currentPage'   => $page,
            ]
        );
    }
    public function indexRedirect()
    {
        return $this->response->redirect();
    }
    public function currentRedirect()
    {
        if ($url = $this->session->get('urlCurrent')) {
            $this->session->remove('urlCurrent');
            return $this->response->redirect($url);
        }
        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }
    /**
     * Set karam Voting someone else's post (positive or negative) on posts reply
     *
     * @param string $way       [description]
     * @param object $user      Phanbook\Models\Users
     * @param object $postReply Phanbook\Models\PostsReply
     */
    public function setPointReply($way, $user, $postReply)
    {
        if ($postReply->getUsersId() != $user->getId()) {
            if ($way == 'positive') {
                if ($postReply->post->getUsersId() != $user->getId()) {
                    $karamCount = intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                    $points = Karma::VOTE_UP_ON_MY_REPLY_ON_MY_POST + $karamCount;
                } else {
                    $points = (Karma::VOTE_UP_ON_MY_REPLY + intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000));
                }
                $postReply->user->increaseKarma($points);
                $user->increaseKarma(Karma::VOTE_UP_ON_SOMEONE_ELSE_REPLY);
            } else {
                if ($postReply->post->getUsersId() != $user->getId()) {
                    $karamCount = intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000);
                    $points = Karma::VOTE_DOWN_ON_MY_REPLY_ON_MY_POST + $karamCount;
                } else {
                    $points = (Karma::VOTE_DOWN_ON_MY_REPLY + intval(abs($user->getKarma() - $postReply->user->getKarma()) / 1000));
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
     * Set karam Voting someone else's post (positive or negative) on posts
     *
     * @param string $way  positive or negative
     * @param object $user Phanbook\Models\Users
     * @param object $post Phanbook\Models\Posts
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
            error_log('todo setPointReply');
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
        //set user recive a notification when it have a post comment or reply
        $activity->setUsersOriginId($user->getId());

        //If is posts, it will use when user vote post
        if (method_exists($object, '_isPost')) {
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
            error_log('Save fail, I am on here' . __LINE__);
        }
    }
    /**
     * The function sending log for nginx or apache, it will to analytic later
     * @return mixed
     */
    public function saveLoger($e)
    {
        //error_log($e);
        $logger = new Logger(ROOT_DIR . 'apps/logs/error.log');
        if (is_object($e)) {
            //d($e);
            $logger->error($e[0]->getMessage());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                d($e);
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }

        return $this->indexRedirect();
    }
}
