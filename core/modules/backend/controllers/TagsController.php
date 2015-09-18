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
namespace Phanbook\Backend\Controllers;

use Phalcon\Mvc\View;
use Phanbook\Backend\Forms\TagsForm;
use Phanbook\Models\Tags;

/**
 * Class TagsController
 */
class TagsController extends ControllerBase
{
    protected static function setGrid()
    {
        parent::$grid = [
            'grid' => [
                'id'   => [
                    'title'  => 'Id',
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'int', 'style' => 'width: 60px;']
                ],
                'name' => [
                    'title'  => t('Name'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => '']
                ],
                'slug' => [
                    'title'  => t('Slug'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => '']
                ],
                'description' => [
                    'title'  => t('Description'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => '']
                ],
                'numberPosts' => [
                    'title'  => t('Number posts'),
                    'order'  => true,
                    'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => '']
                ],
                'null' => ['title' => t('Actions')]
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
        $this->renderGrid('Phanbook\Models\Tags');
        $this->view->setVars(['grid' => parent::$grid]);
        $this->tag->setTitle(t('All tags'));
        if ($this->request->isAjax()) {
            $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
            $this->view->pick('partials/grid');
        }
    }

    /**
     * Method editAction
     */
    public function editAction($id)
    {
        if (!$object = Tags::findFirstById($id)) {
            $this->flashSession->error(t('Tag doesn\'t exist.'));

            return $this->currentRedirect();
        }

        $this->view->form = new TagsForm($object);
        $this->view->object = $object;
        $this->tag->setTitle(t('Edit tag'));
        return $this->view->pick($this->router->getControllerName() . '/item');
    }


    public function saveAction()
    {
        //  Is not $_POST
        if (!$this->request->isPost()) {
            $this->view->disable();

            return $this->currentRedirect();
        }

        $id = $this->request->getPost('id', 'int', null);

        if (!empty($id)) {
            $object = Tags::findFirstById($id);
        } else {
            $object = new Tags;
        }

        $form = new TagsForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            foreach ($form->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
            }

            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->getPathController() . (!is_null($id) ? '/edit/' . $id : '/new')
            );
        } else {
            if (!$object->save()) {
                foreach ($object->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                }

                return $this->dispatcher->forward(
                    ['controller' => $this->getPathController(), 'action' => 'new']
                );
            } else {
                $this->flashSession->success(t('Data was successfully saved'));

                return $this->currentRedirect();
            }
        }
    }

    public function newAction()
    {
        $this->view->form = new TagsForm();
        $this->view->pick($this->router->getControllerName() . '/item');
        $this->tag->setTitle(t('Add tag'));
    }

    public function deleteAction($id)
    {
        if (!$object = Tags::findFirstById($id)) {
            $this->flashSession->error(t('Tag doesn\'t exist.'));
            return $this->response->redirect('tag');
        }
        if (!$object->delete()) {
            return $this->response->redirect('tag');
        }
        $this->flashSession->success(t('Data was successfully deleted'));
        return $this->currentRedirect();
    }
}
