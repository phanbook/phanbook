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

/**
 * Class ThemesController
 *
 * @package Phanbook\Backend\Controllers
 */
class ThemesController extends ControllerBase
{

    /**
     * indexAction function.
     *
     * @return string
     */
    public function indexAction()
    {

        return '';
    }
    /**
     * List all files of themes
     *
     * @return mixed
     */
    public function customAction()
    {
        $themePath = ROOT_DIR . 'content/themes/' . $this->config->theme;
        $tab = $this->request->getQuery('tab');
        switch ($tab) {
            case 'assets':
                $this->view->assetsCss  = new \RecursiveDirectoryIterator($themePath . '/assets/css');
                $this->view->assetsJs   = new \RecursiveDirectoryIterator($themePath . '/assets/js');

                break;
            case 'partials':
                $this->view->partialsDir = new \RecursiveDirectoryIterator($themePath . '/partials');
                break;
            default:
                $this->view->directory = new \RecursiveDirectoryIterator($themePath);
        }
        $this->assets->addJs('/core/assets/js/jquery.redirect.js', false);
    }
    /**
     * Edit items of themes
     *
     * @return mixed
     */
    public function editAction()
    {
        $filepath = $this->request->getPost('filepath');
        $filename = $this->request->getPost('filename');
        $content = file_get_contents($filepath);

        $this->view->setVars(
            [
            'content'   => $content,
            'filename'  => $filename,
            'filepath'  => $filepath
            ]
        );
        $this->view->pick('themes/item');
    }
    /**
     *
     *
     * @return mixed
     */
    public function saveAction()
    {
        if (!$this->request->isPost()) {
            $this->flash->error(t('Hack temp!'));
            $this->indexRedirect();
        }
        $content    =  $this->request->getPost('content');
        $filepath   =  $this->request->getPost('filepath');
        if (!$this->manageFile($filepath, $content)) {
            return $this->dispatcher->forward([
                'controllers' => $this->router->getControllerName(),
                'action' => 'edit'
            ]);
        }
        $this->flashSession->success(t('Data was successfully saved'));
        return $this->response->redirect($this->router->getControllerName() . '/custom');
    }
    /**
     *
     * @param  string $file    the full path file name of themes
     * @param  string $content this is the code you change
     * @return bool|string
     */
    public function manageFile($file, $content)
    {

        if (!is_writeable($file)) {
            $this->flashSession->error(t('Files for saving template is not writable.'));
            return false;
        }

        if (file_put_contents($file, $content)) {
            return true;
        }

        $this->flashSession->error(t('File template could not be changed.'));
        return false;
    }
}
