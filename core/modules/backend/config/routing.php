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

$backend->add('/:module/:controller/:action/:params', [
    'controller' => 1,
    'action'     => 2,
    'params'     => 3,
]);

$backend->add('/:module/:controller/:int', [
    'controller' => 1,
    'id'         => 2,
]);

$backend->add('/:module/:controller', [
    'controller' => 1,
]);

$backend->add('/:module[/]?', [
    'controller' => 'dashboard',
]);

return $backend;
