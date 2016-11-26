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
 * \Phanbook\Frontend\Controllers\UsersController
 *
 * @package Phanbook\Frontend\Controllers
 */
class UsersController extends ControllerBase
{
    /**
     * @var int
     */
    public $perPage = 12;

    public function initialize()
    {
        parent::initialize();

        $this->view->pick('user');
    }

    public function detailAction($user)
    {
        if (!$user = Users::findFirstByUsername($user)) {
            $this->flashSession->error(t("The User doesn't exits"));
            return $this->indexRedirect();
        }

        $tab     = $this->request->getQuery('tab');
        $page    = isset($_GET['page']) ? (int)$_GET['page'] : $this->numberPage;
        $perPage = isset($_GET['perPage']) ? (int)$_GET['perPage'] : $this->perPage;
        $where  = '';
        if ($tab == "answers") {
            $join = [
                'type'  => 'join',
                'model' => 'PostsReply',
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

        $parametersNumberReply = [
            'group' => 'id, postsId',
            'usersId = ?0',
            'bind' => [$user->getId()],
        ];

        $paramQuestions = [
            'usersId = ?0 and type = "questions" and deleted = 0',
            'bind' => [$user->getId()]
        ];
        $totalPosts = $totalBuilder->getQuery()->setUniqueRow(true)->execute($params);
        $totalPages = ceil($totalPosts->count / $perPage);
        $offset     = ($page - 1) * $perPage + 1;

        if ($page > 1) {
            $itemBuilder->offset($offset);
        }

        $this->view->setVars(
            [
                'user'           => $user,
                'posts'          => $itemBuilder->getQuery()->execute($params),
                'totalQuestions' => Posts::count($paramQuestions),
                'totalReply'     => PostsReply::find($parametersNumberReply)->count(),
                'tab'            => $tab,
                'totalPages'     => $totalPages,
                'currentPage'    => $page,
            ]
        );
    }

    /**
     * Not use for now
     * @param  [type] $user [description]
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
            'model' => 'Users',
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
        $this->assets->addCss('core/assets/css/user.css');
    }

    /**
     * View and edit user profile.
     */
    public function profileAction()
    {
        if (!$this->auth->isAuthorizedVisitor()) {
            $this->response->setStatusCode(404);
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $user = $this->userService->findFirstById($this->auth->getUserId());

        if (!$user || !$this->userService->isActiveMember($user)) {
            $this->response->setStatusCode(404);
            $this->flashSession->error(t('Attempt to access non-existent user.'));

            $this->dispatcher->forward([
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $form = new UserForm($user);

        if ($this->request->isPost()) {
            // Validate the form and assign the values from the user input
            $form->bind($this->request->getPost(), $user);

            if (!$form->isValid()) {
                $messages = [];
                $this->response->setStatusCode(400);
                foreach ($form->getMessages() as $message) {
                    $messages[] = (string) $message->getMessage();
                }
                $this->flashSession->error(implode('<br>', $messages));
            } else {
                // @todo Process missed fields
                $user->setFirstname($this->request->getPost('firstname', 'striptags'));
                $user->setLastname($this->request->getPost('lastname', 'striptags'));
                $user->setEmail($this->request->getPost('email', 'email'));
                $user->setUsername($this->request->getPost('username', 'striptags'));
                $user->setBirthdate($this->request->getPost('birthDate'));
                $user->setBio($this->request->getPost('bio', 'trim'));
                $user->setTwitter($this->request->getPost('twitter'));
                $user->setGithub($this->request->getPost('github'));

                if (!$user->save()) {
                    $messages = [];
                    $this->response->setStatusCode(400);
                    foreach ($user->getMessages() as $message) {
                        $messages[] = (string) $message->getMessage();
                    }
                    $this->flashSession->error(implode('<br>', $messages));
                    return;
                }

                $this->response->setStatusCode(200);
                $this->flashSession->success(t('Profile successfully updated.'));
                $this->refreshAuthSession($user->toArray());
            }
        }

        $this->tag->setTitle(t('Edit Profile'));

        $this->view->setVars([
            'form'   => $form,
            'object' => $user,
            'email'  => $user->getEmail(),
        ]);
    }

    private function refreshAuthSession($array)
    {
        $auth = $this->auth->getAuth();
        $auth = array_merge($auth, $array);

        return $this->session->set('auth', $auth);
    }

    /**
     * @return bool
     */
    public function changepasswordAction()
    {
        $form = new ChangePasswordForm();
        $object = Users::findFirstById($this->auth->getUserId());

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
                    $this->flashSession->error(
                        t('User status is: ') .
                        $object->getStatusesWithLabels()[$object->getStatus()] .
                        ". You can't change your password."
                    );
                } else {
                    $this->flashSession->error(t("User doesn't exist !"));
                }
            }
        }

        return true;
    }

    /**
     *
     */
    public function settingAction()
    {
        if (!$this->auth->isAuthorizedVisitor()) {
            $this->response->setStatusCode(404);
            $this->flashSession->error(t("Sorry! We can't seem to find the page you're looking for."));

            $this->dispatcher->forward([
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $user = $this->userService->findFirstById($this->auth->getUserId());

        if (!$user || !$this->userService->isActiveMember($user)) {
            $this->response->setStatusCode(404);
            $this->flashSession->error(t('Attempt to access non-existent user.'));

            $this->dispatcher->forward([
                'controller' => 'posts',
                'action'     => 'index',
            ]);

            return;
        }

        $form = new UserSettingForm($user);

        if ($this->request->isPost()) {
            $form->bind($this->request->getPost(), $user);

            if (!$form->isValid()) {
                $messages = [];
                $this->response->setStatusCode(400);
                foreach ($form->getMessages() as $message) {
                    $messages[] = (string) $message->getMessage();
                }
                $this->flashSession->error(implode('<br>', $messages));
            } else {
                $value = $this->request->getPost('digest', 'yes_no');
                if (!$this->userService->updateDigestSettings($user, $value)) {
                    $this->flashSession->error(t('Something was wrong. Please try later'));
                } else {
                    $this->flashSession->success(t('Settings successfully updated.'));
                    $this->refreshAuthSession($user->toArray());
                    $this->response->redirect('/users/setting');

                    return;
                }
            }
        }

        $this->tag->setTitle(t('Edit profile'));

        $this->view->setVars([
            'form'   => $form,
            'object' => $user,
        ]);
    }
}
