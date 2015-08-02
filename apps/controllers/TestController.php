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
use Phanbook\Models\Post;
use Phanbook\Forms\PostForm;
use Phanbook\Models\Province;
use Phanbook\Models\Data;
use Phanbook\Models\Test;
use Phanbook\Utils\Slug;
use Phanbook\Utils\GeoCoding;
use GuzzleHttp\Client;

/**
 * Class PostController
 *
 * @package Phanbook\Controllers
 */
class TestController extends ControllerBase
{
    /**
     * indexAction function.
     *
     * @access public
     * @return void
     */
    public function indexAction()
    {
        $this->view->disable();
        $client = new Client();
        $response = $client->get('https://maps.googleapis.com/maps/api/geocode/json?address=85+Phuong+9+HO+Van+Hue+Phu+Nhuan+VN');
        $reason = $response->json();
        d($reason);
    }

    public function slugAction()
    {
        $text = '85, Hồ văn hêu, phú nhuận, Tp Ho Chi Minh, VN';
        //d(GeoCoding::getData());
        d(Slug::generate($text, '+'));
    }

    /**
     * Method editAction
     */
    public function editAction($id)
    {
        if (!$object = Data::findById($id)) {
            $this->flashSession->error(t('Post doesn\'t exist.'));

            return $this->response->redirect('Post');
        }
        $this->assets->addJs('js/scripts.js');
        $this->assets->addJs('js/file-input/bootstrap-filestyle.min.js');
        $this->view->setVars(
            [
                'form'            => new PostForm($object),
                'object'          => $object
            ]
        );

        return $this->view->pick($this->router->getControllerName() . '/item');
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

        $id = $this->request->getPost('id', 'int', null);

        if (!empty($id)) {
            $object = Data::findFirstById($id);
        } else {
            $object = new Data;
            $object->location =[
                'geo' => array('type' => 'Point', 'coordinates' => ['1222','122']),
                'address' => array(
                    'country'   => Data::COUNTRY,
                    'city'      => 'Ho Chi minh',
                    'street'    => '85, Ho van Heu, Phu NHuan',
                    'zip'       => '444'

                ),
            ];
            $object->contact = [
                'phone'        => '',
                'fax'           => '',
                'linkWeb'       => '',
                'facebook'      => '',
                'google'        => '',
                'twitter'       => ''

            ];
            $object->formattedAddress = '85 Hồ Văn Huê, phường 9, Phú Nhuận, Hồ Chí Minh, Vietnam';
        }

        $form = new PostForm($object);
        $form->bind($_POST, $object);
        //d($form);
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
        $this->view->disable();
    }



    /**
     * Add new configuration
     */
    public function newAction()
    {
        $this->view->firstTime = true;
        $this->view->form = new PostForm();
        $this->view->pick($this->router->getControllerName() . '/item');
        /*foreach (Category::find() as $key => $value) {
            d($value->name);
        }*/
    }

    /**
     * Method toggleTasksAction
     *
     * @return mixed
     */
    public function toggleTasksAction()
    {
        if (!$this->request->isPost()) {
            $this->view->disable();

            return $this->response->redirect($this->router->getControllerName());
        }

        $this->setJsonResponse();

        if (empty($this->request->getPost('tasks'))) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('No tasks selected')
            ];
            return $this->jsonMessages;
        }

        if (!$Post = Post::findFirstById($this->request->getPost('idPost', 'int'))) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('Invalid Post')
            ];
            return $this->jsonMessages;
        }

        if (!in_array($this->request->getPost('assign'), [0, 1])) {
            $this->jsonMessages['messages'][] = [
                'type'    => 'error',
                'content' => t('Invalid request for assign')
            ];
            return $this->jsonMessages;
        }

        $save = 1;

        //assign tasks
        if ($this->request->getPost('assign') == 1) {
            foreach ($this->request->getPost('tasks') as $idTask) {
                $PostTask = new PostTask();
                $PostTask->setIdtask($idTask);
                $PostTask->setIdPost($Post->getId());
                $save &= $PostTask->save();
            }
        }
        //unassign tasks
        if ($this->request->getPost('assign') == 0) {
            $ids    = array_map(
                function ($key) {
                    return (int)$key;
                },
                $this->request->getPost('tasks')
            );
            $PostTask= PostTask::find('idTask IN (' . implode(',', $ids) . ') AND idPost = ' . $Post->getId());
            if (!$PostTask->delete()) {
                $save = 0;
            }
        }

        if (!$save) {
            foreach ($PostTask->getMessages() as $message) {
                $this->jsonMessages['messages'][] = [
                    'type'    => 'error',
                    'content' => t($message->getMessage())
                ];
            }
            return $this->jsonMessages;
        }

        $this->jsonMessages['messages'][] = [
            'type'    => 'success',
            'content' => t('Great! Tasks were moved successfully.')
        ];

        return $this->jsonMessages;
    }
}
