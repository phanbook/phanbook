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

use Phanbook\Backend\Forms\LogoForm;
use Phanbook\Backend\Forms\ThemeForm;
use Phanbook\Backend\Forms\ConfigurationsForm;
use Phanbook\Backend\Forms\GoogleAnalyticForm;
use Phanbook\Models\Settings;
use Phanbook\Google\Analytic;

/**
 * Class SettingsController
 * @package Phanbook\Backend\Controller
 */
class SettingsController extends ControllerBase
{
    public function indexAction()
    {
        $this->tag->setTitle(t('Site Settings'));
    }

    public function logoAction()
    {
        $this->tag->setTitle(t('Logo Settings'));
        $this->view->pick('settings/index');
    }
    /**
     * Replacing logo frontend page default
     * @link admin/settings/logo-frontend
     *
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
     * Replacing logo backend page default
     *
     * @link   admin/settings/logoBackend
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
     * Replacing logo login page default
     *
     * @link   admin/settings/logoLogin
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
     * Replacing logo favicon default
     *
     * @link   admin/settings/logo-favicon
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
                    $path = ROOT_DIR . '/content/uploads/';
                    if ($file->getRealType() == "image/x-icon") {
                        $result = $file->moveTo($path . $name .'.ico');
                    } else {
                        $result = $file->moveTo($path . $name .'.png');
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
        $this->view->disable();
        //Is not $_POST
        if (!$this->request->isPost()) {
            return $this->currentRedirect();
        }
        $application = [
                'application' => [
                    'name'      => $this->request->getPost('name'),
                    'tagline'   => $this->request->getPost('tagline'),
                    'publicUrl' => $this->request->getPost('publicUrl')
                ]
            ];
        if ($this->phanbook->saveConfig($application)) {
            $this->flashSession->success(t('Data was successfully deleted'));
        } else {
            $this->flashSession->error(t('Data was not saved'));
        }
        return $this->currentRedirect();
    }

    /**
     * Render form setting google GoogleAnalytic
     *
     * @return mixed
     */
    public function analyticAction()
    {
        $analytic = new Analytic();
        $this->view->isLogged = false;
        // We check if user authorization
        if ($analytic->checkAccessToken()) {
            $this->view->isLogged = true;
        }
        $this->assets->addCss('assets/css/bootstrap-multiselect.css');
        $this->assets->addJs('assets/js/bootstrap-multiselect.js');
        $trackingID = Settings::getAnalyticTrackingID();
        $accountID = Settings::getAnalyticAccountID();
        $this->view->isConfigured = false;
        if ($accountID) {
            $profile = $analytic->getViewInfo($accountID, $trackingID);
            if ($profile['state']) {
                $this->view->isConfigured = true;
                $this->view->profile = $profile['profile'];
            } else {
                $this->flashSession->warning(t("We can't configure your analytic profile"));
            }
        }
        $this->tag->setTitle(t('Google Analytic Settings'));
        $this->view->form = new GoogleAnalyticForm(null, $analytic);
    }

    /**
     * Verify access token and save to database
     * @return Redirect to calling action
     */

    public function authorizationAction()
    {
        $this->view->disable();
        if ($this->request->getPost('save')) {
            $accessCode = $this->request->getPost('accessCode');
            if ($accessCode) {
                $analytic = new Analytic();
                if ($analytic->setAccessCode($accessCode)) {
                    $this->flashSession->success(t('Connected to google analytic service!'));
                    return $this->currentRedirect();
                }
            }
        }
        $this->flashSession->error(t('An error occured when verify access code!'));
        return $this->currentRedirect();
    }
    /**
     * Request to google authorization page
     */

    public function requestAuthAction()
    {
        $this->view->disable();
        if ($this->request->getPost('author')) {
            $analytic = new Analytic();
            $authURL = $analytic->getAuthURL();
            $this->response->redirect(filter_var($authURL, FILTER_SANITIZE_URL));
        }
    }
    /**
     *
     * Clean current connected google account
     *
     */

    public function cleanAuthAction()
    {
        $this->view->disable();
        $analytic = new Analytic();
        $analytic->clearAuth();
        Settings::clearAuth();
        $this->flashSession->error(t('Clear Authorization Success!'));
        return $this->currentRedirect();
    }
    /**
     *
     * Save changes analytic setting
     *
     */

    public function analyticSettingAction()
    {
        $this->view->disable();
        if ($this->request->getPost('save')) {
            $obj = explode("_._", $this->request->getPost('selectView'));
            $trackingID = $obj[0];
            $accountID = $obj[1];
            if (Settings::setAnalyticTrackingID($trackingID)) {
                if (Settings::setAnalyticAccountID($accountID)) {
                    $analytic = new Analytic();
                    $profile = $analytic->getViewInfo($accountID, $trackingID);
                    if ($profile['state']) {
                        if ($this->phanbook->saveConfig(['googleAnalytic' => $profile['profile']['trackingID']])) {
                            if (Settings::setAnalyticProfileID($profile['profile']['profileID'])) {
                                $this->flashSession->success(t('Save Analytic setting success!'));
                            }
                        } else {
                            $this->flashSession->error(t('An error occured, We can\'t save tracking ID!'));
                        }
                    } else {
                        $this->flashSession->error(t('An error occured, We can\'t find Profile information!'));
                    }
                    return $this->currentRedirect();
                }
            }
            $this->flashSession->error(t('An error occured when save setting!'));
        }
        return $this->currentRedirect();
    }
    /**
     *
     * Save changes about what analytic module will display on dashboard
     *
     */

    public function moduleDisplayAction()
    {
        $this->view->disable();
        if ($this->request->getPost('save')) {
            $listActivity = $this->request->getPost('topActivity');
            if (Settings::setListTopActivity($listActivity)) {
                $this->flashSession->success(t('Save Analytic module(s) position success!'));
            } else {
                $this->flashSession->error(t('An error occured, We can\'t save this change!'));
            }
        }
        return $this->currentRedirect();
    }
}
