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
    'module'    => 'oauth',
    'namespace' => 'Phanbook\Oauth\Controllers',
]);

$oauth->add('/oauth/:controller', [
    'controller' => 1,
]);

$oauth->add('/oauth/:controller/:int', [
    'controller' => 1,
    'id'         => 2,
]);

$oauth->add('/oauth/:controller/:action/:params', [
    'controller' => 1,
    'action'     => 2,
    'params'     => 3,
]);

$oauth->add('/oauth/github/access_token', [
    'controller' => 'login',
    'action'     => 'tokenGithub'
]);

$oauth->add('/oauth/google/access_token', [
    'controller' => 'login',
    'action'     => 'tokenGoogle'
]);

$oauth->add('/oauth/facebook/access_token', [
    'controller' => 'login',
    'action'     => 'tokenFacebook'
]);

$oauth->add('/oauth/resetpassword', [
    'controller' => 'register',
    'action'     => 'resetpassword'
]);

$oauth->addPost('/users/register', 'Register::index')
    ->setName('register');

$oauth->add('/users/signup', 'Register::signup', ['GET', 'POST'])
    ->setName('signup');

$oauth->addGet('/users/logout', 'Logout::index')
    ->setName('logout');

return $oauth;
