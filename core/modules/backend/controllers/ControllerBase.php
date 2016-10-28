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
namespace Phanbook\Backend\Controllers;

use Phanbook\Controllers\Controller;
use Phalcon\Mvc\Dispatcher;

/**
 * \Phanbook\Backend\Controllers\ControllerBase
 *
 * @property \Phalcon\Logger\Adapter\File $logger
 * @package Phanbook\Backend\Controllers
 */
class ControllerBase extends Controller
{
    /**
     * @var array
     */
    private $securedRoutes = [
        ['controller' => 'admin'],
        ['controller' => 'template'],
        ['controller' => 'posts'],
        ['controller' => 'settings'],
        ['controller' => 'pages'],
        ['controller' => 'users'],
        ['controller' => 'tags'],
        ['controller' => 'dashboard'],
        ['controller' => 'update'],
        ['controller' => 'tests'],
        ['controller' => 'media'],
        ['controller' => 'themes']

    ];

    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        if ($this->auth->isAdmin() && $this->isSecuredRoute($dispatcher)) {
            return true;
        }
        header('Location:/oauth/login');
        exit;
    }


    public function initialize()
    {
        $this->view->currentOrder = $this->currentOrder;
        $this->loadDefaultAssets();
        $this->view->menuStruct = $this->menuStruct;
    }

    /**
     * loadDefaultAssets function.
     *
     * @access private
     * @return void
     */
    private function loadDefaultAssets()
    {
        $this->assets
            ->addCss('//fonts.googleapis.com/css?family=Open+Sans', false)
            ->addCss('core/assets/css/bootstrap.min.css')
            ->addCss('core/assets/css/font-awesome.min.css')
            ->addCss('core/assets/css/animate.css')
            ->addCss('backend/assets/css/app.css')
            ->addCss('backend/assets/css/app-custom.css');
        $this->assets
            ->addJs('core/assets/js/jquery.js')
            ->addJs('core/assets/js/jquery-ui.js')
            ->addJs('core/assets/js/bootstrap.js')
            ->addJs('core/assets/js/growl/jquery.growl.js')
            ->addJs('core/assets/js/chosen/chosen.jquery.min.js')
            ->addJs('backend/assets/js/jquery.taginput.src.js')
            ->addJs('backend/assets/js/app.js')
            ->addJs('backend/assets/js/app.plugin-custom.js');
    }

    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    private function isSecuredRoute(Dispatcher $dispatcher)
    {
        foreach ($this->securedRoutes as $route) {
            if ($route['controller'] == $dispatcher->getControllerName()) {
                return true;
            }
        }

        return false;
    }
}
