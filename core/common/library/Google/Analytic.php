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
class Analytic extends AnotherClass
{
	private $client;
	private $clientId;
	private $clientSecret;
	private $redirectAnalytic;
	private $accessToken;
	private $refreshToken
	
	function __construct($clientId, $clientSecret, $redirectAnalytic)
	{
		$this->client = new \Google_Client();
		$this->clientId = $clientId;
		$this->clientSecret = $clientSecret;
		$this->redirectAnalytic = $redirectAnalytic;
		$this->setGoogleClient();
	}
	public function setGoogleClient(){
        $this->client->setClientId($this->clientId);
        $this->client->setClientSecret($this->clientSecret);
        $this->client->setRedirectUri($this->redirectAnalytic);
        $this->client->addScope(\Google_Service_Analytics::ANALYTICS_READONLY);

        /* Set offline for using google analytic even when google user offline */
        
        $this->client->setAccessType("offline");

        $googleAnalytic = Settings::findFirst("name = 'googleAnalyticAccessToken'");
        $this->accessToken = $googleAnalytic->value;
        $googleAnalytic = Settings::findFirst("name = 'googleAnalyticRefreshToken'");
        $this->refreshToken = $googleAnalytic->value;
    }
    public function refreshGoogleToken(){

    }
    public function checkAccessToken(){
    	if (isset($this->accessToken) && $this->accessToken){
    		$this->client->setAccessToken($access_token);
    		if($this->client->isAccessTokenExpired()){
    			return "EXPIRED";
    		}
    		return "OK";
    	}
    	return "ERROR";
    }
    public function saveGoogleToken($code){

    	$this->client->authenticate($code);

        $googleAnalytic = Settings::findFirst("name = 'googleAnalyticAccessToken'");

        if($googleAnalytic) {

            // Get access token
            $googleAnalytic->value = $client->getAccessToken();

            // Get refresh token if have
            $authObj = json_decode($googleAnalytic->value);

            if(isset($authObj->refresh_token)){
                $refreshToken = Settings::findFirst("name = 'googleAnalyticRefreshToken'");
                $refreshToken->value = $authObj->refresh_token;
                if(!$refreshToken->save())
                	return ["state"	=>	false, "message" => t('An error occured when save google refresh token')];
            }
            if($googleAnalytic->save())
                
                return ["state"	=>	true, "message"	=>	t('Connected to googleAnalytic')];

            else

            	return ["state"	=>	false, "message" => t('An error occured when save google access token')];
     
        }
        return ["state"	=>	false, "message" => t('An error occured when find googleAnayticAccessToken')];
    }

    public function getClientObject(){
    	return $this->client;
    }
    public function getAuthURL(){
    	return $this->client->createAuthUrl();
    }
    public function getAccessToken(){
    	return $this->accessToken;
    }
    public function getrefreshToken(){
    	return $this->refreshToken;
    }
}