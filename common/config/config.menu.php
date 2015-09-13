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
 * * Menu Structure of Admin panel
 *
 * @link https://github.com/phanbook/docs/config.md
 *
 * @package Phanbook
 */
return new \Phalcon\Config(
    [
        /**
         * In every menu (include sub-menu), we must have 3 element in array:
         * @param code : name of controller, action assigned in controller
         * @param name : name to show to user
         * @param sub  : sub menu. let empty array if this menu hasn't sub menu
         */
        'menuStruct'  => [
            [
                'code'  =>  'pages',
                'name'  =>  'Pages',
                'sub'   =>  []
            ],
            [
                'code'  =>  'users',
                'name'  =>  'Users',
                'sub'   =>  []
            ],
            [
                'code'  =>  'posts',
                'name'  =>  'Posts',
                'sub'   =>  [
                                [
                                    "code"  =>  "sticky",
                                    "name"  =>  "Sticky posts",
                                    "sub"   =>  []
                                ]
                            ]
            ],
            [
                'code'  =>  'template',
                'name'  =>  'Template',
                'sub'   =>  []
            ],
            [
                'code'  =>  'tags',
                'name'  =>  'Tags',
                'sub'   =>  []
            ],
            [
                "code"  =>  "settings",
                "name"  =>  "Settings",
                "sub"   =>  [
                                [
                                    "code" => "general",
                                    "name" => "General",
                                    "sub"  => []
                                ],
                                [
                                    "code" => "logo",
                                    "name" => "Change Logo",
                                    "sub"  => []
                                ]
                            ]
            ],
            [
                'code'  =>  'update',
                'name'  =>  'Updates',
                'sub'   =>  []
            ],
        ]
        
    ]
);
