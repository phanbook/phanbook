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

use Phanbook\Utils\Slug;
use Phanbook\Models\Posts;
use Phanbook\Models\Vote;
use Phanbook\Models\Comment;
use Phanbook\Models\Karma;
use Phanbook\Models\Users;
use Phanbook\Models\PostsViews;
use Phanbook\Models\PostsReply;
use Phanbook\Models\PostsHistory;
use Phanbook\Frontend\Forms\ReplyForm;
use Phanbook\Frontend\Forms\CommentForm;
use Phanbook\Frontend\Forms\QuestionsForm;

/**
 * Class QuestionsController.
 *
 */
class PostsController extends ControllerBase
{
    /**
     * This initializes the timezone in each request
     */
    public function initialize()
    {
        $this->view->hotPosts   = Posts::getHotPosts();
        parent::initialize();
    }

    /**
     * Default it will get all posts
     *
     */
    public function indexAction()
    {
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder */
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $totalBuilder */
        $tab = $this->request->getQuery('tab');
        if ($tab == "answers") {
            $join = [
                'type'  => 'join',
                'model' => 'Phanbook\\Models\\PostsReply',
                'on'    => 'r.postsId = p.id',
                'alias' => 'r'

            ];
            list($itemBuilder, $totalBuilder) =
                $this->prepareQueries($join, false, self::ITEM_IN_PAGE);
            $itemBuilder->groupBy(array('p.id'));
        } else {
            list($itemBuilder, $totalBuilder) =
                $this->prepareQueries('', false, self::ITEM_IN_PAGE);
        }
        $userId = $this->auth->getAuth();

        /*
         * Create the conditions according to the parameter order
         */
        $params = null;
        switch ($tab) {
            case 'hot':
                $this->tag->setTitle('Hot Questions');
                $itemBuilder->orderBy('p.modifiedAt DESC');
                break;
            case 'unanswered':
                $this->tag->setTitle('Unanswered Questions');
                $unansweredConditions = 'p.numberReply = 0 AND p.acceptedAnswer <> "Y"';
                $itemBuilder->where($unansweredConditions);
                $totalBuilder->where($unansweredConditions);
                break;
            case 'week':
                $this->tag->setTitle('Hot Questions This Week');
                $lastWeek = new \DateTime();
                $lastWeek->modify('-1 week');
                $params = array($lastWeek->getTimestamp());
                $weekConditions = 'p.createdAt >= ?0';
                $itemBuilder->where($weekConditions);
                $totalBuilder->where($weekConditions);
                break;
            case 'month':
                $this->tag->setTitle('Hot Questions This Month');
                $lastMonths = new \DateTime();
                $lastMonths->modify('-6 month');
                $params = array($lastMonths->getTimestamp());
                $monthConditions = 'p.createdAt >= ?0';
                $itemBuilder->where($monthConditions);
                $totalBuilder->where($monthConditions);
                break;
            case 'questions':
                $this->tag->setTitle('Questions');
                $questionConditions = 'p.type = "questions"';
                $itemBuilder->where($questionConditions);
                $totalBuilder->where($questionConditions);
                break;
            case 'blog':
                $this->tag->setTitle('Blogs');
                $blogConditions = 'p.type = "blog"';
                $itemBuilder->where($blogConditions);
                $totalBuilder->where($blogConditions);
                break;
            case 'hackernews':
                $this->tag->setTitle('Hacker News');
                $tipConditions = 'p.type = "hackernews"';
                $itemBuilder->where($tipConditions);
                $totalBuilder->where($tipConditions);
                break;

            default:
                $this->tag->setTitle($this->config->application->tagline);
        }

        $conditions = 'p.deleted = 0';
        $itemBuilder->andWhere($conditions);
        $totalBuilder->andWhere($conditions);
        //order like tabs sort
        if (!$tab) {
            $tab = 'hot';
        }
        $page       = isset($_GET['page'])?(int)$_GET['page']:1;
        $totalPosts = $totalBuilder->getQuery()->setUniqueRow(true)->execute($params);
        //$perPage    = isset($_GET['number'])?(int)$_GET['number']:5;
        $totalPages = ceil($totalPosts->count / self::ITEM_IN_PAGE);
        if ($page > 1) {
            $itemBuilder->offset((int) $page);
        }
        $this->view->setVars(
            [
                'tab'         => $tab,
                'type'        => Posts::POST_ALL,
                'posts'       => $itemBuilder->getQuery()->execute($params),
                'totalPages'  => $totalPages,
                'currentPage' => $page
            ]
        );
        return $this->view->pick('post');
    }

    /**
     * Method editAction.
     */
    public function editAction($id)
    {
        $auth = $this->auth->getAuth();
        $object = Posts::findFirstById($id);
        if (!$auth) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }
        if (!$object) {
            $this->flashSession->error(t('Post doesn\'t exist.'));
            return $this->indexRedirect();
        }
        if (!$this->auth->isTrustModeration() && $auth['id'] != $object->getUsersId()) {
            $this->flashSession->error(t('You don\'t have permission'));
            return $this->currentRedirect();
        }

