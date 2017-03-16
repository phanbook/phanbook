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

use Phanbook\Backend\Forms\MediaForm;
use Phanbook\Models\Media;
use Phalcon\Http\Response;
use Phanbook\Models\MediaType;

/**
 * Class MediaController
 * @package Phanbook\Backend\Controller
 */
class MediaController extends ControllerBase
{

    public function indexAction()
    {
        $sql =[
            'model' => 'Media',
            'joins' => []
        ];
        $pagination = $this->paginator($sql)->getPaginate();

        $this->view->setVars([
            'imageType'     => Media::IMAGE_TYPE,
            'items'         => $pagination->items,
            'totalPages'    => $pagination->total_pages,
            'currentPage'   => $pagination->current,
        ]);
    }

    public function uploadAction()
    {

        if ($this->request->hasFiles()) {
            $media   = new Media();
            $uploads = $this->request->getUploadedFiles();
            $this->view->disable();
            $uploaded = true;
            foreach ($uploads as $fileObj) {
                if (!$media->initFile($fileObj)) {
                    $uploaded = false;
                }
            }
            if (!$uploaded) {
                $error = implode("\n", $media->getError());
                $this->response->setStatusCode(406, $error);
                $this->response->setContent($error);
            } else {
                $this->response->setStatusCode(200, t("Success"));
            }
            return $this->response->send();
        }

        $this->assets->addCss('/core/assets/css/dropzone.css', false);
        $this->assets->addJs('/core/assets/js/dropzone.js', false);
    }
}
