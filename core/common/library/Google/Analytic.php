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
namespace Phanbook\Google;

use Phanbook\Models\Settings;
use Phalcon\DI\Injectable;

/**
 *
 */
class Analytic extends Injectable
{
    /**
     *
     * @var string
     */
    private $client;

    /**
     *
     * @var string
     */
    private $clientId;

    /**
     *
     * @var string
     */
    private $clientSecret;

    public function __construct()
    {
        $this->client = new \Google_Client();
        $this->setGoogleClient($this->config->google->clientId, $this->config->google->clientSecret);
    }
    public function setGoogleClient($clientId, $clientSecret)
    {
        $redirectUrl = "urn:ietf:wg:oauth:2.0:oob";
        $this->client->setClientId($clientId);
        $this->client->setClientSecret($clientSecret);
        $this->client->addScope(\Google_Service_Analytics::ANALYTICS_READONLY);
        $this->client->setRedirectUri($redirectUrl);
        /* Set offline for using google analytic even when google user offline */

        $this->client->setAccessType("offline");
        $access_token = Settings::getAccessToken();
        if ($access_token) {
            $this->client->setAccessToken($access_token);
        }
    }
    public function setAccessCode($code)
    {
        try {
            $oauthParams = $this->client->authenticate($code);
        } catch (\Exception $e) {
            return false;
        }
        $oauth = json_decode($oauthParams);
        if (!Settings::setAccessToken($oauthParams)) {
            return false;
        }
        if (isset($oauth->refresh_token)) {
            Settings::setRefreshToken($oauth->refresh_token);
        }
        return true;
    }
    public function checkAccessToken()
    {
        if (!Settings::getAccessToken()) {
            return false;
        }
        if ($this->client->isAccessTokenExpired()) {
            if ($this->refreshToken()) {
                return true;
            } else {
                return false;
            }
        }
        return true;
    }
    public function getAuthURL()
    {
        return $this->client->createAuthUrl();
    }
    public function clearAuth()
    {
        $this->client->revokeToken();
    }
    public function refreshToken()
    {
        $refreshToken = Settings::getRefreshToken();
        if (!$refreshToken) {
            return false;
        }
        if ($this->client->isAccessTokenExpired()) {
            $this->client->refreshToken($refreshToken);
            $newtoken = $this->client->getAccessToken();
            if (Settings::setAccessToken($newtoken)) {
                return true;
            }
        }
    }
    /**
     * Get list of projects connected to logged account
     * @return array list project
     */

    public function getListView()
    {
        if ($this->checkAccessToken()) {
            $service = new \Google_Service_Analytics($this->client);
            $listView = [];
            try {
                $result = $service->management_accounts->listManagementAccounts();
                $accounts = $result->items;
                foreach ($accounts as $account) {
                    try {
                        $profiles = $service->management_profiles->listManagementProfiles($account->id, '~all');
                        foreach ($profiles->getItems() as $profile) {
                            $listView[] = [
                                "accountName"   =>  $account->name,
                                "accountID"     =>  $account->id,
                                "profileURL"    =>  $profile->websiteUrl,
                                "profileID"     =>  $profile->id,
                                "profileName"   =>  $profile->name,
                                "timezone"      =>  $profile->timezone,
                                "webPropertyId" =>  $profile->webPropertyId
                            ];
                        }
                    } catch (\Exception $e) {
                    }
                }
            } catch (\Exception $e) {
                return ["state" => false, "message" => "User doesn't have any Google Analytics Account"];
            }
            return ["state" => true, "listView" => $listView];
        }
    }
    /**
     * Get profile information form google analytic
     * @param string $accountID account analytic ID
     * @param string $profileID webPropertyID
     * @return mixed
     */
    public function getViewInfo($accountID, $profileID)
    {
        $service = new \Google_Service_Analytics($this->client);
        try {
            $profiles = $service->management_profiles->listManagementProfiles($accountID, $profileID);
            foreach ($profiles->getItems() as $profile) {
                $result = [
                    "profileURL"    =>  $profile->websiteUrl,
                    "profileName"   =>  $profile->name,
                    "timeZone"      =>  $profile->timezone,
                    "trackingID"    =>  $profile->webPropertyId,
                    "profileID"     =>  $profile->id,
                ];
            }
            return ["state" =>  true, "profile"     =>  $result];
        } catch (\Exception $e) {
            return ["state" =>  false, "message"    =>  "Exception when get profile : ".print_r($e)];
        }
    }

    public function getAnalyticData($listGA, $numbDate)
    {
        $profileID = Settings::getAnalyticProfileID();
        if ($profileID) {
            $accountID = Settings::getAnalyticAccountID();
            $profileObj = $this->getViewInfo($accountID, $profileID);
            if ($profileObj["state"]) {
                $service = new \Google_Service_Analytics($this->client);

                $from = date('Y-m-d', time()-$numbDate*24*60*60);
                $to = date('Y-m-d'); // today
                $metrics = implode(',', $listGA);
                //$metrics = 'ga:visits,ga:pageviews,ga:bounces,ga:entranceBounceRate,ga:visitBounceRate,ga:avgTimeOnSite';
                $data = $service->data_ga->get('ga:'.$profileObj['profile']['profileID'], $from, $to, $metrics);
                return $data['rows'][0];
            }
        }
        return false;

    }
}
