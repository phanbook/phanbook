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

$router->setDefaults([
    'module'     => 'frontend',
    'controller' => 'posts',
    'action'     => 'index'
]);
$router->removeExtraSlashes(true);


$router->add('/:controller/:action/:params', [
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);
$router->add('/:controller/:int', [
    'controller' => 1,
    'id' => 2,
]);
$router->add('/:controller/:int/{slug}', [
    'controller' => 1,
    'id' => 2,
    'slug' => 3,
    'action' => 'view'
]);
$router->add('/posts/:int/{slug}', [
    'id'        => 1,
    'slug'      => 2,
    'action'    => 'view'
]);
$router->add('/:controller[/]?', [
    'controller' => 1,
]);
$router->add('/blog/{id:[0-9]+}/{slug}', [
    'controller' => 'posts',
    'action' => 'view'
]);
$router->add('/questions/{id:[0-9]+}/{slug}', [
    'controller' => 'posts',
    'action' => 'view'
]);
$router->add('/questions/new', [
    'controller' => 'posts',
    'action' => 'new'
]);
$router->add('/questions/edit/{id:[0-9]+}', [
    'controller' => 'posts',
    'action' => 'edit'
]);
$router->add('/questions', [
    'controller' => 'posts',
    'action' => 'index'
]);

$router->add('/posts/{type}', [
    'controller' => 'posts',
    'action' => 'index'
]);

$router->add('/posts/new', [
    'controller' => 'posts',
    'action' => 'new'
]);
$router->add('/posts/vote', [
    'controller' => 'posts',
    'action' => 'vote'
]);

/**
 * @link https://docs.phalconphp.com/en/latest/reference/routing.html#match-callbacks
 */
$router->add('/{router}', [
    'module'     => 'frontend',
    'controller' => 'router',
])->beforeMatch(function ($uri, $route) {
    $uris = ['posts', 'users', 'tags', 'search' , 'questions', 'backend'];
    if (in_array(ltrim($uri, '/'), $uris)) {
        return false;
    }
    if ('/' == $uri) {
        return false;
    }
    if (isset($_SERVER['HTTP_X_REQUESTED_WITH'])
        && $_SERVER['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest') {
        return false;
    }
    return true;
});

$router->add('/tags/{id:[0-9]+}/{slug}', [
    'controller' => 'tags',
    'action' => 'postByTag'
]);
$router->add(
    '/@{username:[a-zA-Z0-9]+}',
    [
        'controller' => 'users',
        'action'     => 'detail'
    ]
);
