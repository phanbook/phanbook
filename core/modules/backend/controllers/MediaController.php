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

use Phanbook\Backend\Forms\MediaForm;

/**
 * Class MediaController
 * @package Phanbook\Backend\Controller
 */
class MediaController extends ControllerBase
{
    public function indexAction()
    {
        $this->view->title = $this->constants->mediaTitle();
        $this->view->form = new MediaForm();
    }
    public function settingAction()
    {

    }
}
