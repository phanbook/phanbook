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

$backend = new RouterGroup([
    'module'     => 'backend',
    'controller' => 'dashboard',
    'action'     => 'index',
    'namespace'  => 'Phanbook\Backend\Controllers',
]);

$backend->add('/backend/:controller/:action/:params', [
    'controller' => 1,
    'action'     => 2,
    'params'     => 3,
]);

$backend->add('/backend/:controller/:action', [
    'controller' => 1,
    'action'     => 2,
]);

$backend->add('/backend/:controller/:int', [
    'controller' => 1,
    'id'         => 2,
]);

$backend->add('/backend/:controller', [
    'controller' => 1,
]);

$backend->add('/backend[/]?', [
    'controller' => 'dashboard',
]);

return $backend;
