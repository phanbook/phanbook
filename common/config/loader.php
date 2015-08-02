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
    array(
        'Phanbook\Controllers'  => ROOT_DIR . 'apps/controllers/',
        'Phanbook\Models'       => ROOT_DIR . 'common/models/',
        'Phanbook\Validators'   => ROOT_DIR . 'common/validators/',
        'Phanbook\Tools'        => ROOT_DIR . 'common/tools/',
        'Phanbook\Forms'        => ROOT_DIR . 'apps/forms/',
        'Phanbook\Plugins'      => ROOT_DIR . 'common/plugins/',
        'Phanbook'              => ROOT_DIR . 'common/library/'
    )
);

$loader->register();
