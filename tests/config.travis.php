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
        'database'  => array(
            'mysql'     => array(
                'host'     => 'localhost',
                'username' => 'root',
                'password' => 'password__phanbook',
                'dbname'   => 'phanbook',
                'charset'  => 'utf8',
            )
        )
    )
);
