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
$router = new Phalcon\Mvc\Router();

//$router->setDefaultModule("frontend");
$router->setDefaultNamespace("Phanbook\Controllers");
$router->setDefaultController('posts');
$router->removeExtraSlashes(true);


$router->add(
    '/',
    [
        'controller' => 'posts',
        'action'     => 'index'
    ]
);
//Router /tip,/posts,/questions
$router->add(
    '/{collection}',
    [
        'controller' => 'posts',
        'action'     => 'index'
    ]
);

$router->add(
    '/posts/{order:[a-z]+}',
    [
        'controller' => 'posts',
        'action'     => 'index'
    ]
);
//Delete posts
$router->add(
    '/posts/delete/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'delete'
    ]
);
$router->add(
    '/questions/delete/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'delete'
    ]
);
$router->add(
    '/tips/delete/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'delete'
    ]
);
$router->add(
    '/hackernews/delete/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'delete'
    ]
);

//View posts
$router->add(
    '/posts/{id:[0-9]+}/{slug}',
    [
        'controller' => 'posts',
        'action'     => 'view'
    ]
);
$router->add(
    '/questions/{id:[0-9]+}/{slug}',
    [
        'controller' => 'posts',
        'action'     => 'view'
    ]
);
$router->add(
    '/tips/{id:[0-9]+}/{slug}',
    [
        'controller' => 'posts',
        'action'     => 'view'
    ]
);
$router->add(
    '/hackernews/{id:[0-9]+}/{slug}',
    [
        'controller' => 'posts',
        'action'     => 'view'
    ]
);
//Edit posts
$router->add(
    '/posts/edit/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'edit'
    ]
);
$router->add(
    '/questions/edit/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'edit'
    ]
);
$router->add(
    '/tips/edit/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'edit'
    ]
);
$router->add(
    '/hackernews/edit/{id:[0-9]+}',
    [
        'controller' => 'posts',
        'action'     => 'editHackernew'
    ]
);
//Save Posts
$router->add(
    '/posts/save',
    [
        'controller' => 'posts',
        'action'     => 'save'
    ]
);
//Vote and reply posts
$router->add(
    '/posts/vote',
    [
        'controller' => 'posts',
        'action'     => 'vote'
    ]
);
$router->add(
    '/posts/answer',
    [
        'controller' => 'replies',
        'action'     => 'answer'
    ]
);
//Create post such as tip, question, hackernew
$router->add(
    '/questions/{order:[a-z]+}',
    [
        'controller' => 'posts',
        'action'     => 'new'
    ]
);
$router->add(
    '/tips/{order:[a-z]+}',
    [
        'controller' => 'posts',
        'action'     => 'new'
    ]
)->setName('create-tips');

$router->add(
    '/hackernew/submit',
    [
        'controller' => 'posts',
        'action'     => 'hackernew'
    ]
);
$router->add(
    '/posts/tags-suggestions',
    [
        'controller' => 'tags',
        'action'     => 'tagSuggest'
    ]
);

$router->add(
    '/posts/comment',
    [
        'controller' => 'posts',
        'action'     => 'comment'
    ]
);


$router->add(
    '/show__related',
    [
        'controller' => 'search',
        'action'     => 'showRelated'
    ]
);

$router->add(
    '/posts/accept',
    [
        'controller' => 'replies',
        'action'     => 'accept'
    ]
);
//Subscribe or Unsubscribe posts
$router->add(
    '/posts/subscribe',
    [
        'controller' => 'subscribe',
        'action'     => 'index'
    ]
);
$router->add(
    '/readnotify',
    [
        'controller' => 'notification',
        'action'     => 'readnotify'
    ]
);

$router->add(
    '/@{username:[a-zA-Z0-9]+}/{order:[a-z]+}',
    [
        'controller' => 'users',
        'action'     => 'index'
    ]
);
$router->add(
    '/@{username:[a-zA-Z0-9]+}/{order:[a-z]+}/{offset:[0-9]+}',
    [
        'controller' => 'users',
        'action'     => 'index'
    ]
);
$router->add(
    '/@{username:[a-zA-Z0-9]+}',
    [
        'controller' => 'users',
        'action'     => 'index'
    ]
);
//return data contribution of user
$router->add(
    '/@{username:[a-zA-Z0-9]+}/contribution/{order:[a-zA-Z0-9]+}',
    [
        'controller' => 'users',
        'action'     => 'contribution'
    ]
);
$router->add(
    '/login',
    [
        'controller' => 'auth',
        'action'     => 'login'
    ]
);
$router->add(
    '/forgotpassword',
    [
        'controller' => 'auth',
        'action'     => 'forgotpassword'
    ]
);

$router->add(
    '/contact',
    [
        'controller' => 'help',
        'action'     => 'contact'
    ]
);

//weekly newsletter
$router->add(
    '/subscribe__weekly',
    [
        'controller' => 'subscribe',
        'action'     => 'weekly'
    ]
);
//tags
$router->add(
    '/tags',
    [
        'controller' => 'tags',
        'action'     => 'index'
    ]
);
$router->add(
    '/tags/{id:[0-9]+}/{slug}',
    [
        'controller' => 'tags',
        'action'     => 'postByTag'
    ]
);
//List all users
$router->add(
    '/users',
    [
        'controller' => 'users',
        'action'     => 'listUsers'
    ]
);
$router->add(
    '/badges',
    [
        'controller' => 'help',
        'action'     => 'badges'
    ]
);
$router->add(
    '/auth/github/access_token',
    [
        'controller' => 'auth',
        'action'     => 'tokenGithub'
    ]
);

$router->add(
    '/auth/google/access_token',
    [
        'controller' => 'auth',
        'action'     => 'tokenGoogle'
    ]
);
$router->add(
    '/auth/facebook/access_token',
    [
        'controller' => 'auth',
        'action'     => 'tokenFacebook'
    ]
);
$router->add(
    '/auth/twitter/access_token',
    [
        'controller' => 'auth',
        'action'     => 'tokenTwitter'
    ]
);
//hepls
$router->add(
    '/help',
    [
        'controller' => 'help',
        'action'     => 'index'
    ]
);
$router->add(
    '/tour',
    [
        'controller' => 'help',
        'action'     => 'tour'
    ]
);
$router->add(
    '/rules',
    [
        'controller' => 'help',
        'action'     => 'rules'
    ]
);
$router->add(
    '/about',
    [
        'controller' => 'help',
        'action'     => 'about'
    ]
);

$router->add(
    '/search',
    [
        'controller' => 'search',
        'action'     => 'index'
    ]
);
/* Reply post*/
$router->add(
    '/post__reply/edit/{id:[0-9]+}',
    [
        'controller' => 'replies',
        'action'     => 'editAnswer'
    ]
);
$router->add(
    '/post__reply/delete/{id:[0-9]+}',
    [
        'controller' => 'replies',
        'action'     => 'delete'
    ]
);
/*Admin router*/
$router->add(
    '/admin',
    [
        'namespace' => 'Phanbook\Controllers\Admin',
        'controller' => 'dashboard',
    ]
);
$router->add(
    '/admin/:controller/:action/:params',
    [
        'namespace' => 'Phanbook\Controllers\Admin',
        'controller' => 1,
        'action' => 2,
        'params' => 3,
    ]
);
$router->add(
    '/admin/:controller/:action',
    [
        'namespace' => 'Phanbook\Controllers\Admin',
        'controller' => 1,
        'action' => 2,
    ]
);
$router->add(
    '/admin/:controller',
    [
        'namespace' => 'Phanbook\Controllers\Admin',
        'controller' => 1,
    ]
);
return $router;
