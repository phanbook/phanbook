<?php

use Phanbook\Oauth\Module as oAuth;
use Phanbook\Backend\Module as Backend;
use Phanbook\Frontend\Module as Frontend;

$directory = new RecursiveDirectoryIterator(modules_path());

$m = [];
foreach ($directory as $item) {
    $name = $item->getFilename();

    if ($item->isDir() && $name != '.' && $name != '..') {
        $path = $item->getPathname();
        $m[$name] = [
            'className' => 'Phanbook\\' . ucfirst($name) . '\\Module',
            'path'      => $path .  '/Module.php',
            'router'    => $path . '/config/routing.php'
        ];
    }
}

$modulesCore = [
    'frontend' => [
        'className' => Frontend::class,
        'path'      => modules_path('frontend/Module.php')
    ],
    'oauth' => [
        'className' => oAuth::class,
        'path'      => modules_path('oauth/Module.php')
    ],
    'backend' => [
        'className' => Backend::class,
        'path'      => modules_path('backend/Module.php')
    ]
];

return array_merge($m, $modulesCore);
