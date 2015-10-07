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
namespace Phanbook\Github;

use Phalcon\DI\Injectable;
use Guzzle\Http\Client as HttpClient;
use League\OAuth2\Client\Provider\Github;

/**
 * Class OAuth
 *
 * @package Phosphorum\Github
 */
class Auth extends Injectable
{
    protected $endPointAuthorize = 'https://github.com/login/oauth/authorize';

    protected $redirectUriAuthorize;

    protected $clientId;

    protected $clientSecret;



    /**
     * @param $config
     */
    public function __construct($config)
    {
        $this->redirectUriAuthorize = $config->redirectUri;
        $this->clientId             = $config->clientId;
        $this->clientSecret         = $config->clientSecret;
    }

    /**
     *
     */
    public function authorize()
    {
        $this->view->disable();
        $provider = new Github(
            [
                'clientId'      => $this->clientId,
                'clientSecret'  => $this->clientSecret,
                'redirectUri'   => $this->redirectUriAuthorize,
            ]
        );
        $code      = $this->request->getQuery('code');
        $state     = $this->request->getQuery('state');
        if (!isset($code)) {
            // If we don't have an authorization code then get one
            $authUrl = $provider->getAuthorizationUrl();
            $this->session->set('oauth2state', $provider->state);
            return $this->response->redirect($authUrl);
            // Check given state against previously stored one to mitigate CSRF attack
        } elseif (empty($state) || ($state !== $this->session->get('oauth2state'))) {
            $this->session->remove('oauth2state');
            exit('Invalid state');
        } else {
            // Try to get an access token (using the authorization code grant)
            $token = $provider->getAccessToken(
                'authorization_code',
                [
                'code' => $code
                ]
            );
            $uid = $provider->getUserUid($token);
            $userDetails = $provider->getUserDetails($token);
            return array($uid, $token, $userDetails);
        }
    }
}
