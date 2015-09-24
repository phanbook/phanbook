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
namespace Phanbook\Backend\Controllers;

use Phalcon\Mvc\View;
use Phanbook\Forms\PagesForm;
use Phanbook\Models\Pages;
use Google_Client as GoogleClient;
/**
 * Class TestsController
 *
 * @package Phanbook\Blog\Controllers
 */
class DashboardController extends ControllerBase
{
    /**
     * indexAction function.
     *
     * @return string
     */
    public function indexAction()
    {
    	$client = $this->setGoogleClient();
    	// If the user has already authorized this app then get an access token
		// else redirect to ask the user to authorize access to Google Analytics.
		$access_token = $this->session->get('access_token');
		if (isset($access_token) && $access_token) {
		  	// Set the access token on the client.
		  	$client->setAccessToken($access_token);

		  	// Create an authorized analytics service object.
		  	$service = new \Google_Service_Analytics($client);

		  	$projectId = $this->config->google->projectId;			//ID of phanbook project
		  	if( $this->checkGoogleAnalyticHasProject($service, $projectId)){
		  		// dimensions
				$_params[] = 'visits';
				$_params[] = 'pageviews';
				$_params[] = 'bounces';
				$_params[] = 'entrance_bounce_rate';
				$_params[] = 'visit_bounce_rate';
				$_params[] = 'avg_time_on_site';

				$from = date('Y-m-d', time()-30*24*60*60);; // 30 days
				$to = date('Y-m-d'); // today

				$metrics = 'ga:visits,ga:pageviews,ga:bounces,ga:entranceBounceRate,ga:visitBounceRate,ga:avgTimeOnSite';
				$data = $service->data_ga->get('ga:'.$projectId, $from, $to, $metrics);
				
		  	}
		  	else
		  		echo "Don't have permission";
			
		} else {
		  	$redirect_uri = $this->config->google->redirectAnalytic;
		  	header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
		}
		//$this->view->disable();
        $this->tag->setTitle(t('Dashboard'));
    }
    public function googleAnalyticAction()
    {
    	$client = $this->setGoogleClient();
    	$code = $this->request->get('code');
    	if (! isset($code)) {
		  	$auth_url = $client->createAuthUrl();
		  	header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
		} else {
		  	$client->authenticate($code);
		  	$this->session->set('access_token',$client->getAccessToken());
		  	$redirect_uri = $this->config->google->redirectDashboard;
		  	header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
		}
    	$this->view->disable();
    }
    private function setGoogleClient(){
    	$client = new GoogleClient();
    	$client->setClientId($this->config->google->clientId);
    	$client->setClientSecret($this->config->google->clientSecret);
    	$client->setRedirectUri($this->config->google->redirectAnalytic);
    	$client->addScope(\Google_Service_Analytics::ANALYTICS_READONLY);
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
}
