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
    array(
    /**
    * The name of the database, username,password for Phanbook
    */
    'database'  => array(
        'mysql'     => array(
            'host'     => 'localhost',
            'username' => 'root',
            'password' => 'phanbook',
            'dbname'   => 'phanbook',
            'charset'  => 'utf8',
        )
    ),
    /**
    * Application settings
    */
    'application' => [
        /**
        * The sitename, you should change it to your name website
        */
        'name'                => 'Phanbook',
        'publicUrl'           => 'http://phanbook.com',
        /**
        * Change timezone if you want to it
        */
        'timezone'            => 'UTC',
        /**
        * Change URL cdn if you want it
        */
        'development'    => [
            'staticBaseUri' => '/',
        ],
        'production'  => [
            'staticBaseUri' => '/',
        ],
        /**
         * Please don't change it
         */
        'httpStatusCode'      => 200, //503
        'modelsDir'           => ROOT_DIR . 'common/models/',
        'appsDir'             => ROOT_DIR . 'apps/',
        'baseUri'             => '/',
        'view'                      => [
            'compiledPath'      => ROOT_DIR . 'apps/cache/volt/',
            'compiledSeparator' => '_',
            'compiledExtension' => '.php',
            'viewsDir'          => ROOT_DIR . 'apps/views/',
            'paginator'         => [
                'limit'         => 10,
            ],
        ],
        'templatesDir'        => 'templatesDir/',
        'repo'                => 'https://github.com/phanbook',
        /**
         * For developers: Phanbook debugging mode.
         *
         * Change this to true to enable the display of notices during development.
         * It is strongly recommended that plugin and theme developers use
         * in their development environments.
        */
        'debug'               => false,
        /**
         * The lenght password hash send to you when you forget password
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
         * Time life cookie defaut is 8 day, you can change anything day
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
            'cacheDir' => ROOT_DIR . '/apps/cache/html/',
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
     * The paramaster config for elastich you can change it or not
     *
     * @link https://www.elastic.co/blog/what-is-an-elasticsearch-index
     */
    'elasticsearch' => [
        'index' => 'phanbook',
        'type'  => 'posts'
    ],
    /**
     * The paramaster below you need change it
     *
     * @link http://github.com/phanbook/docs/mail.md
     */
    'mail'        => [
        'fromName'     => 'Phanbook',
        'fromEmail'    => 'phanbook@no-reply',
        'smtp'         => [
            'server'   => 'smtp.mandrillapp.com',
            'port'     => '587',
            'security' => 'tls',
            'username' => 'phanbook@phanbook.com',
            'password' => '',
        ]
    ],
    /**
     * Your client ID and client secret keys come from
     *
     * @link https://github.com/settings/applications/new
     */
    'github'      => array(
        'clientId'     => '7c3724d3a593eff3ebef',
        'clientSecret' => '0dede75fd2351242e51c69b4aa50ce130862ef05',
        'redirectUri'  => 'http://dev.phanbook.com/auth/github/access_token',
        'scopes'       => ['user', 'email']
    ),
    /**
     * Your client ID and client secret keys come from
     *
     * @link https://developers.google.com/console/help/new/
     */
    'google' =>array(
        'clientId' => '90283109318-91hci2ivgtsdgq1n5c6qqv4fetj3dl11.apps.googleusercontent.com',
        'clientSecret' => 'nI2o4hhEcL79PIGQ3jHtXMd8',
        'redirectUri'  => 'http://dev.phanbook.com/auth/google/access_token'
    ),
    /**
     * Your client ID and client secret keys come from
     *
     * @link https://developers.facebook.com/
     */
    'facebook' => [
        'clientId' => '375822529287502',
        'clientSecret' => 'b1f658bee406b846cd82f9cec3558662',
        'redirectUri'  =>'http://dev.pahnbook.com/auth/facebook/access_token'
    ],
    /**
     * Set languages you want to it, you can see example
     *
     * @link http://github.com/phanbook/docs/lanuage.md
     */
    'language' => 'en_EN',
    /**
     * Set theme you want to use, for example 'discourse'
     *
     * @link http://github.com/phanbook/docs/theme.md
     */
    'theme'    => null,
    /**
     * The paramater you get form
     *
     * @link http://www.google.com/analytics/
     */
    'googleAnalytic' => 'UA-47328645-4',
    /**
     * Queue Connections
     * We use Beanstalk is a simple, fast work queue.
     */
    'beanstalk' => [
        'disabled' => true,
        'host'     => '127.0.0.1'
    ]
    )
);
