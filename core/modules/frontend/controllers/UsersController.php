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
namespace Phanbook\Frontend\Controllers;

use Phanbook\Models\Users;
use Phanbook\Models\Posts;
use Phanbook\Models\ModelBase;
use Phanbook\Models\PostsReply;
use Phanbook\Frontend\Forms\UserForm;
use Phanbook\Frontend\Forms\UserSettingForm;
use Phanbook\Frontend\Forms\ChangePasswordForm;

/**
 * Class UsersController
 */
class UsersController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->assets->addCss('core/assets/css/user.css');
        $this->view->pick('user');
    }

    public function detailAction($user)
    {
        if (!$user = Users::findFirstByUsername($user)) {
            $this->flashSession->error(t('The User dosen\'t exits'));
            return $this->indexRedirect();
        }
        $tab = $this->request->getQuery('tab', 'string');
        $where  = '';
        if ($tab == "answers") {
            $join = [
                'type'  => 'join',
                'model' => 'Phanbook\\Models\\PostsReply',
                'on'    => 'r.postsId = p.id',
                'alias' => 'r'

            ];
            list($itemBuilder, $totalBuilder) =
                ModelBase::prepareQueriesPosts($join, $where, $this->perPage);
                $itemBuilder->groupBy(array('p.id'));
        } else {
            list($itemBuilder, $totalBuilder) =
                ModelBase::prepareQueriesPosts('', $where, $this->perPage);
        }
        $params =[];
        switch ($tab) {
            case 'questions':
                $this->tag->setTitle('Questions');
                $questionConditions = 'p.type = "questions"';
                $itemBuilder->where($questionConditions);
                break;
            case 'answers':
                $this->tag->setTitle('My Answers');
                $answersConditions = 'r.usersId = ?0';
                $itemBuilder->where($answersConditions);
                //$totalBuilder->where($answersConditions);
                break;
            default:
                $this->tag->setTitle('All Questions');
                break;
        }
        $conditions = 'p.deleted = 0 and p.usersId = ?0';
        if ($tab == 'answers') {
            $conditions = 'p.deleted = 0';
        }
        $itemBuilder->andWhere($conditions);
        $totalBuilder->andWhere($conditions);
        $params = array($user->getId());
        //get all reply
        $parametersNumberReply = [
            'group' => 'postsId',
            'usersId = ?0',
            'bind' => [$user->getId()],
        ];

        $paramQuestions = [
            'usersId = ?0 and type = "questions" and deleted = 0',
            'bind' => [$user->getId()]
        ];

        $this->view->setVars(
            [
                'user'              => $user,
                'posts'             => $itemBuilder->getQuery()->execute($params),
                'totalQuestions'    => Posts::count($paramQuestions),
                'totalReply'        => PostsReply::find($parametersNumberReply)->count(),
                'tab'               => $tab
            ]
        );
    }
    /**
     * Not use for now
     * @param  [type] $user [description]
     * @return [type]       [description]
     */
    public function contributionAction($user = null)
    {
        $this->view->disable();
        switch ($tab) {
            case 'yeah':
                // code...
                break;
            case 'months':
                // code...
                break;
            case 'weeks':
                // code...
                break;
            case 'day':
                // code...
                break;
            default:
                break;
        }


        echo json_encode(['946721039'=>'2', '946706853'=>'3', '946706853'=> '1111']);
    }

    public function indexAction()
    {

        $sql = [
            'model' => 'Phanbook\Models\Users',
            'joins' => []

        ];
        //Create a Model paginator
        $data = $this->paginator($sql);
        $this->view->setVars(
            [
                'paginator' => $data->getPaginate(),
                'tab'  => 'users',
            ]
        );
        $this->tag->setTitle(t('List all users'));
    }
    public function profileAction()
    {
        $object = Users::findFirstById($this->auth->getAuth()['id']);

        if (!$object) {
            $this->flashSession->error(t('Hack attempt!!!'));

            return $this->response->redirect($this->router->getControllerName() . '/profile');
        }
        $form = new UserForm($object);
        $form->bind($_POST, $object);

        if ($this->request->isPost()) {
            if (!$form->isValid()) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                }
            } else {
                $object->setFirstname($this->request->getPost('firstname', 'striptags'));
                $object->setLastname($this->request->getPost('lastname', 'striptags'));
                $object->setGender($this->request->getPost('gender'));
                $object->setDigest($this->request->getPost('digest'));

                if (!$object->save()) {
                    foreach ($object->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                    }
                } else {
                    $this->flashSession->success(t('Data was successfully saved'));
                    $this->refreshAuthSession($object->toArray());
                    return $this->response->redirect($this->router->getControllerName() . '/profile');
                }
            }
        }
        $this->tag->setTitle(t('Edit profile'));
        $this->view->form   = $form;
        $this->view->object = $object;
    }
    private function refreshAuthSession($array)
    {
        $auth = $this->auth->getAuth();
        $auth = array_merge($auth, $array);

        return $this->session->set('auth', $auth);
    }
    public function changepasswordAction()
    {
        $form = new ChangePasswordForm();
        $object = Users::findFirstById($this->auth->getAuth()['id']);

        $this->view->form = $form;

        if ($this->request->isPost()) {
            if (!$form->isValid($this->request->getPost())) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                }
            } else {
                if ($object && $object->getStatus() == $object::STATUS_ACTIVE) {
                    if (!$this->security->checkHash($this->request->getPost('passwd'), $object->getPasswd())) {
                        $this->flashSession->error(t('Oops! Wrong password.'));
                    } else {
                        $newPass = $this->security->hash($this->request->getPost('passwd_new_confirm'));
                        $object->setPasswd($newPass);
                        if (!$object->save()) {
                            $this->displayModelErrors($object);
                        } else {
                            $this->flashSession->success(t('Hooray! Your password was successfully changed.'));
                            return $this->response->redirect($this->router->getControllerName() . '/changepassword');
                        }
                    }
                } elseif ($object && $object->getStatus() != Users::STATUS_ACTIVE) {
                    $this->flashSession->error(t('User status is: ') . $object->getStatusesWithLabels()[$object->getStatus()] . '. You can\'t change your password.');
                } else {
                    $this->flashSession->error(t('User doesn\'t exist !'));
                }
            }
        }

        return true;
    }
    public function settingsAction()
    {
        $object = Users::findFirstById($this->auth->getAuth()['id']);
        if (!$object) {
            $this->flashSession->error(t('Hack attempt!!!'));
            return $this->response->redirect();
        }
        $form = new UserSettingForm($object);
        $form->bind($_POST, $object);
        if ($this->request->isPost()) {
            if (!$form->isValid()) {
                foreach ($form->getMessages() as $message) {
                    $this->flashSession->error($message->getMessage());
                }
            } else {
                $object->setDigest($this->request->getPost('digest'));
                if (!$object->save()) {
                    foreach ($object->getMessages() as $message) {
                        $this->flashSession->error($message->getMessage());
                    }
                } else {
                    $this->flashSession->success(t('Data was successfully saved'));
                    $this->refreshAuthSession($object->toArray());
                    return $this->response->redirect($this->router->getControllerName() . '/settings');
                }
            }
        }
        $this->tag->setTitle(t('Edit profile'));
        $this->view->form   = $form;
        $this->view->object = $object;
    }
}
