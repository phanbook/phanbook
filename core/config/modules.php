<?php
return [
    'frontend' => array(
        'className' => 'Phanbook\Frontend\Module',
        'path' => ROOT_DIR . 'core/modules/frontend/Module.php'
    ),
    'oauth' => array(
        'className' => 'Phanbook\Oauth\Module',
        'path' => ROOT_DIR . 'core/modules/oauth/Module.php'
    ),
    'backend' => array(
        'className' => 'Phanbook\Backend\Module',
        'path' => ROOT_DIR . 'core/modules/backend/Module.php'
    ),
    'blog' => array(
        'className' => 'Phanbook\Blog\Module',
        'path' => ROOT_DIR . 'core/modules/blog/Module.php'
    )
];
