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
     * @var Google_Client object
     */
    private $client;

    /**
     * Google Analytic client ID
     * @var string
     */
    private $clientId;

    /**
     * Google Analytic client Secret
     * @var string
     */
    private $clientSecret;

    /**
     * Use batch to execute multi query to get analytic data in same time
     * Reduce time execute
     * @var Google_Http_Batch object
     */
    private $batch;
    /**
     * True if use Batch. Otherwise, false
     * @var boolean
     */
    private $useBatch;

    /**
     * Google Analytic selected profile ID
     * @var string
     */
    private $profileID;

    public function __construct()
    {
        $this->client = new \Google_Client();
        $this->useBatch = false;
        $this->setGoogleClient($this->config->google->clientId, $this->config->google->clientSecret);
    }
    /**
     * Set basic config for google Analytic
     * @param [type] $clientId     Your client ID
     * @param [type] $clientSecret Your client Secret
     */
    public function setGoogleClient($clientId, $clientSecret)
    {
        $this->client->setClientId($clientId);
        $this->client->setClientSecret($clientSecret);
        /**
         * Set use Google API for Google Analytic
         */
        $this->client->addScope(\Google_Service_Analytics::ANALYTICS_READONLY);

        /**
         * Use variable $redirectUrl to redirect to google auth page
         */
        $redirectUrl = "urn:ietf:wg:oauth:2.0:oob";
        $this->client->setRedirectUri($redirectUrl);

        /* Set offline for using google analytic even when google user offline */
        $this->client->setAccessType("offline");

        /**
         * Get access token from database (if have)
         */
        $access_token = Settings::getAccessToken();

        /**
         * If have access token, set it to google client
         */
        if ($access_token) {
            $this->client->setAccessToken($access_token);
        }
    }
    /**
     * Authenticate given access code to get access token and refresh token
     * Save those to database
     * @param string $code access code
     */
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
        if (Settings::getAccessToken()) {
            if ($this->refreshToken()) {
                return true;
            }
        }
        return false;
    }
    public function getAuthURL()
    {
        return $this->client->createAuthUrl();
    }
    public function clearAuth()
    {
        $this->client->revokeToken();
    }

    /**
     * Access token has time live. After time live is expired, We need to get new access token
     * by using refresh token
     * @return boolean true if refresh success, otherwise, false
     */
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
            return false;
        }
        return true;
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
    public function getViewInfo($accountID, $trackingID)
    {
        $service = new \Google_Service_Analytics($this->client);
        try {
            $profiles = $service->management_profiles->listManagementProfiles($accountID, $trackingID);
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

    /**
     * Get google Analytic data from google.
     * If we use google batch, each query to get data will move to batch queue
     * @param  array/string $listGA google dimensions
     * @param  datetime $from   start time to get analytic data
     * @param  datetime $to     end time to get analytic data
     * @param  string $prefix [for batch]. separate different query
     * @return [mixed]
     */
    public function getAnalyticData($listGA, $from, $to, $prefix)
    {
        $profileID = Settings::getAnalyticProfileID();
        if ($profileID) {
            $accountID = Settings::getAnalyticAccountID();
            $service = new \Google_Service_Analytics($this->client);
            if (is_array($listGA)) {
                $metrics = implode(',', $listGA);
            } else {
                $metrics = $listGA;
            }
            if ($this->useBatch) {
                $data = $service->data_ga->get('ga:'.$profileID, $from, $to, $metrics);
                $this->batch->add($data, $metrics.$prefix);
                return true;
            } else {
                $data = $service->data_ga->get('ga:'.$profileID, $from, $to, $metrics);
                return $data['rows'][0];
            }

        }
        return false;
    }

    /**
     * Get analytic data since $numbDate days until now
     * @param  array/string $listGA   google dimensions
     * @param  int $numbDate number date
     * @return mixed
     */
    public function getAnalyticDataFromNow($listGA, $numbDate, $prefix = "_now")
    {
        $from = date('Y-m-d', time()-$numbDate*24*60*60);
        $to = date('Y-m-d'); // today

        return $this->getAnalyticData($listGA, $from, $to, $prefix);
    }

    /**
     * Get analytic data from 2*$numbDate to (now - $numbDate)
     * @param  array/string $listGA   google dimensions
     * @param  int $numbDate number date
     * @return mixed
     */
    public function getAnalyticDataFromPrev($listGA, $numbDate, $prefix = "_prev")
    {
        $from = date('Y-m-d', time()-2*$numbDate*24*60*60);
        $to = date('Y-m-d', time()-$numbDate*24*60*60);

        return $this->getAnalyticData($listGA, $from, $to, $prefix);
    }

    public function setUseBatch($use = false)
    {
        if ($use == true) {
            $this->useBatch = true;
            $this->client->setUseBatch(true);
            $this->batch = new \Google_Http_Batch($this->client);
        } else {
            $this->useBatch = false;
            $this->client->setUseBatch(false);
        }

    }
    public function batchExecute()
    {
        return $this->batch->execute();
    }
}
