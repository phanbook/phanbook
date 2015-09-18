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
namespace Phanbook\Oauth\Controllers;

use Phalcon\Mvc\Controller;

/**
 * Class LogoutController
 *
 * @package Phanbook\Oauth\Controllers
 */
class LogoutController extends ControllerBase
{

    /**
     * logoutAction
     *
     * @return void
     */
    public function indexAction()
    {
        // Destroy the whole session
        $this->auth->remove();
        $this->view->disable();
        $this->response->redirect();
    }
}
