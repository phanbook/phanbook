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

use Phanbook\Models\ActivityNotifications;

/**
 * Class NotificationController
 */
class NotificationController extends ControllerBase
{
    public function readnotifyAction()
    {
        $this->view->disable();
        $usersId = $this->auth->getAuth()['id'];
        if ($this->request->isPost()) {
            $id = $this->request->getPost('id');
            $object = $this->request->getPost('object');
            if ($object == ActivityNotifications::TYPE_POSTS) {
                $notify = ActivityNotifications::findFirst(
                    [
                    'usersId = ?0 AND postsId = ?1',
                    'bind' => [$usersId, $id]
                    ]
                );
            } else {
                $notify = ActivityNotifications::findFirst(
                    [
                    'usersId = ?0 AND postsReplyId = ?1',
                    'bind' => [$usersId, $id]
                    ]
                );
            }
            if ($notify) {
                $notify->setWasRead('Y');
                if (!$notify->save()) {
                    $this->saveLoger($notify->getMessages());
                }
            }
        }
    }
}
