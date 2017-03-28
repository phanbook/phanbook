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
namespace Phanbook\Backend\Controllers;

use Phalcon\Mvc\Dispatcher;
use Phanbook\Controllers\Controller;

/**
 * \Phanbook\Backend\Controllers\ControllerBase
 *
 * @package Phanbook\Backend\Controllers
 */
class ControllerBase extends Controller
{
    public function initialize()
    {
        $this->loadDefaultAssets();

        $this->view->setVars([
            'currentOrder' => $this->currentOrder,
            'menuStruct'   => container('menuStruct'),
        ]);
    }

    /**
     * Load module assets.
     */
    protected function loadDefaultAssets()
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
    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        if (!$this->auth->isAdmin()) {
            $this->flashSession->notice(t('You do not have permission to access this page'));
            $dispatcher->setReturnedValue($this->response->redirect('/', true));
            return false;
        }
    }
}
