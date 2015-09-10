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
namespace Phanbook\Controllers;

use Phanbook\Utils\Slug;
use Phanbook\Models\Tags;
use Phanbook\Models\Posts;
use Phanbook\Models\Vote;
use Phanbook\Models\Comment;
use Phanbook\Models\Karma;
use Phanbook\Models\Users;
use Phanbook\Models\PostsTags;
use Phanbook\Models\PostsViews;
use Phanbook\Models\PostsReply;
use Phanbook\Models\PostsHistory;
use Phanbook\Forms\ReplyForm;
use Phanbook\Forms\CommentForm;
use Phanbook\Forms\QuestionsForm;
use Phanbook\Forms\HackernewForm;

/**
 * Class PostController.
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
     * indexAction function.
     *
     * @access public
     */
    public function indexAction($order = null)
    {
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder */
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $totalBuilder */

        if ($order == "answers") {
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
        switch ($order) {
            case 'hot':
                $this->tag->setTitle('Hot Questions');
                $itemBuilder->orderBy('p.modifiedAt DESC');
                break;

            case 'mycollection':
                $this->tag->setTitle('My Questions and Tips');
                if ($userId) {
                    $params       = array($userId['id']);
                    $myConditions = 'p.usersId = ?0';
                    $itemBuilder->where($myConditions);
                    $itemBuilder->groupBy('p.id');
                    $totalBuilder->where($myConditions);
                }
                break;

            case 'unanswered':
                $this->tag->setTitle('Unanswered Questions');
                $unansweredConditions = 'p.numberReply = 0 AND p.acceptedAnswer <> "Y"';
                $itemBuilder->where($unansweredConditions);
                $totalBuilder->where($unansweredConditions);
                break;

            case 'answers':
                $this->tag->setTitle('My Answers');
                if ($userId) {
                    $params            = array($userId['id']);
                    $answersConditions = 'r.usersId = ?0';
                    $itemBuilder->where($answersConditions);
                    $totalBuilder->where($answersConditions);
                }
                break;
            //it mean router is questions
            case 'questions':
                $this->tag->setTitle('Questions');
                $questionConditions = 'p.type = "questions"';
                $itemBuilder->where($questionConditions);
                $totalBuilder->where($questionConditions);
                break;
            //it mean router is tips
            case 'tips':
                $this->tag->setTitle('Tips');
                $tipConditions = 'p.type = "tips"';
                $itemBuilder->where($tipConditions);
                $totalBuilder->where($tipConditions);
                break;
            case 'news':
                $this->tag->setTitle('Hacker News');
                $tipConditions = 'p.type = "hackernews"';
                $itemBuilder->where($tipConditions);
                $totalBuilder->where($tipConditions);
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
            default:
                $this->tag->setTitle($this->config->application->tagline);
        }

        $notDeleteConditions = 'p.deleted = 0';
        $itemBuilder->andWhere($notDeleteConditions);
        $totalBuilder->andWhere($notDeleteConditions);
        //order like tabs sort
        if (!$order) {
            $order = 'hot';
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
            'currentOrder'  => $order,
            'object'        => $itemBuilder->getQuery()->execute($params),
            'canonical'     => '',
            'totalPages'    => $totalPages,
            'currentPage'   => $page
            ]
        );
        //Pick overwirite view to render.
        return $this->view->pickCustom('posts/index');
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
                'object'          => $object,
                'firstTime'       => false,
                'currentOrder'    => null
            ]
        );
        $this->tag->setTitle('Edit a questions or tips ');
        $this->assets->addJs('js/tags-suggest.js');
        return $this->view->pickCustom($this->router->getControllerName().'/item');
    }
    /**
     * Method edit Hackernew Action.
     */
    public function editHackernewAction($id)
    {
        $auth = $this->auth->getAuth();
        if (!$auth) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }

        if (!$object = Posts::findFirstById($id)) {
            $this->flashSession->error(t('Post doesn\'t exist.'));

            return $this->indexRedirect();
        }
        if (!$this->auth->isTrustModeration() && $auth['id'] != $object->getUsersId()) {
            $this->flashSession->error(t('You don\'t have permission'));
            return $this->currentRedirect();
        }

        $this->view->setVars(
            [
                'form'            => new HackernewForm($object),
                'object'          => $object,
                'firstTime'       => false,
                'currentOrder'    => null
            ]
        );
        $this->tag->setTitle('Edit a Hackernew');
        return $this->view->pickCustom($this->router->getControllerName().'/hackernew');
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
        if (is_string($this->isTags($tags))) {
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
            if ($this->request->getPost('type') == Posts::POST_TIPS) {
                $object->setType(Posts::POST_TIPS);
            }
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
                if (!$this->saveTagsInPosts($tags, $object)) {
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
     * @return \Phalcon\Http\ResponseInterface
     */
    public function saveHackernewAction()
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

        if (!empty($id)) {
            $object = Posts::findFirstById($id);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            //@Todo continue When moderator or admin edit post
            if ($this->auth->isTrustModeration()) {
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
            $object->setType(Posts::POST_HACKERNEWS);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            $object->setUsersId($auth['id']);


            $user = Users::findFirstById($auth['id']);
            $user->increaseKarma(Karma::ADD_NEW_POST_HACKERNEWS);
            if (!$user->save()) {
                $this->saveLoger($user->getMessages());
            }
        }

        $form = new HackernewForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            $this->saveLoger($form->getMessages());
            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->router->getControllerName().(!is_null($id) ? '/edit/'.$id : '/hackernew')
            );
        } else {
            if (!$object->save()) {
                $this->saveLoger($object->getMessages());
            }
            $this->flashSession->success(t('Data was successfully saved'));
            return $this->response->redirect($this->router->getControllerName());
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
                'currentOrder'    => 'questions/ask'
            ]
        );
        $this->assets->addJs('js/tags-suggest.js');
        $this->tag->setTitle($this->escaper->escapeHtml(t('Create Posts')));
        return $this->view->pickCustom($this->router->getControllerName().'/item');
    }
    /**
     * Form add link hackernew @hackernew/submit
     *
     * @return mixed
     */
    public function hackernewAction()
    {
        $usersId   = $this->auth->getAuth()['id'];
        if (!$usersId) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }
        $firstTime = Posts::countByUsersId($usersId) == 0;
        $this->view->setVars(
            [
                'form'            => new HackernewForm(),
                'firstTime'       => $firstTime,
                'currentOrder'    => 'hackernew'
            ]
        );
        $this->tag->setTitle($this->escaper->escapeHtml(t('Hackernews or Versions')));
        return $this->view->pickCustom('posts/hackernew');
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

            $postView = new PostsViews();
            $postView->setPostsId($id);
            $postView->setIpaddress($ipAddress);
            if (!$postView->save()) {
                $this->saveLoger($postView->getMessages());
            }
        }

        $this->view->setVars(
            [
                'object'  => $object,
                'form'    => new ReplyForm(),
                'votes'   => $object->getVotes($id, Vote::OBJECT_POSTS),
                'postsReply' => $object->getPostsWithVotes($id),
                'commentForm'=> new CommentForm(),
                'userPosts'  => $object->user,
                'currentOrder' => 1, //@todo later
            ]
        );
        $this->tag->setTitle($this->escaper->escapeHtml($object->getTitle()));
        //send template tips
        switch ($object->getType()) {
            case 'tips':
                return $this->view->pickCustom('posts/viewTip');
                break;
            case 'questions':
                return $this->view->pickCustom('posts/view');
                break;
            default:
                return $this->view->pickCustom('posts/viewHackernew');
                break;
        }
    }

    /**
     * It will return string when error to occur and to array to success
     *
     * @param  $tag is string it should slug
     * @return string|array
     */
    public function isTags($tag)
    {
        if (!is_string($tag) || empty($tag)) {
            return 'You need to add tags for your posts';
        }
        $tags = explode(',', $tag);
        if (count($tags) == 0) {
            return 'This tag does not exist';
        }
        if (count($tags) >= 5) {
            return 'The tags maximum allow is 5';
        }
        $results = [];
        foreach ($tags as $tag) {
            $object= Tags::findFirstBySlug(trim($tag));
            if (!is_object($object)) {
                return 'This tag does not exist';
            }
            $results[] = $object->getId();
        }

        return $results;
    }
    /**
     * @todo Update the total of posts related to a tags
     */
    public function saveTagsInPosts($_tag, $object)
    {
        $tags = $this->isTags($_tag);
        if (is_array($tags)) {
            //
            $postsTags = PostsTags::find(
                [
                'postsId = ?0',
                'bind' => [$object->getId()]
                ]
            );
            if (isset($postsTags)) {
                $postsTags->delete();
            }
            foreach ($tags as $tagsId) {
                $postsTags = new PostsTags();
                $postsTags->setTagsId($tagsId);
                $postsTags->setPostsId($object->getId());

                if (!$postsTags->save()) {
                    return false;
                }
                //Update the total of posts related to a tags
                if ($object->getOperationMade() == \Phalcon\Mvc\Model::OP_CREATE) {
                    $tag = Tags::findFirstById($tagsId);
                    $number = $tag->getNumberposts();
                    $tag->setNumberPosts($number + 1);
                    if (!$tag->save()) {
                        $this->saveLoger($tag->getMessages());
                    }
                }
            }
            return true;
        }
        return false;
    }
}
