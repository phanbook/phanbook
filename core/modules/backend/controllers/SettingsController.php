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

use Phalcon\Config\Adapter\Php as AdapterPhp;
use Phanbook\Backend\Forms\LogoForm;
use Phanbook\Backend\Forms\ThemeForm;
use Phanbook\Tools\ZFunction;
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
        $filename = ROOT_DIR . 'content/options/options.php';
        if (!file_exists($filename)) {
            $makeFile = ZFunction::makeFile($filename);
            file_put_contents($filename, "<?php return [];");
        }
        if (file_exists($filename)) {
            $application = [
                'application' => [
                    'name'      => $this->request->getPost('name'),
                    'tagline'   => $this->request->getPost('tagline'),
                    'publicUrl' => $this->request->getPost('publicUrl')
                ]
            ];
            $data   = new AdapterPhp($filename);
            $result = array_merge($data->toArray(), $application);
            $result ='<?php return ' . var_export($result, true) . ';';

            if (!file_put_contents($filename, $result)) {
                throw new \Exception("Data was not saved", 1);
            }
            $this->flashSession->success(t('Data was successfully deleted'));
            return $this->currentRedirect();
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
        $this->tag->setTitle(t('Google Analytic Settings'));
        $this->view->form = new GoogleAnalyticForm();
    }
    /**
     * Make data configuration to file options.php inside directory config
     *
     * @return mixed
     */
    public function saveAnalyticAction()
    {
        $this->view->disable();
        //Is not $_POST
        if (!$this->request->isPost()) {
            return $this->currentRedirect();
        }
        $filename = ROOT_DIR . 'content/options/options.php';
        if (!file_exists($filename)) {
            $makeFile = ZFunction::makeFile($filename);
            file_put_contents($filename, "<?php return [];");
        }
        if (file_exists($filename)) {
            $analytic  = [
                'google'    =>  [
                    'clientId'  =>  $this->request->getPost('clientID'),
                    'clientSecret'  =>  $this->request->getPost('clientSecret'),
                    'googleAnalytic'  =>  $this->request->getPost('analytic')
                ]
            ];
            $data   = new AdapterPhp($filename);
            $result = array_merge($data->toArray(), $analytic);
            $result ='<?php return ' . var_export($result, true) . ';';

            if (!file_put_contents($filename, $result)) {
                throw new \Exception("Data was not saved", 1);
            }
            if(!$this->request->getPost('requestAccess'))
                $this->flashSession->success(t('Data was successfully saved'));
        }
        if($this->request->getPost('requestAccess')){
            return $this->setAnalyticRequest();
        }
        return $this->currentRedirect();
    }
    /**
     * Check if google analytic's accept. If not, send request for authen
     */
    public function setAnalyticRequest(){
        $analytics = new Analytic();

        // If the user has already authorized this app then get an access token
        // else redirect to ask the user to authorize access to Google Analytics.
        $check = $analytics->checkAccessToken();
        if ($check == "OK") {

            $this->flashSession->success(t('Connected to googleAnalytic'));
            //$this->response->redirect("settings/analytic");
            // Set the access token on the client.
            
            // Create an authorized analytics service object.
            // $service = new \Google_Service_Analytics($client);

            // $projectId = $this->config->google->projectId;          //ID of phanbook project
            // if( $this->checkGoogleAnalyticHasProject($service, $projectId)){
            //     // dimensions
            //     $_params[] = 'visits';
            //     $_params[] = 'pageviews';
            //     $_params[] = 'bounces';
            //     $_params[] = 'entrance_bounce_rate';
            //     $_params[] = 'visit_bounce_rate';
            //     $_params[] = 'avg_time_on_site';

            //     $from = date('Y-m-d', time()-30*24*60*60);; // 30 days
            //     $to = date('Y-m-d'); // today

            //     $metrics = 'ga:visits,ga:pageviews,ga:bounces,ga:entranceBounceRate,ga:visitBounceRate,ga:avgTimeOnSite';
            //     $data = $service->data_ga->get('ga:'.$projectId, $from, $to, $metrics);
                
            // }
            // else
            //     echo "Don't have permission";
            
        } 
        else if ($check == "EXPIRED") {
            if($analytics->refreshGoogleToken()){
                $this->flashSession->success(t('Connected to googleAnalytic'));
            }
            else
                $this->flashSession->error(t('An error occured when refresh google access token'));
            //$this->response->redirect("settings/analytic");
        }

        else {
            $redirect_uri = $this->config->google->redirectAnalytic;
            header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
        }
    }

    private function setGoogleClient(){
        $client = new \Google_Client();
        $client->setClientId($this->config->google->clientId);
        $client->setClientSecret($this->config->google->clientSecret);
        $client->setRedirectUri($this->config->google->redirectAnalytic);
        $client->addScope(\Google_Service_Analytics::ANALYTICS_READONLY);

        /* Set offline for using google analytic even when google user offline */
        
        $client->setAccessType("offline");
        return $client;
    }

    private function checkGoogleAnalyticHasProject($googleAnalyticObj, $currentProjectID){
        $accounts = $googleAnalyticObj->management_accounts->listManagementAccounts();
        if (count($accounts->getItems()) > 0) {
            $accounts = $accounts->getItems();
            foreach ($accounts as $key => $acc) {
                $props = $googleAnalyticObj->management_webproperties->listManagementWebproperties($acc->getId());
                foreach($props['items'] as $item){
                    if($item['defaultProfileId'] == $currentProjectID)
                        return true;
                }
            }
        }
        return false;
    }
    public function googleAnalyticAction()
    {
        $analytic = new Analytic();

        $code = $this->request->get('code');
        if (! isset($code)) 
            header('Location: ' . filter_var($analytic->getAuthURL(), FILTER_SANITIZE_URL));
        else {
            $result = $analytic->saveGoogleToken($code);
            if($result['state']) 
                $this->flashSession->success(t($result['message']));
            else
                $this->flashSession->error(t($result['message']));
            $this->response->redirect("settings/analytic");
        }
    }
}
