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

/**
 * Class RouterController
 * This class to router page
 *
 * @package Phanbook\Frontend\Controllers
 */
class RouterController extends ControllerBase
{

    public function initialize()
    {
        parent::initialize();
        $this->view->pick('page');

    }
    /**
     * indexAction function.
     *
     */
    public function indexAction()
    {
        $router = $this->dispatcher->getParam('router');
        if (empty($router)) {
            $router = 'page';
        }
        $this->view->page = $this->phanbook->getPageByTitle($router);
        if (file_exists($this->phanbook->getPageFile($router))) {
            return $this->view->pick('page-' . $router);
        }
        return $this->view->pick('page');
    }
}
