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
namespace Phanbook\Error\Controllers;

use Phalcon\Mvc\Controller;
use Phalcon\DispatcherInterface;

/**
 * \Phanbook\Error\Controllers\IndexController
 *
 * @property \Phalcon\Config $config
 *
 * @package Phanbook\Error\Controllers
 */
class IndexController extends Controller
{
    /**
     * Triggered before executing the controller/action method.
     *
     * @param  DispatcherInterface $dispatcher
     * @return bool
     */
    public function beforeExecuteRoute(DispatcherInterface $dispatcher)
    {
        if ($dispatcher->hasParam('message')) {
            $message = $dispatcher->getParam('message');
        } else {
            $message = "Sorry! We can't seem to find the page you're looking for.";
        }

        $this->view->setVars([
            'message' => t($message),
            'team'    => $this->config->get('application')->name
        ]);

        return true;
    }

    public function show400Action()
    {
        $this->response->setStatusCode(400, 'Page Not Found');
    }

    public function show404Action()
    {
        $this->response->setStatusCode(404, 'Page Not Found');
    }
}
