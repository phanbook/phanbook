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

use Phanbook\Tools\ZFunction;

/**
 * Class UpdateController
 * @package Phanbook\Backend\Controller
 */
class UpdateController extends ControllerBase
{

    /**
     * Update core Phanbook
     *
     * @return mixed
     */
    public function indexAction()
    {
        $this->tag->setTitle(t('Phanbook Updates'));
        if (ZFunction::gitUpdate()) {
            $this->view->output = ZFunction::gitUpdate();
            $this->flashSession->success(t('Phanbook upgraded successfully'));
        }
    }
}
