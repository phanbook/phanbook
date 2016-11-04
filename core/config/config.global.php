<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */

use Phalcon\Session\Adapter\Files;

return new \Phalcon\Config(
    [
        /**
         * Application settings
         */
        'application' => [
            /**
             * Please don't change it
             */
            'httpStatusCode'      => 200, // 503
            'modelsDir'           => app_path('core/models/'),
            'baseUri'             => '/',
            'view' => [
                'viewsDir'          => app_path('views/'),
                'compiledPath'      => content_path('cache/volt/'),
                'compiledSeparator' => '_',
                'compiledExtension' => '.php',
                'paginator'         => [
                    'limit'             => 10,
                ],
            ],
            'dataDir'             => app_path('core/data/'),
            'repo'                => 'https://github.com/phanbook',
            'timezone'            => 'UTC',
            /**
             * The length password hash send to you when you forget password
             * you can change it
             */
            'passwdResetInterval' => 10,
            /**
             * You can see from
             *
             * @link https://docs.phalconphp.com/en/latest/reference/logging.html
             */
            'logger'              => [
                'enabled' => true,
                'path'    => 'log/',
                'format'  => '[%date %][%type %] %message % ',
            ],
            /**
             * Authentication Unique Keys and Salts. Change these to different unique key!
             *
             * @link https://docs.phalconphp.com/en/latest/api/Phalcon_Security.html
             */
            'cryptSalt'           => '92*)(@#9834$#3rt',
            /**
             * Time life cookie default is 8 day, you can change anything day
             *
             * @link https://docs.phalconphp.com/en/latest/reference/cookies.html
             */
            'cookieLifetime'      => 86400 * 8,
            /**
             * Improving Performance with Cache
             *
             * @link https://docs.phalconphp.com/en/latest/reference/cache.html
             */
            'cache'               => [
                'lifetime' => '86400',
                'prefix'   => 'cache_',
                'adapter'  => 'File',
                'cacheDir' => content_path('cache/html/'),
            ],
            'session'             => [
                'adapter' => Files::class,
                'options' => [
                    'lifetime' => 600,
                    'uniqueId' => 'phanbook_'
                ]
            ]
        ],
        'models' => [
            'metadata' => [ 'adapter' => 'Memory' ]
        ],
        /**
         * The Elasticsearch parameters. You can change it or not
         *
         * @link https://www.elastic.co/blog/what-is-an-elasticsearch-index
         */
        'elasticsearch' => [
            'index' => 'phanbook',
            'type'  => 'posts'
        ],
        'beanstalk' => [
            'disabled' => true,
            'host'     => '127.0.0.1'
        ],
        'analytic'  =>  [
            'clientId'  =>  '432349956614-nn8d7cj0dnqot52u01f3q5flij7c3jsl.apps.googleusercontent.com',
            'clientSecret'  =>  'iupVGUyOZZJWTffeFkjxOmRr'
        ]
    ]
);