        $this->view->setVars(
            [
                'form'            => new QuestionsForm($object),
                'post'            => $object,
                'firstTime'       => false,
                'tab'             => null,
                'type'            => Posts::POST_QUESTIONS
            ]
        );
        $this->tag->setTitle('Edit a questions or tips ');
        $this->assets->addJs('core/assets/js/tags-suggest.js');
        return $this->view->pick('edit');
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function saveAction()
    {
        //  Is not $_POST
        if (!$this->request->isPost()) {
            $this->view->disable();

            return $this->response->redirect($this->router->getControllerName());
        }

        $id = $this->request->getPost('id');
        $auth = $this->auth->getAuth();
        if (!$auth) {
            $this->flashSession->error('You must be logged first');

            return $this->currentRedirect();
        }
        //Checking tags
        $tags = $this->request->getPost('tags', 'string', null);
        if (is_string($this->phanbook->isTags($tags))) {
            $this->flashSession->notice(t($this->isTags($tags)));

            return $this->dispatcher->forward(
                [
                'controller' => $this->router->getControllerName(),
                'action' => (!is_null($id)) ? 'edit' : 'new',
                'params' => (!is_null($id)) ? array($id) : array(),
                ]
            );
        }
        if (!empty($id)) {
            $object = Posts::findFirstById($id);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            //@Todo continue When moderator or admin edit post
            //Just to save history when user is TrustModarator and the user not owner the post
            if ($this->auth->isTrustModeration() && $auth['id'] != $object->getUsersId()) {
                $object->setEditedAt(time());
                $postHistory = new PostsHistory();
                $postHistory->setPostsId($id);
                $postHistory->setUsersId($auth['id']);
                $postHistory->setContent($this->request->getPost('content'));
                if (!$postHistory->save()) {
                    $this->saveLoger($postHistory->getMessages());
                }
            }
        } else {
            $object = new Posts();
            $object->setType(Posts::POST_QUESTIONS);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            $object->setUsersId($auth['id']);

            $user = Users::findFirstById($auth['id']);
            $user->increaseKarma(Karma::ADD_NEW_POST);
            if (!$user->save()) {
                $this->saveLoger($user->getMessages());
            }
        }

        $form = new QuestionsForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            $this->saveLoger($form->getMessages());
            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->router->getControllerName().(!is_null($id) ? '/edit/'.$id : '/new')
            );
        } else {
            if (!$object->save()) {
                $this->saveLoger($object->getMessages());
                return $this->dispatcher->forward(
                    ['controller' => $this->router->getControllerName(), 'action' => 'new']
                );
            } else {
                if (!$this->phanbook->saveTagsInPosts($tags, $object)) {
                    return $this->response->redirect(
                        $this->router->getControllerName().(!is_null($id) ? '/edit/'.$id : '/new')
                    );
                }
                $this->flashSession->success(t('Data was successfully saved'));

                return $this->response->redirect($this->router->getControllerName());
            }
        }
        $this->view->disable();
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
        if (!$object = Posts::findFirst($parameters)) {
            $this->flashSession->error(t('Post doesn\'t exist.'));

            return $this->indexRedirect();
        }
        if (!$object->delete()) {
            $this->saveLoger($object->getMessages());
        }
        $this->flashSession->success(t('Data was successfully deleted do late'));
        return $this->indexRedirect();
    }

    /**
     * Add new tips or questions.
     */
    public function newAction()
    {
        $usersId   = $this->auth->getAuth()['id'];
        if (!$usersId) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }
        $firstTime = Posts::countByUsersId($usersId) == 0;
        $this->view->setVars(
            [
                'form'            => new QuestionsForm(),
                'firstTime'       => $firstTime,
                'tab'             => 'new',
                'type'            => Posts::POST_QUESTIONS
            ]
        );
        $this->assets->addJs('core/assets/js/tags-suggest.js');
        $this->tag->setTitle($this->escaper->escapeHtml(t('Create Questions')));
        return $this->view->pick('edit');
    }

    /**
     * Displays a post and its comments
     *
     * @param $id
     * @param $slug
     *
     * @return \Phalcon\Http\ResponseInterface
     */
    public function viewAction($id, $slug)
    {
        $id     = (int) $id;
        $userId = $this->auth->getAuth()['id'];

        if (!$object = Posts::findFirstById($id)) {
            $this->flashSession->error(t('Posts doesn\'t exist.'));

            return $this->indexRedirect();
        }
        if ($object->getDeleted()) {
            $this->flashSession->error('The Post is deleted');
            return $this->indexRedirect();
        }
        $ipAddress = $this->request->getClientAddress();
        $parameters = [
            'postsId = ?0 AND ipaddress = ?1',
            'bind' => [$id, $ipAddress]
        ];
        $viewed = PostsViews::count($parameters);
        //A view is stored by ipaddress
        if (!$viewed) {
            //Increase the number of views in the post
            $object->setNumberViews($object->getNumberViews() + 1);
            if ($object->getUsersId() != $userId) {
                $object->user->increaseKarma(Karma::VISIT_ON_MY_POST);
                if ($userId > 0) {
                    $user = Users::findFirstById($userId);
                    if ($user) {
                        if ($user->getModerator() == 'Y') {
                            $user->increaseKarma(Karma::MODERATE_VISIT_POST);
                        } else {
                            $user->increaseKarma(Karma::VISIT_POST);
                        }
                        //send log to server
                        if (!$user->save()) {
                            $this->saveLoger($user->getMessages());
                        }
                    }
                }
            }
            if (!$object->save()) {
                $this->saveLoger($object->getMessages());
            }
            $postView = new PostsViews();
            $postView->setPostsId($id);
            $postView->setIpaddress($ipAddress);
            if (!$postView->save()) {
                $this->saveLoger($postView->getMessages());
            }
        }

        $this->view->setVars(
            [
                'post'          => $object,
                'form'          => new ReplyForm(),
                'votes'         => $object->getVotes($id, Vote::OBJECT_POSTS),
                'postsReply'    => $object->getPostsWithVotes($id),
                'commentForm'   => new CommentForm(),
                'userPosts'     => $object->user,
                'type'          => Posts::POST_QUESTIONS
            ]
        );
        $this->tag->setTitle($this->escaper->escapeHtml($object->getTitle()));
        return $this->view->pick('single');
    }
}
