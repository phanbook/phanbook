<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
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

$oauth->add('/users/reset-password', 'Register::resetpassword', ['GET', 'POST'])
      ->setName('resetpassword');

$oauth->add('/users/forgot-password', 'Register::forgotpassword', ['GET', 'POST'])
      ->setName('forgotpassword');

$oauth->add('/users/register', 'Register::index', ['GET', 'POST'])
    ->setName('register');

$oauth->add('/users/signup', 'Register::signup', ['GET', 'POST'])
    ->setName('signup');

$oauth->addGet('/users/signin/google', 'Login::google')
    ->setName('signin-google');

$oauth->addGet('/users/signin/github', 'Login::github')
    ->setName('signin-github');

$oauth->addGet('/users/signin/facebook', 'Login::facebook')
    ->setName('signin-facebook');

$oauth->addGet('/users/signin/twitter', 'Login::twitter')
    ->setName('signin-twitter');

$oauth->add('/users/signin', 'Login::index', ['GET', 'POST'])
      ->setName('signin');

$oauth->addGet('/users/logout', 'Logout::index')
    ->setName('logout');

return $oauth;
