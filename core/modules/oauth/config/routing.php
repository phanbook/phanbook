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

use Phalcon\Mvc\Router\Group as RouterGroup;

$oauth = new RouterGroup([
    'module'     => 'oauth',
    'namespace'  => 'Phanbook\Oauth\Controllers',
]);

$oauth->add('/oauth/:controller', [
    'module' => 'oauth',
    'controller' => 1,
]);

$oauth->add('/oauth/:controller/:int', [
    'module' => 'oauth',
    'controller' => 1,
    'id' => 2,
]);

$oauth->add('/oauth/:controller/:action/:params', [
    'module' => 'oauth',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);

$oauth->add('/oauth/github/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenGithub'
]);

$oauth->add('/oauth/google/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenGoogle'
]);

$oauth->add('/oauth/facebook/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenFacebook'
]);

$oauth->add('/oauth/resetpassword', [
    'module'     => 'oauth',
    'controller' => 'register',
    'action'     => 'resetpassword'
]);

return $oauth;
