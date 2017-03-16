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
        $this->response->setStatusCode(400);
    }

    public function show401Action()
    {
        $this->response->setStatusCode(401);
        $this->response->setHeader('WWW-Authenticate', 'Digest realm="Access denied"');
    }

    public function show403Action()
    {
        $this->response->setStatusCode(403);
    }

    public function show404Action()
    {
        $this->response->setStatusCode(404);
    }

    public function show500Action()
    {
        $this->response->setStatusCode(500);
    }

    public function show503Action()
    {
        $this->response->setStatusCode(503);
    }
}
