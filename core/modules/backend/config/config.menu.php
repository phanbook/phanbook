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
                        'icon'  =>  'fa fa-plus',
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
                        'icon'  =>  'fa fa-edit',
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
                        'icon'  =>  'fa fa-plus',
                        "sub"   =>  []
                    ]
                ]
            ],
            [
                'code' => 'media',
                'name' => 'Media',
                'icon'  =>  'fa fa-indent',
                'sub'  => [
                    [
                        'code' => 'upload',
                        'name' => 'Upload',
                        'icon'  =>  'fa fa-upload',
                        'sub' => []
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
                        'code' => 'custom',
                        'name' => 'Customize',
                        'icon'  =>  'fa fa-bars',
                        'sub' => []
                    ],
                    [
                        'code'  =>  'template',
                        'name'  =>  'Template',
                        'icon'  =>  'fa fa-file',
                        'sub'   =>  [],
                        'controller' => true
                    ],
                ]
            ],
            [
                'code'  =>  'tags',
                'name'  =>  'Tags',
                'icon'  =>  'fa fa-tags',
                'sub'   =>  [
                    [
                        'code' => 'new',
                        'name' => 'Add tag',
                        'icon' => 'fa fa-plus',
                        'sub'  => []
                    ],
                    [
                        'code' => 'index',
                        'name' => 'All tags',
                        'icon' => 'fa fa-bars',
                        'sub'  => []
                    ]
                ],
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
                        "name" => "Logo",
                        'icon'  =>  'fa fa-bars',
                        "sub"  => []
                    ],
                    [
                        "code" => "analytic",
                        "name" => "Google",
                        'icon'  =>  'fa fa-area-chart',
                        "sub"  => []
                    ],
                    [
                        "code" => "reading",
                        "name" => "Reading",
                        'icon'  =>  'fa fa-bars',
                        "sub"  => []
                    ],
                    [
                        'code'  =>  'update',
                        'name'  =>  'Updates',
                        'icon'  =>  'fa fa-refresh',
                        'sub'   =>  [],
                        'controller' => true
                    ]
                ]
            ]
        ]

    ]
);
