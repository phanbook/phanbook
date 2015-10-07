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
         * The name of the database, username,password for Phanbook
         */
        'database'  => [
            'mysql'     => [
                'host'     => 'db',
                'username' => 'phanbook',
                'password' => 'password__phanbook',
                'dbname'   => 'phanbook',
                'charset'  => 'utf8',
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
            'publicUrl'           => 'http://phanbook.com',
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
             * For developers: Phanbook debugging mode.
             *
             * Change this to true to enable the display of notices during development.
             * It is strongly recommended that plugin and theme developers use
             * in their development environments.
             */
            'debug'               => false
        ],

        /**
         * You need to change mail parameters below
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
        'github'      => [
            'clientId'     => '7c3724d3a593eff3ebef',
            'clientSecret' => '0dede75fd2351242e51c69b4aa50ce130862ef05',
            'redirectUri'  => 'http://dev.phanbook.com/auth/github/access_token',
            'scopes'       => ['user', 'email']
        ],

        /**
         * Your client ID and client secret keys come from
         *
         * @link https://developers.facebook.com/
         */
        'facebook' => [
            'clientId' => '375822529287502',
            'clientSecret' => 'b1f658bee406b846cd82f9cec3558662',
            'redirectUri'  =>'http://dev.phanbook.com/auth/facebook/access_token'
        ],
        /**
         * Your client ID and client secret keys come from
         *
         * @link https://developers.google.com/console/help/new/
         */
        'google' => [
            'clientId'          => '432349956614-nn8d7cj0dnqot52u01f3q5flij7c3jsl.apps.googleusercontent.com',
            'clientSecret'      => 'iupVGUyOZZJWTffeFkjxOmRr',
            'redirectUri'       => 'http://dev.phanbook.com/auth/google/access_token'
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
        'theme'    => 'default',
        /**
         * The parameter you get form
         *
         * @link http://www.google.com/analytics/
         */
        'googleAnalytic' => 'UA-47328645-4'
    ]
);
