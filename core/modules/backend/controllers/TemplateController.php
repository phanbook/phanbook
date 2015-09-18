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

use Phanbook\Backend\Forms\TemplateForm;
use Phanbook\Models\Template;
use Phalcon\Mvc\View;

/**
 * Class TemplateController
 *
 * @package Phanbook\Backend\Controllers
 */
class TemplateController extends ControllerBase
{
    /**
     * Initiate grid
     */
    protected static function setGrid()
    {
        parent::$grid = [
            'grid' =>
                [
                    'id'      => [
                        'title'  => 'Id',
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'int', 'style' => 'width: 60px;']
                    ],
                    'name'    => [
                        'title'  => t('Name'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'key'     => [
                        'title'  => t('Key'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'subject' => [
                        'title'  => t('Subject'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'null'    => ['title' => t('Actions')]
                ]
        ];
    }

    /**
     * indexAction function.
     *
     * @access public
     * @return void
     */
    public function indexAction()
    {
        if (empty(parent::$grid)) {
            self::setGrid();
        }

        $this->renderGrid('Phanbook\Models\Template');
        $this->view->setVars(['grid' => parent::$grid]);
        $this->tag->setTitle(t('Configuration templates'));

        if ($this->request->isAjax()) {
            $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
            $this->view->pick('partials/grid');
        }
    }

    /**
     * @param $id
     *
     * @return \Phalcon\Http\ResponseInterface
     */
    public function editAction($id)
    {
        if (!$object = Template::findFirstById($id)) {
            $this->flashSession->error(t('Template doesn\'t exist.'));

            return $this->indexRedirect();
        }
        $this->tag->setTitle(t('Edit template'));
        $this->view->form   = new TemplateForm($object);
        $this->view->object = $object;

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
            $object = Template::findFirstById($id);
        } else {
            $object = new Template();
        }

        $form = new TemplateForm($object);
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
                return $this->indexRedirect();
            }
        }
    }

    /**
     * Add new configuration
     */
    public function newAction()
    {
        $this->view->form = new TemplateForm();
        $this->view->pick($this->router->getControllerName() . '/item');
    }
}
