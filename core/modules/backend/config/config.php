<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */

return new \Phalcon\Config([
    'application' => [
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
    ]
]);
