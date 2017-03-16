<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Oauth\Controllers;

/**
 * \Phanbook\Oauth\Controllers\LogoutController
 *
 * @package Phanbook\Oauth\Controllers
 */
class LogoutController extends ControllerBase
{
    /**
     * Log Out Action
     */
    public function indexAction()
    {
        // Destroy the whole session
        $this->auth->remove();
        $this->response->redirect();
    }
}
