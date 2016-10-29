<?php

$di['router'] = function () use ($modules, $di) {

    $defaultModule = 'frontend';

    $router = new \Phalcon\Mvc\Router(false);

    $moduleRouting = modules_path("{$defaultModule}/config/routing.php");

    if (file_exists($moduleRouting) && is_file($moduleRouting)) {
        /** @noinspection PhpIncludeInspection */
        include $moduleRouting;
    } else {
        $router->add('#^/(|/)$#', array(
            'module' => $defaultModule,
            'controller' => 'index',
            'action' => 'index',
        ));

        $router->add('#^/([a-zA-Z0-9\_]+)[/]{0,1}$#', array(
            'module' => $defaultModule,
            'controller' => 1,
        ));

        $router->add('#^/{0,1}([a-zA-Z0-9\_]+)/([a-zA-Z0-9\_]+)(/.*)*$#', array(
            'module' => $defaultModule,
            'controller' => 1,
            'action' => 2,
            'params' => 3,
        ));
    }

    foreach ($modules as $moduleName => $module) {
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
};
