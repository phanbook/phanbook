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
use Phanbook\Models\Vote;
use Phanbook\Utils\Editor;
use Phanbook\Models\Posts;
use Phanbook\Models\Karma;
use Phanbook\Models\Users;
use Phanbook\Models\ModelBase;
use Phanbook\Models\PostsHistory;
use Phanbook\Frontend\Forms\ReplyForm;
use Phanbook\Frontend\Forms\CommentForm;
use Phanbook\Frontend\Forms\QuestionsForm;

/**
 * \Phanbook\Frontend\Controllers\PostsController
 *
 * @package Phanbook\Frontend\Controllers
 */
class PostsController extends ControllerBase
{
    /**
     * This initializes the timezone in each request
     */
    public function initialize()
    {
        parent::initialize();

        $editor = new Editor();
        $editor->init();
    }

    /**
     * Default it will get all posts
     */
    public function indexAction()
    {
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder */
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $totalBuilder */
        $tab     = $this->request->getQuery('tab');
        $page    = isset($_GET['page']) ? (int)$_GET['page'] : $this->numberPage;
        $perPage = isset($_GET['perPage']) ? (int)$_GET['perPage'] : $this->perPage;

        if (empty($tab)) {
            $tab = $this->dispatcher->getParam('type');
        }

        if ($tab == "answers") {
            $join = [
                'type'  => 'join',
                'model' => 'PostsReply',
                'on'    => 'r.postsId = p.id',
                'alias' => 'r'

            ];
            list($itemBuilder, $totalBuilder) =
                ModelBase::prepareQueriesPosts($join, false, $perPage);
            $itemBuilder->groupBy(array('p.id'));
        } else {
            list($itemBuilder, $totalBuilder) =
                ModelBase::prepareQueriesPosts('', false, $perPage);
        }

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
        $type   = Posts::POST_PAGE;
        $status = Posts::PUBLISH_STATUS;
        $conditions = "p.deleted = 0 AND p.type != '{$type}' AND p.status = '{$status}'";
        $itemBuilder->andWhere($conditions);
        $totalBuilder->andWhere($conditions);
        //order like tabs sort
        if (!$tab) {
            $tab = 'hot';
        }
        $totalPosts = $totalBuilder->getQuery()->setUniqueRow(true)->execute($params);
        $totalPages = ceil($totalPosts->count / $perPage);
        $offset     = ($page - 1) * $perPage + 1;
        if ($page > 1) {
            $itemBuilder->offset($offset);
        }

        $this->view->setVars(
            [
                'tab'         => $tab,
                'type'        => Posts::POST_ALL,
                'posts'       => $itemBuilder->getQuery()->execute($params),
                'totalPages'  => $totalPages,
                'currentPage' => $page,
            ]
        );

        return $this->view->pick('post');
    }

    /**
     * Method editAction.
     */
    public function editAction($id)
    {
        $object = Posts::findFirstById($id);
        if (!$this->auth->isAuthorizedVisitor()) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }
        if (!$object) {
            $this->flashSession->error(t("Post doesn't exist."));
            return $this->indexRedirect();
        }
        if (!$this->auth->isTrustModeration() && $this->auth->getUserId() != $object->getUsersId()) {
            $this->flashSession->error(t("You don't have permission"));
            return $this->currentRedirect();
        }

        $this->view->setVars(
            [
                'form'            => new QuestionsForm($object),
                'post'            => $object,
                'firstTime'       => false,
                'tab'             => null,
                'type'            => Posts::POST_QUESTIONS,
                'breadcrumbName'     => 'Ask Questions'
            ]
        );
        $this->addAssetsSelect();
        $this->tag->setTitle('Edit a questions or tips ');
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

        $id   = $this->request->getPost('id');
        $tags = $this->request->getPost('tags', 'string', null);

        if (!$this->auth->isAuthorizedVisitor()) {
            $this->flashSession->error('You must be logged first');

            return $this->currentRedirect();
        }

