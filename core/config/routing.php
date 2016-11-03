<?php

use Phalcon\Di;
use Phalcon\Mvc\Router;

$defaultModule = 'frontend';

$router = new Router(false);

$moduleRouting = modules_path("{$defaultModule}/config/routing.php");

if (file_exists($moduleRouting) && is_file($moduleRouting)) {
    /** @noinspection PhpIncludeInspection */
    require $moduleRouting;
} else {
    $router->add('#^/(|/)$#', [
        'module'     => $defaultModule,
        'controller' => 'index',
        'action'     => 'index',
    ]);

    $router->add('#^/([a-zA-Z0-9\_]+)[/]{0,1}$#', [
        'module'     => $defaultModule,
        'controller' => 1,
    ]);

    $router->add('#^/{0,1}([a-zA-Z0-9\_]+)/([a-zA-Z0-9\_]+)(/.*)*$#', [
        'module'     => $defaultModule,
        'controller' => 1,
        'action'     => 2,
        'params'     => 3,
    ]);
}

foreach (Di::getDefault()->getShared('modules') as $moduleName => $module) {
    if ($defaultModule == $moduleName) {
        continue;
    }

    if (isset($module['router'])) {
        $routing = $module['router'];
    } else {
        $routing = modules_path("{$moduleName}/config/routing.php");
    }

    if (file_exists($routing) && is_file($routing)) {
        /** @noinspection PhpIncludeInspection */
        include $routing;
    }
}

return $router;
