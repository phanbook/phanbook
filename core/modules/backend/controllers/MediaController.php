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
use Phanbook\Models\Media;
use Phalcon\Http\Response;

/**
 * Class MediaController
 * @package Phanbook\Backend\Controller
 */
class MediaController extends ControllerBase
{
    private $mediaModel;
    public function indexAction()
    {
        $this->view->form = new MediaForm();
        $this->view->files = [];
    }
    public function settingAction()
    {

    }
    public function uploadAction()
    {
        $this->mediaModel = new Media();
        if ($this->request->hasFiles() == true) {
            $uploads = $this->request->getUploadedFiles();
            $this->view->disable();
            $uploaded = true;
            foreach ($uploads as $fileObj) {
                if (!$this->mediaModel->initFile($fileObj)) {
                    $uploaded = false;
                }
            }
            $response = new Response();
            if (!$uploaded) {
                $error = implode("\n", $this->mediaModel->getError());
                $response->setStatusCode(406, $error);
            } else {
                $response->setStatusCode(200, "Success");
            }
            return $response;
        } else {
            $this->assets->addCss('/core/assets/css/dropzone.css', false);
            $this->assets->addJs('/core/assets/js/dropzone.js', false);
            $this->view->acceptExt = implode(",", $this->constants->mediaAcceptFilesExt());
        }
    }
}
