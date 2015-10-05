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
use Phalcon\Mvc\Router\Group;
use Phalcon\Mvc\Router;

$router = new Router(false);
$router->setDefaults([
    'module'     => 'frontend',
    'controller' => 'posts',
    'action'     => 'index'
]);
$router->removeExtraSlashes(true);

/*
 * All defined routes are traversed in reverse order until Phalcon\Mvc\Router
 * finds the one that matches the given URI and processes it, while ignoring the rest.
 */
$frontend = new Group([
    'module' => 'frontend',
]);
$frontend->add('/:controller/:action/:params', [
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);
$frontend->add('/:controller/:int', [
    'controller' => 1,
    'id' => 2,
]);
$frontend->add('/:controller/:int/{slug:[a-z\-]+}', [
    'controller' => 1,
    'id' => 2,
    'slug' => 3,
    'action' => 'view'
]);
$frontend->add('/posts/:int/{slug:[a-z\-]+}', [
    'id'        => 1,
    'slug'      => 2,
    'action'    => 'view'
]);
$frontend->add('/:controller[/]?', [
    'controller' => 1,
]);
$frontend->add('/blog/{id:[0-9]+}/{slug:[a-z\-]+}', [
    'controller' => 'posts',
    'action' => 'view'
]);
$frontend->add('/questions/{id:[0-9]+}/{slug:[a-z\-]+}', [
    'controller' => 'posts',
    'action' => 'view'
]);
$frontend->add('/questions/new', [
    'controller' => 'posts',
    'action' => 'new'
]);

$frontend->add('/');
$router->mount($frontend);

/**
 * Define routes for each module
 */
$modules = ['oauth', 'backend'];
foreach ($modules as $module) {
    $group = new Group([
        'module' => $module,
    ]);
    $group->setPrefix('/' . $module);
    $group->add('/:controller/:action/:params', array(
        'controller' => 1,
        'action' => 2,
        'params' => 3,
    ));
    $group->add('/:controller/:int', [
        'controller' => 1,
        'id' => 2,
    ]);
    $group->add('/:controller[/]?', [
        'controller' => 1,
    ]);
    $frontend->add('/:controller/:int/{slug:[a-z\-]+}', [
        'controller' => 1,
        'id'    => 2,
        'slug'  => 3,
        'action' => 'view'
    ]);

    $group->add('[/]?', array());
    $router->mount($group);
}
$router->add('/backend', [
    'module'     => 'backend',
    'controller' => 'dashboard',
]);

$router->add('/oauth/github/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenGithub'
]);
$router->add('/oauth/google/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenGoogle'
]);
$router->add('/oauth/facebook/access_token', [
    'module'     => 'oauth',
    'controller' => 'login',
    'action'     => 'tokenFacebook'
]);

$router->add('/questions', [
    'module'     => 'frontend',
    'controller' => 'posts',
]);
/**
 * @link https://docs.phalconphp.com/en/latest/reference/routing.html#match-callbacks
 */
$router->add('/{router}', [
    'module'     => 'frontend',
    'controller' => 'router',
])->beforeMatch(function ($uri, $route) {
    if ($uri == '/questions') {
        return false;
    }
    if ($uri == '/backend') {
        return false;
    }
    if ($uri == '/') {
        return false;
    }
    if ($uri == '/posts') {
        return false;
    }
    return true;
});

return $router;
