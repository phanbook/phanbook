<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */

return new \Phalcon\Config([
    'application' => [
        'controllersDir' => __DIR__ . '/../controllers/',
        'viewsDir'       => __DIR__ . '/../views/',
        'partialsDir'    => 'partials/',
        'layoutsDir'     => 'layouts',
        'baseUri'        => '/backend/',
        'logger'         => [
            'enabled' => env('LOGGER_ENABLED'),
            'path'    => content_path('logs/'),
            'format'  => env('LOGGER_FORMAT'),
        ],
        'cache'          => [
            'lifetime' => env('CACHE_LIFETIME'),
            'prefix'   => env('CACHE_PREFIX'),
            'adapter'  => env('CACHE_DRIVER'),
            'cacheDir' => content_path('cache/html/'),
        ]
    ]
]);
