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

$frontend = new RouterGroup([
    'module'     => 'frontend',
    'controller' => 'posts',
    'action'     => 'index',
    'namespace'  => 'Phanbook\Frontend\Controllers',
]);

$frontend->add('/:controller/:action/:params', [
    'controller' => 1,
    'action'     => 2,
    'params'     => 3,
]);

$frontend->add('/:controller/:int', [
    'controller' => 1,
    'id'         => 2,
]);

$frontend->add('/:controller/:int/{slug}', [
    'controller' => 1,
    'id'         => 2,
    'slug'       => 3,
    'action'     => 'view'
]);

$frontend->add('/posts/:int/{slug}', [
    'id'     => 1,
    'slug'   => 2,
    'action' => 'view'
]);

$frontend->add('/:controller[/]?', [
    'controller' => 1,
]);

$frontend->add('/blog/{id:[0-9]+}/{slug}', [
    'controller' => 'posts',
    'action'     => 'view'
]);

$frontend->add('/questions/{id:[0-9]+}/{slug}', [
    'controller' => 'posts',
    'action'     => 'view'
]);

$frontend->add('/questions/new', [
    'controller' => 'posts',
    'action'     => 'new'
]);

$frontend->add('/questions/edit/{id:[0-9]+}', [
    'controller' => 'posts',
    'action'     => 'edit'
]);

$frontend->add('/questions', [
    'controller' => 'posts',
    'action'     => 'index'
]);

$frontend->add('/posts/{type}', [
    'controller' => 'posts',
    'action'     => 'index'
]);

$frontend->add('/posts/new', [
    'controller' => 'posts',
    'action'     => 'new'
]);

$frontend->addPost('/posts/vote', [
    'controller' => 'posts',
    'action'     => 'vote'
]);

$frontend->add('/{router}', [
    'module'     => 'frontend',
    'controller' => 'router',
])->beforeMatch(function ($uri, $route) {
    $uris = ['posts', 'users', 'tags', 'search', 'questions', 'backend'];

    if ($uri == '/' || in_array(ltrim($uri, '/'), $uris)) {
        return false;
    }

    return ! $this->getRequest()->isAjax();
});

$frontend->add('/tags/{id:[0-9]+}/{slug}', [
    'controller' => 'tags',
    'action'     => 'postByTag'
]);

$frontend->add(
    '/@{username:[a-zA-Z0-9]+}',
    [
        'controller' => 'users',
        'action'     => 'detail'
    ]
);

$frontend->add('/language/{code}', [
    'controller' => 'language',
    'action'     => 'index'
]);

$frontend->addGet('/legal/terms-of-service', 'Legal::terms')
      ->setName('terms');

$frontend->add('/', [
    'controller' => 'posts',
    'action'     => 'index',
]);

$frontend->add('/posts/save', [
    'controller' => 'posts',
    'action'     => 'save',
]);

return $frontend;
