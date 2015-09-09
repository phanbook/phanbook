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

use Phalcon\Mvc\View;
use Phanbook\Forms\StickyForm;
use Phanbook\Models\Posts;

/**
 * Class IndexController
 */
class AdminpostsController extends ControllerAdminBase
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
                    'title'    => [
                        'title'  => t('Title'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'type' => [
                        'title'  => t('Type'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'numberViews' => [
                        'title'  => t('Number Views'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                    ],
                    'sticked' => [
                        'title'  => t('Sticked'),
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

        $this->renderGrid('Phanbook\Models\Posts');
        $this->view->setVars(['grid' => parent::$grid]);
        $this->tag->setTitle(t('Sticky at top of lists'));

        if ($this->request->isAjax()) {
            $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
            $this->view->pick('partials/admin-grid');
        }
    }
    public function newAction()
    {
        $this->view->form = new StickyForm;
        $this->tag->setTitle('Adding sticked');
        $this->view->pick('adminsticky/item');
    }
    /**
     * @param $id
     *
     * @return \Phalcon\Http\ResponseInterface
     */
    public function editAction($id)
    {
        if (!$object = Posts::findFirstById($id)) {
            $this->flashSession->error(t('Posts doesn\'t exist.'));

            return $this->response->redirect($this->router->getControllerName());
        }
        $this->tag->setTitle(t('Edit sticked'));
        $this->view->form   = new StickyForm($object);
        $this->view->object = $object;

        return $this->view->pick($this->router->getControllerName() . '/item');
    }
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            $this->flashSession->error(t('Hack attempt!!!'));
            return $this->currentRedirect();
        }
        $id = $this->request->getPost('id');

        if (!$object = Posts::findFirstById($id)) {
            $this->flashSession->error(t('The post not exist'));
            return $this->currentRedirect();
        }
        $object->setSticked($this->request->getPost('sticked'));
        if (!$object->save()) {
            error_log('Save false '. __LINE__ . ' and ' . __CLASS__);
            return false;
        }
        $this->flashSession->success(t('Data was successfully saved'));
        return $this->response->redirect($this->router->getControllerName());
    }
}
