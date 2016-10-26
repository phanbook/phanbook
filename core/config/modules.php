<?php

$directory = new \RecursiveDirectoryIterator(ROOT_DIR . 'content/modules/');
$m = [];
foreach ($directory as $item) {
    $name = $item->getFilename();

    if ($item->isDir() && $name != '.' && $name != '..') {
        $path = $item->getPathname();
        $m[$name] = [
            'className' => 'Phanbook\\' . ucfirst($name) . '\\Module',
            'path' => $path .  '/Module.php',
            'router' => $path . '/config/routing.php'
        ];
    }
}

$modulesCore =
[
    'frontend' => array(
        'className' => \Phanbook\Frontend\Module::class,
        'path' => ROOT_DIR . 'core/modules/frontend/Module.php'
    ),
    'oauth' => array(
        'className' => \Phanbook\Oauth\Module::class,
        'path' => ROOT_DIR . 'core/modules/oauth/Module.php'
    ),
    'backend' => array(
        'className' => \Phanbook\Backend\Module::class,
        'path' => ROOT_DIR . 'core/modules/backend/Module.php'
    )
];

return array_merge($m, $modulesCore);
