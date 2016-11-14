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

$backend = new RouterGroup([
    'module'     => 'backend',
    'controller' => 'dashboard',
    'action'     => 'index',
    'namespace'  => 'Phanbook\Backend\Controllers',
]);

$backend->add('/backend/:controller', [
    'module' => 'backend',
    'controller' => 1,
]);
$backend->add('/backend/:controller/:int', [
    'module' => 'backend',
    'controller' => 1,
    'id' => 2,
]);
$backend->add('/backend/:controller/:action/:params', [
    'module' => 'backend',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);

$backend->add('/backend', [
    'module'     => 'backend',
    'controller' => 'dashboard',
    'action'     => 'index'
]);

$backend->add('/maintenance', [
    'module'     => 'backend',
    'controller' => 'errors',
    'action'     => 'show503'
]);

$backend->add('/action-not-found', [
    'module'     => 'backend',
    'controller' => 'errors',
    'action'     => 'show404'
]);

$backend->add('/cyclic-routing', [
    'module'     => 'backend',
    'controller' => 'errors',
    'action'     => 'show404'
]);

$backend->add('/error-reporting', [
    'module'     => 'backend',
    'controller' => 'errors',
    'action'     => 'show505'
]);

return $backend;
