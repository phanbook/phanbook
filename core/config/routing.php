<?php

$di['router'] = function () use ($modules, $di) {

    $defaultModule = 'frontend';

    $router = new \Phalcon\Mvc\Router(false);

    $router->clear();

    $moduleRouting = ROOT_DIR . 'core/modules/'. $defaultModule .'/config/routing.php';

    if (file_exists($moduleRouting) && is_file($moduleRouting)) {
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

        $moduleRouting = ROOT_DIR . 'core/modules/'. $moduleName .'/config/routing.php';
        if (file_exists($moduleRouting) && is_file($moduleRouting)) {
            include $moduleRouting;
        }
    }

    return $router;
};