        if (!empty($id)) {
            $object = Posts::findFirstById($id);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            // @Todo continue When moderator or admin edit post
            // Just to save history when user is TrustModerator and the user not owner the post
            if ($this->auth->isTrustModeration() && $this->auth->getUserId() != $object->getUsersId()) {
                $object->setEditedAt(time());
                $postHistory = new PostsHistory();
                $postHistory->setPostsId($id);
                $postHistory->setUsersId($this->auth->getUserId());
                $postHistory->setContent($this->request->getPost('content'));
                if (!$postHistory->save()) {
                    $this->saveLogger($postHistory->getMessages());
                }
            }
        } else {
            $object = new Posts();
            $object->setType(Posts::POST_QUESTIONS);
            $object->setSlug(Slug::generate($this->request->getPost('title')));
            $object->setUsersId($this->auth->getUserId());

            $user = Users::findFirstById($this->auth->getUserId());
            $user->increaseKarma(Karma::ADD_NEW_POST);
            if (!$user->save()) {
                $this->saveLogger($user->getMessages());
            }
        }

        $form = new QuestionsForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            $this->saveLogger($form->getMessages());
            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->router->getControllerName().(!is_null($id) ? '/edit/'.$id : '/new')
            );
        }
        $this->db->begin();
        if (!$object->save()) {
            $this->db->rollback();
            $this->saveLogger($object->getMessages());
            $this->dispatcher->forward(
                ['controller' => $this->router->getControllerName(), 'action' => 'new']
            );
            return false;
        }
        if (!$this->phanbook->tag()->saveTagsInPosts($tags, $object)) {
            $this->db->rollback();
            return $this->response->redirect(
                $this->router->getControllerName().(!is_null($id) ? '/edit/'.$id : '/new')
            );
        }
        $this->flashSession->success(t('Data was successfully saved'));
        // Commit the transaction
        $this->db->commit();
        return $this->response->redirect();
    }

    /**
     * Delete spam posts
     */
    public function deleteAction($id)
    {
        if (!$this->auth->isAuthorizedVisitor()) {
            $this->flashSession->error('You must be logged first');
            return $this->indexRedirect();
        }

        $auth = $this->auth->getAuth();
        $parameters = [
            "id = ?0 AND (usersId = ?1 OR 'Y' = ?2 OR 'Y' = ?3)",
            "bind" => [$id, $auth['id'], $auth['moderator'], $auth['admin']]
        ];
        if (!$object = Posts::findFirst($parameters)) {
            $this->flashSession->error(t("Post doesn't exist."));

            return $this->indexRedirect();
        }
        if (!$object->delete()) {
            $this->saveLogger($object->getMessages());
        }
        $this->flashSession->success(t('Data was successfully deleted do late'));
        return $this->indexRedirect();
    }

    /**
     * Add new tips or questions.
     */
    public function newAction()
    {
        $usersId   = $this->auth->getUserId();
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
                'type'            => Posts::POST_QUESTIONS,
                'breadcrumbName'  => 'Ask Questions'

            ]
        );
        $this->addAssetsSelect();
        $this->tag->setTitle($this->escaper->escapeHtml(t('Create Questions')));
        return $this->view->pick('edit');
    }

    /**
     * Displays a Post and its comments.
     *
     * @param int    $id   The Post ID
     * @param string $slug The Post slug
     */
    public function viewAction($id, $slug)
    {
        $post = $this->postService->findFirstById($id);

        if (!$post || !$this->postService->isPublished($post)) {
            $this->response->setStatusCode(404);
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'controller' => 'posts',
                'action'     => 'index',
            ]);
            return;
        }

        if ($this->auth->isAuthorizedVisitor() && !$this->postService->hasViewsByIpAddress($post)) {
            $this->postService->increaseNumberViews($post, $this->auth->getUserId());
            $visitor = $this->userService->findFirstById($this->auth->getUserId());

            if ($visitor && !$this->postService->isAuthorVisitor($post, $visitor->getId())) {
                $this->userService->increaseVisitorKarmaForViewingPost($visitor);
            }
        }

        $this->view->setVars(
            [
                'post'        => $post,
                'form'        => new ReplyForm(),
                'votes'       => $this->voteService->getVotes($id, Vote::OBJECT_POSTS),
                'postsReply'  => $post->getPostsWithVotes($id),
                'commentForm' => new CommentForm(),
                'userPosts'   => $post->user,
                'type'        => Posts::POST_QUESTIONS,
                'postRelated' => Posts::postRelated($post),
            ]
        );

        $this->tag->setTitle($this->escaper->escapeHtml($post->getTitle()));

        $this->view->pick('single');
    }

    protected function addAssetsSelect()
    {
        $this->assets->addCss('core/assets/js/select/select2.min.css');
        $this->assets->addJs('core/assets/js/select/select2.min.js');
    }
}
