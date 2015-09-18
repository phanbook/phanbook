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
namespace Phanbook\Blog\Controllers;

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
use Phanbook\Frontend\Forms\ReplyForm;
use Phanbook\Frontend\Forms\CommentForm;
use Phanbook\Frontend\Forms\QuestionsForm;

/**
 * Class PostController.
 */
class BlogController extends ControllerBase
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
    public function indexAction()
    {
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder */
        /* @var \Phalcon\Mvc\Model\Query\BuilderInterface $totalBuilder */
        $this->tag->setTitle('Tips');
        list($itemBuilder, $totalBuilder) = $this->prepareQueries('', false, self::ITEM_IN_PAGE);

        $params = null;
        $conditions = 'p.type = "tips" AND p.deleted = 0';
        $itemBuilder->where($conditions);
        $totalBuilder->where($conditions);


        $page       = isset($_GET['page'])?(int)$_GET['page']:1;
        $totalPosts = $totalBuilder->getQuery()->setUniqueRow(true)->execute($params);
        $totalPages = ceil($totalPosts->count / self::ITEM_IN_PAGE);
        if ($page > 1) {
            $itemBuilder->offset((int) $page);
        }
        $this->view->setVars(
            [
                'posts'         => $itemBuilder->getQuery()->execute($params),
                'canonical'     => '',
                'totalPages'    => $totalPages,
                'currentPage'   => $page
            ]
        );
        return $this->view->pick('post');
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
                'post'      => $object,
                'form'      => new ReplyForm(),
                'votes'     => $object->getVotes($id, Vote::OBJECT_POSTS),
                'postsReply' => $object->getPostsWithVotes($id),
                'commentForm'=> new CommentForm(),
                'userPosts'  => $object->user,
            ]
        );
        $this->tag->setTitle($this->escaper->escapeHtml($object->getTitle()));
        return $this->view->pickCustom('single');
    }
}
