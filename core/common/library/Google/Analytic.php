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

/**
*
*/
class Analytic
{
	private $client;
	private $clientId;
	private $clientSecret;

	function __construct()
	{
		$this->client = new \Google_Client();
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
        if($access_token){
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
        if(!Settings::setAccessToken($oauthParams))
            return false;
        if(isset($oauth->refresh_token))
            Settings::setRefreshToken($oauth->refresh_token);
        return true;
    }
    public function checkAccessToken()
    {
        if(!Settings::getAccessToken())
            return false;
        if($this->client->isAccessTokenExpired())
        {
            if($this->refreshToken())
                return true;
            else return false;
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
        if(!$refreshToken)
            return false;
        if($this->client->isAccessTokenExpired()){
            $this->client->refreshToken($refreshToken);
            $newtoken = $this->client->getAccessToken();
            if(Settings::setAccessToken($newtoken))
                return true;
        }
    }
    public function getAnalyticData($arrayGA)
    {

    }
    /**
     *
     * Get list of projects connected to logged account
     * @return array list project
     *
     */

    public function getListView()
    {
        if($this->checkAccessToken()){
            $service = new \Google_Service_Analytics($this->client);
            $listView = [];
            try {
                $result = $analytics->management_accounts->listManagementAccounts();
                $accounts = $result->items;
                foreach ($accounts as $account) {
                    try {
                        $webObj = $analytics->management_webproperties->listManagementWebproperties($account->id);
                        $webProperties = $webObj->items;
                        foreach ($webProperties as $webProperty) {
                            $listView[] = [
                                "accountName"   =>  $account->name,
                                "accountID"     =>  $account->id,
                                "projectURL"    =>  $webProperty->websiteUrl,
                                "projectID"     =>  $webProperty->id,
                                "projectName"   =>  $webProperty->name
                            ];
                        }
                    }
                    catch (\Exception $e) {

                    }
                }
            } catch (\Exception $e) {
                return ["state" => false, "message" => "User doesn't have any Google Analytics Account"];
            }
            return ["state" => true, "listView" => $listView];
        }
    }
}
