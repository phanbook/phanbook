<?php

return new \Phalcon\Config(
    array(
        'application' => array(
            'controllersDir' => __DIR__ . '/../controllers/',
            'viewsDir'       => __DIR__ . '/../views/',
            'partialsDir'    => 'partials/',
            'layoutsDir'     => 'layouts',
            'baseUri'        => '/backend/',
            'logger'         => [
                'enabled' => true,
                'path'    => 'log/',
                'format'  => '[%date %][%type %] %message % ',
            ],
            'cache'          => [
                'lifetime' => '86400',
                'prefix'   => 'cache_',
                'adapter'  => 'File',
                'cacheDir' => 'cache/html/',
            ]

        )
    )
);
