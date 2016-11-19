<?php

return [
    'default' => env('ACL_DRIVER', 'memory'),

    'drivers' => [
        'memory' => [
            'adapter' => 'Memory',
        ],
    ],

    'cacheKey' => 'acl_data',

    'lifetime' => env('CACHE_LIFETIME', 86400),
];
