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
 * Frontend Error Controller
 */
class ErrorsController extends Controller
{

    /**
     * 503 page
     */
    public function show503Action()
    {
        $this->response->setStatusCode(503, 'Site is Down for Maintenance');
        $this->view->team = $this->config->application->name;
    }
}
