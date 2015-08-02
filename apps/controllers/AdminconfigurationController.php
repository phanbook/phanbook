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

use Phanbook\Models\Configuration;
use Phanbook\Forms\ConfigurationForm;
use Phalcon\Mvc\View;

/**
 * @extends ControllerBase
 */
class AdminconfigurationController extends ControllerAdminBase
{
    /**
     * Initiate grid
     */
    protected static function setGrid()
    {
        parent::$grid = [
            'grid'    =>
                [
                    'id'           => [
                        'title'  => t('Id'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'int', 'style' => 'width: 60px;']
                    ],
                    'key'          => [
                        'title'  => t('Key'),
                        'order'  => true,
                        'filter' => ['type' => 'input', 'sanitize' => 'string', 'style' => '']
                    ],
                    'type'         => [
                        'title'  => t('Type'),
                        'order'  => true,
                        'filter' => [
                            'type'     => 'select',
                            'sanitize' => 'int',
                            'using'    => null,
                            'values'   => Configuration::getTypesWithLabels(),
                            'style'    => 'width: 100px;'
                        ]
                    ],
                    'value'        => [
                        'title'  => t('Value'),
                        'filter' => ['type' => 'input', 'sanitize' => 'number', 'style' => 'width : 90px;']
                    ],
                    'caption'      => [
                        'title'          => t('Caption'),
                        'filter'         => ['type' => 'input', 'sanitize' => 'string', 'style' => ''],
                        'display_filter' => 'truncate'
                    ],
                    'null'         => ['title' => t('Actions')]
                ],
                // 'query'   => [
                //     'columns' => [
                //         'a.id',
                //         'a.key',
                //         'a.type',
                //         'a.value',
                //         'a.caption',
                //         'o.name as organization'
                //     ],
                //     'joins'   => [
                //         [
                //             'type'  => 'leftJoin',
                //             'model' => 'Phanbook\Models\Organization',
                //             'on'    => 'a.idOrganization = o.id',
                //             'alias' => 'o'
                //         ]
                //     ],
                //     'groupBy' => 'a.id'
                // ],
                'actions' => [
                'delete' => ['title' => t('Delete selected'), 'class' => 'btn btn-sm btn-danger']
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

        $this->renderGrid('Phanbook\Models\Configuration');
        $this->view->setVars(['grid' => parent::$grid]);

        if ($this->request->isAjax()) {
            $this->view->setRenderLevel(View::LEVEL_ACTION_VIEW);
            $this->view->pick('partials/grid');
        }
    }

    public function gridAction()
    {
        if (empty(parent::$grid)) {
            self::setGrid();
        }

        if ($this->request->getPost('action') && array_key_exists(
            $this->request->getPost('action'),
            $this->gridActions
        )
        ) {
            $ids    = $this->request->getPost('checkboxes');
            $method = $this->gridActions[$this->request->getPost('action')];
            $this->view->disable();

            return $this->$method($ids);
        }

        return parent::gridAction();
    }

    /**
     * Method editAction
     */
    public function editAction($id)
    {
        if (!$object = Configuration::findFirstById($id)) {
            $this->flashSession->error(t('Configuration doesn\'t exist.'));

            return $this->response->redirect('configuration');
        }

        $this->assets->addCss('js/chosen/chosen.css');
        $this->assets->addJs('js/chosen/chosen.jquery.min.js');

        $this->view->configurationForm = new ConfigurationForm($object);
        $this->view->object            = $object;
        $this->view->pick($this->router->getControllerName() . '/item');
    }

    public function saveAction()
    {
        //  Is not $_POST
        if (!$this->request->isPost()) {
            $this->view->disable();

            return $this->response->redirect($this->router->getControllerName());
        }

        $id = $this->request->getPost('id', 'int', null);

        if (!empty($id)) {
            $object = Configuration::findFirstById($id);
        } else {
            $object = new Configuration();
        }

        $form = new ConfigurationForm($object);
        $form->bind($_POST, $object);

        //  Form isn't valid
        if (!$form->isValid($this->request->getPost())) {
            foreach ($form->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
            }

            // Redirect to edit form if we have an ID in page, otherwise redirect to add a new item page
            return $this->response->redirect(
                $this->router->getControllerName() . (!is_null($id) ? '/edit/' . $id : '/new')
            );
        } else {
            if (!$object->save()) {
                foreach ($object->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                }

                return $this->dispatcher->forward(
                    ['controller' => $this->router->getControllerName(), 'action' => 'new']
                );
            } else {
                $this->flashSession->success(t('Data was successfully saved'));

                return $this->response->redirect($this->router->getControllerName());
            }
        }
    }

    /**
     * Add new configuration
     */
    public function newAction()
    {
        $this->assets->addCss('js/chosen/chosen.css');
        $this->assets->addJs('js/chosen/chosen.jquery.min.js');

        $this->view->configurationForm = new ConfigurationForm();
        $this->view->pick($this->router->getControllerName() . '/item');
    }
}
