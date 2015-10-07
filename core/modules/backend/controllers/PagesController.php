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
namespace Phanbook\Backend\Controllers;

use Phalcon\Mvc\View;
use Phanbook\Backend\Forms\PostsForm;
use Phanbook\Models\Posts;
use Phanbook\Utils\Slug;

/**
 * Class IndexController
 */
class PagesController extends ControllerBase
{

    /**
     * Initiate grid
     */
    protected static function setGrid()
    {
        parent::$grid = [
            'grid' =>[
                'title'    => [
                    'title'  => t('Title'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                ],
                'username' => [
                    'title'  => t('Users'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                ],
                'null'    => ['title' => t('Actions')]
            ],
            'query' => [
                'columns' => [
                    'a.id',
                    'a.title',
                    'a.sticked',
                    'u.username',
                ],
                'joins' => [
                    [
                        'type' => 'join',
                        'model' => 'Phanbook\Models\Users',
                        'on' => 'a.usersId = u.id',
                        'alias' => 'u'
                    ]
                ],
                'where' => 'a.type = "pages"'
            ]
        ];
    }

    /**
     * indexAction function.
     *
     * @return void
     */
    public function indexAction()
    {
        if (empty(parent::$grid)) {
            self::setGrid();
        }

        $this->renderGrid('Phanbook\Models\Posts');
        $this->view->setVars(['grid' => parent::$grid]);
        $this->tag->setTitle(t('List pages'));

        if ($this->request->isAjax()) {
            $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
            $this->view->pick('partials/grid');
        }
    }

    /**
     * Create a new post
     * @todo
     *
     * @return [type] [description]
     */
    public function newAction()
    {
        $this->view->form = new PostsForm;
        $this->tag->setTitle('Adding post');
        $this->view->pick($this->router->getControllerName() . '/item');
    }
    public function editAction($id)
    {
        if (!$object = Posts::findFirstById($id)) {
            $this->flashSession->error(t('Posts doesn\'t exist.'));

            return $this->currentRedirect();
        }
        $this->tag->setTitle(t('Edit posts'));
        $this->view->form   = new PostsForm($object);
        $this->view->object = $object;

        return $this->view->pick($this->router->getControllerName() . '/item');
    }

    /**
     * @return \Phalcon\Http\ResponseInterface
     */
    public function saveAction()
    {
        $this->view->disable();
        //  Is not $_POST
        if (!$this->request->isPost()) {
            return $this->indexRedirect();
        }

        $id = $this->request->getPost('id');
        if (!empty($id)) {
            $object = Posts::findFirstById($id);
        } else {
            $object = new Posts();
        }
        $object->setSlug(Slug::generate($this->request->getPost('title')));
        $object->setUsersId($this->auth->getAuth()['id']);
        $object->setType(Posts::POST_PAGE);
        $form = new PostsForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            $this->saveLoger($form->getMessages());
            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->getPathController().(!is_null($id) ? '/edit/'.$id : '/new')
            );
        } else {
            if (!$object->save()) {
                $this->saveLoger($object->getMessages());
                return $this->dispatcher->forward(
                    ['controller' => $this->getPathController(), 'action' => 'new']
                );
            } else {
                $this->flashSession->success(t('Data was successfully saved'));

                return $this->indexRedirect();
            }
        }
    }
}
