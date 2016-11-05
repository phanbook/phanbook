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

return [
    /**
     * The database credentials
     */
    'database'    => [
        env('DB_CONNECTION') => [
            'host'     => env('DB_HOST'),
            'username' => env('DB_USERNAME'),
            'password' => env('DB_PASSWORD'),
            'dbname'   => env('DB_DATABASE'),
            'charset'  => env('DB_CHARSET'),
        ]
    ],

    /**
     * Application settings
     */
    'application' => [
        /**
         * The site name, you should change it to your name website
         */
        'name'                => 'Phanbook',

        /**
         * In a few words, explain what this site is about.
         */
        'tagline'             => 'A Q&A, Discussion PHP platform',
        'publicUrl'           => env('APP_URL'),

        /**
         * Please don't change it
         */
        'httpStatusCode'      => 200, // 503
        'modelsDir'           => app_path('core/models/'),
        'baseUri'             => env('APP_BASE_URI'),
        'view'                => [
            'viewsDir'          => app_path('views/'),
            'compiledPath'      => content_path('cache/volt/'),
            'compiledSeparator' => '_',
            'compiledExtension' => '.php',
            'paginator'         => [
                'limit' => 10,
            ],
        ],
        'dataDir'             => app_path('core/data/'),
        'repo'                => 'https://github.com/phanbook',

        /**
         * The length password hash send to you when you forget password
         * you can change it
         */
        'passwdResetInterval' => 10,

        /**
         * Change URL cdn if you want it
         */
        'staticBaseUri'       => env('APP_STATIC_URL'),

        /**
         * For developers: Phanbook debugging mode.
         *
         * Change this to true to enable the display of notices during development.
         * It is strongly recommended that plugin and theme developers use
         * in their development environments.
         */
        'debug'               => env('APP_DEBUG'),

        'timezone'       => env('APP_TIMEZONE'),

        /**
         * Authentication Unique Keys and Salts. Change these to different unique key!
         *
         * @link https://docs.phalconphp.com/en/latest/api/Phalcon_Security.html
         */
        'cryptSalt'      => env('APP_SALT'),

        /**
         * Time life cookie default is 8 day, you can change anything day
         *
         * @link https://docs.phalconphp.com/en/latest/reference/cookies.html
         */
        'cookieLifetime' => env('COOKIE_LIFETIME'),

        'session' => [
            'adapter' => env('SESSION_DRIVER'),
            'options' => [
                'lifetime' => env('SESSION_LIFETIME'),
                'uniqueId' => env('SESSION_UNIQUE_ID'),
            ]
        ],

        /**
         * Improving Performance with Cache
         *
         * @link https://docs.phalconphp.com/en/latest/reference/cache.html
         */
        'cache'   => [
            'lifetime' => env('CACHE_LIFETIME'),
            'prefix'   => env('CACHE_PREFIX'),
            'adapter'  => env('CACHE_DRIVER'),
            'cacheDir' => content_path('cache/html/'),
        ],

        /**
         * You can see from
         *
         * @link https://docs.phalconphp.com/en/latest/reference/logging.html
         */
        'logger'  => [
            'path'   => content_path('logs/'),
            'format' => env('LOGGER_FORMAT'),
            'level'  => env('LOGGER_LEVEL'),
        ],
    ],

    'models'         => [
        'metadata' => [
            'adapter' => env('METADATA_DRIVER'),
        ]
    ],

    /**
     * You need to change mail parameters below
     *
     * @link http://github.com/phanbook/docs/mail.md
     */
    'mail'           => [
        'templatesDir'     => 'mail/',
        'fromName'         => env('MAIL_FROM_NAME'),
        'fromEmail'        => env('MAIL_FROM_ADDRESS'),
        env('MAIL_DRIVER') => [
            'server'   => env('MAIL_HOST'),
            'port'     => env('MAIL_PORT'),
            'security' => env('MAIL_ENCRYPTION'),
            'username' => env('MAIL_USERNAME'),
            'password' => env('MAIL_PASSWORD'),
        ]
    ],
    /**
     * Your client ID and client secret keys come from
     *
     * @link https://github.com/settings/applications/new
     */
    'github'         => [
        'clientId'     => env('GITHUB_CLIENT_ID'),
        'clientSecret' => env('GITHUB_SECRET'),
        'redirectUri'  => env('GITHUB_REDIRECT_URI'),
        'scopes'       => ['user', 'email']
    ],

    /**
     * Your client ID and client secret keys come from
     *
     * @link https://developers.facebook.com/
     */
    'facebook'       => [
        'clientId'     => env('FACEBOOK_CLIENT_ID'),
        'clientSecret' => env('FACEBOOK_SECRET'),
        'redirectUri'  => env('FACEBOOK_REDIRECT_URI')
    ],

    /**
     * Set languages you want to it, you can see example
     *
     * @link http://github.com/phanbook/docs/lanuage.md
     */
    'language'       => [
        'code'    => env('LANG_CODE'),
        'gettext' => env('LANG_USE_GETTEXT'),
    ],

    /**
     * Set theme you want to use, for example 'discourse'
     *
     * @link http://github.com/phanbook/docs/theme.md
     */
    'theme'          => 'default',

    /**
     * Set editor you want to use, for example 'markdown' default is ckeditor
     *
     */
    'editor'         => 'ckeditor',

    /**
     * The parameter you get form
     *
     * @link http://www.google.com/analytics/
     * @link https://developers.google.com/console/help/new/
     */
    'googleAnalytic' => env('ANALYTIC_ID'),

    'analytic' => [
        'clientId'     => env('ANALYTIC_CLIENT_ID'),
        'clientSecret' => env('ANALYTIC_SECRET'),
        'redirectUri'  => env('ANALYTIC_REDIRECT_URI'),
    ],

    'beanstalk'     => [
        'disabled' => env('BEANSTALK_ENABLED'),
        'host'     => env('BEANSTALK_HOST'),
    ],

    /**
     * The Elasticsearch parameters. You can change it or not
     *
     * @link https://www.elastic.co/blog/what-is-an-elasticsearch-index
     */
    'elasticsearch' => [
        'index' => env('ELASTIC_INDEX'),
        'type'  => env('ELASTIC_TYPE'),
    ],
];
