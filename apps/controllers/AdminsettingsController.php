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
namespace Phanbook\Controllers;

use Phanbook\Forms\LogoForm;
use Phanbook\Forms\ConfigurationsForm;

/**
 * Class IndexController
 */
class AdminsettingsController extends ControllerAdminBase
{
    public function indexAction()
    {
        $this->tag->setTitle(t('Site Settings'));
    }

    /**
     * Replacing logo frontend page default, the urladminsetting/logo__frontend
     * @return mixed
     */
    public function logoFrontendAction()
    {
        if ($this->request->isPost()) {
            if (!$name = $this->request->getPost('logoFrontend')) {
                $this->flashSession->error(t('Something wrong'));
                return  $this->currentRedirect();
            }
            $this->changeLogo($name);
        }
        $this->view->form = new LogoForm;
        $this->tag->setTitle(t('Change Logo Frontend'));
    }
    /**
     * Replacing logo backend page default, the urladminsetting/logo__backend
     * @return mixed
     */
    public function logoBackendAction()
    {
        if ($this->request->isPost()) {
            if (!$name = $this->request->getPost('logoBackend')) {
                $this->flashSession->error(t('Something wrong'));
                return  $this->currentRedirect();
            }
            $this->changeLogo($name);
        }
        $this->view->form = new LogoForm;
        $this->tag->setTitle(t('Change Logo Backend'));
    }
    /**
     * Replacing logo login page default, the url /adminsetting/logo__login
     * @return mixed
     */
    public function logoLoginAction()
    {
        if ($this->request->isPost()) {
            if (!$name = $this->request->getPost('logoLogin')) {
                $this->flashSession->error(t('Something wrong'));
                return  $this->currentRedirect();
            }
            $this->changeLogo($name);
        }
        $this->view->form = new LogoForm;
        $this->tag->setTitle(t('Change Logo Login Page'));
    }
    /**
     * Replacing logo favicon default, the url /adminsetting/logo__favicon
     * @return mixed
     */
    public function logoFaviconAction()
    {
        if ($this->request->isPost()) {
            if (!$name = $this->request->getPost('logoFavicon')) {
                $this->flashSession->error(t('Something wrong'));
                return  $this->currentRedirect();
            }
            $this->changeLogo($name);
        }
        $this->view->form = new LogoForm;
        $this->tag->setTitle(t('Change Logo Favicon Page'));
    }
    /**
     *
     * @param  string $name the name logo you want to save
     *
     * @return mixed
     */
    public function changeLogo($name)
    {
        $this->view->disable();
        $user = $this->auth->getAuth();

        if (!$user) {
            $this->flashSession->error(t('Hack attempt!!!'));
            return $this->response->redirect($this->router->getControllerName());
        }

        if ($this->request->hasFiles()) {
            foreach ($this->request->getUploadedFiles() as $file) {
                if ($this->imageCheck($file->getRealType())) {
                    // $image = new Imagick($file->getTempName());
                    // $image->resize(200, 200)->crop(100, 100);
                    // $image->save('images/thumb.jpg');
                    if ($file->getRealType() == "image/x-icon") {
                        $result = $file->moveTo('uploads/'. $name .'.ico');
                    } else {
                        $result = $file->moveTo('uploads/'. $name .'.png');
                    }
                    if (!$result) {
                        $this->flashSession->error(
                            t('Data was not saved, you need to change permisson for directory upload')
                        );
                        return $this->currentRedirect();
                    }
                    $this->flashSession->success(t('Data was successfully saved'));
                } else {
                    $this->flashSession->error(t('We don\'t accept that kind of file. Please upload an image.'));
                }
            }
        }
        return $this->currentRedirect();
    }
    /**
     * Render form create site
     *
     * @return mixed
     */
    public function generalAction()
    {
        $this->tag->setTitle(t('General Settings'));
        $this->view->form = new ConfigurationsForm();
    }
    /**
     * Make data configuration to file options.php inside directory config
     *
     * @return mixed
     */
    public function saveGeneralAction()
    {
        //Is not $_POST
        if (!$this->request->isPost()) {
            return $this->currentRedirect();
        }
        $filename = ROOT_DIR . 'common/config/options.php';
        if (!file_exists($filename)) {
            $makeFile = \Phanbook\Tools\ZFunction::makeFile($filename);
        }
        if (file_exists($filename)) {
            $name       = $this->request->getPost('name');
            $tagline    = $this->request->getPost('tagline');
            $publicUrl  = $this->request->getPost('publicUrl');

            $data = "<?php return new \Phalcon\Config([
                'application' => [
                    'name'      => '{$name}',
                    'tagline'   => '{$tagline}',
                    'publicUrl' => '{$publicUrl}'
                ],
            ]);";
            if (!file_put_contents($filename, $data)) {
                throw new \Exception("Data was not saved", 1);
            }
            $this->flashSession->success(t('Data was successfully deleted'));
            return $this->currentRedirect();
        }
        return $this->currentRedirect();
    }
}
