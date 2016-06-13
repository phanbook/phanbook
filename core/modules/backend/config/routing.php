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
$router->add('#^/backend/([a-zA-Z0-9\_]+)[/]{0,1}$#', [
    'module' => 'backend',
    'controller' => 1,
]);

$router->add('#^/backend[/]{0,1}([a-zA-Z0-9\_]+)/([a-zA-Z0-9\_]+)(/.*)*$#', [
    'module' => 'backend',
    'controller' => 1,
    'action' => 2,
    'params' => 3,
]);


$router->add(
    '/maintenance',
    [
        'module'     => 'backend',
        'controller' => 'errors',
        'action'     => 'show503'
    ]
);
$router->add(
    '/action-not-found',
    [
        'module'     => 'backend',
        'controller' => 'errors',
        'action'     => 'show404'
    ]
);
$router->add(
    '/cyclic-routing',
    [
        'module'     => 'backend',
        'controller' => 'errors',
        'action'     => 'show404'
    ]
);
$router->add(
    '/error-reporting',
    [
        'module'     => 'backend',
        'controller' => 'errors',
        'action'     => 'show505'
    ]
);
