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
namespace Phanbook\Backend\Controllers;

use Phalcon\Mvc\Controller;

/**
 * Backend Error Controller
 */
class ErrorsController extends Controller
{
    public function indexAction()
    {
        $this->view->message = t('The router not found');
    }
    /**
     * 404 paga
     */
    public function show404Action()
    {
        $message = $this->request->getQuery('msg') ? : 'The action not found';
        // Send a HTTP 404 response header
        $this->response->setStatusCode(404, 'Page Not Found');
        $this->view->message = t($message);
    }
    /**
     * 503 page
     */
    public function show503Action()
    {
        $this->response->setStatusCode(503, 'Site is Down for Maintenance');
        $this->view->team = $this->config->application->name;
    }
    /**
     * 505 page
     */
    public function show505Action()
    {
        $this->response->setStatusCode(505, 'Site in formations');
        $this->view->team = $this->config->application->name;
    }
    public function reportsAction()
    {
        $this->tag->setTitle(t('Reports error'));
    }
}
