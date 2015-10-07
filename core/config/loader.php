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
$loader = new Phalcon\Loader();
/**
 * We're a registering a set of directories taken from the configuration file
 */
$loader->registerNamespaces(
    [
        'Phanbook'                      => ROOT_DIR . 'core/common/library/',
        'Phanbook\Tools'                => ROOT_DIR . 'core/common/tools/',
        'Phanbook\Models'               => ROOT_DIR . 'core/common/models/',
        'Phanbook\Factory'              => ROOT_DIR . 'core/common/factory',
        'Phanbook\Plugins'              => ROOT_DIR . 'core/common/plugins/',
        'Phanbook\Validators'           => ROOT_DIR . 'core/common/validators/'
    ]
);

$loader->register();
