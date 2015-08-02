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

/**
 * Class IndexController
 */
class AdminController extends ControllerAdminBase
{
    public function indexAction()
    {
        $this->tag->setTitle(t('Dashboard'));
    }
    /**
     * Update core Phanbook
     *
     * @return mixed
     */
    public function updateAction()
    {
        $this->view->disable();
        $bool = shell_exec("cd ../ && php cli.php Update");
        if ($bool) {
            $this->flashSession->success(t('Phanbook upgraded successfully'));
            return $this->response->redirect($this->router->getControllerName());
        }
    }
}
