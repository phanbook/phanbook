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
                'icon'  =>  'fa fa-television',
                'sub'   =>  [
                    [
                        "code"  =>  "index",
                        "name"  =>  "All pages",
                        'icon'  =>  'fa fa-bars',
                        "sub"   =>  []
                    ],
                    [
                        "code"  =>  "new",
                        "name"  =>  "Add new",
                        'icon'  =>  'fa fa-bars',
                        "sub"   =>  []
                    ]
                ]
            ],
            [
                'code'  =>  'users',
                'name'  =>  'Users',
                'icon'  =>  'fa fa-users',
                'sub'   =>  []
            ],
            [
                'code'  =>  'posts',
                'name'  =>  'Posts',
                'icon'  =>  'fa fa-clone',
                'sub'   =>  [
                    [
                        "code"  =>  "sticky",
                        "name"  =>  "Sticky posts",
                        'icon'  =>  'fa fa-bookmark-o',
                        "sub"   =>  []
                    ],
                    [
                        "code"  =>  "index",
                        "name"  =>  "Edit posts",
                        'icon'  =>  'fa fa-bars',
                        "sub"   =>  []
                    ],
                    [
                        "code"  =>  "newSticky",
                        "name"  =>  "Add Sticky",
                        'icon'  =>  'fa fa-bars',
                        "sub"   =>  []
                    ],
                    [
                        "code"  =>  "new",
                        "name"  =>  "Add Post",
                        'icon'  =>  'fa fa-bars',
                        "sub"   =>  []
                    ]
                ]
            ],
            [
                'code' => 'themes',
                'name' => 'Appearance',
                'icon'  =>  'fa fa-edit',
                'sub'  => [
                    [
                        'code' => 'index',
                        'name' => 'Themes',
                        'icon'  =>  'fa fa-diamond',
                        'sub' => []
                    ],
                    [
                        'code' => 'index',
                        'name' => 'Customize',
                        'icon'  =>  'fa fa-bars',
                        'sub' => []
                    ]
                ]
            ],
            [
                'code'  =>  'template',
                'name'  =>  'Template',
                'icon'  =>  'fa fa-file',
                'sub'   =>  []
            ],
            [
                'code'  =>  'tags',
                'name'  =>  'Tags',
                'icon'  =>  'fa fa-tags',
                'sub'   =>  []
            ],
            [
                "code"  =>  "settings",
                "name"  =>  "Settings",
                'icon'  =>  'fa fa-cog',
                "sub"   =>  [
                    [
                        "code" => "general",
                        "name" => "General",
                        'icon'  =>  'fa fa-bars',
                        "sub"  => []
                    ],
                    [
                        "code" => "logo",
                        "name" => "Change Logo",
                        'icon'  =>  'fa fa-bars',
                        "sub"  => []
                    ],
                    [
                        "code" => "analytic",
                        "name" => "Google analytic",
                        'icon'  =>  'fa fa-area-chart',
                        "sub"  => []
                    ]
                ]
            ],
            [
                'code'  =>  'update',
                'name'  =>  'Updates',
                'icon'  =>  'fa fa-refresh',
                'sub'   =>  []
            ]
        ]

    ]
);
