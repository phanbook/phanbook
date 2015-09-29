<?php
/**
 * The base configuration for Phanbook
 *
 * The config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Application
 * * Languages
 * * Token google,github,facebook
 * * Mail
 *
 * @link https://github.com/phanbook/docs/config.md
 *
 * @package Phanbook
 */
return new \Phalcon\Config(
    [
        /**
         * Application settings
         */
        'application' => [
            /**
             * Please don't change it
             */
            'httpStatusCode'      => 200, //503
            'modelsDir'           => ROOT_DIR . 'core/models/',
            'baseUri'             => '/',
            'view'                      => [
                'compiledPath'      => ROOT_DIR . 'content/cache/volt/',
                'compiledSeparator' => '_',
                'compiledExtension' => '.php',
                'paginator'         => [
                    'limit'             => 10,
                ],
            ],
            'templates'           => 'core/data/templates/',
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
                'cacheDir' => ROOT_DIR . 'content/cache/html/',
            ],
            'session'             => [
                'adapter' => '\Phalcon\Session\Adapter\Files',
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
        ]
    ]
);
