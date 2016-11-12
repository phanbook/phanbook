<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */

use Phalcon\Loader;

// Load constants
require 'constants.php';

(new Loader)
    ->registerNamespaces([
        'Phanbook' => ROOT_DIR . '/core/common/library/',
        'Phanbook\Forms' => ROOT_DIR . '/core/common/forms/',
        'Phanbook\Tools' => ROOT_DIR . '/core/common/tools/',
        'Phanbook\Common' => ROOT_DIR . '/core/common/',
        'Phanbook\Models' => ROOT_DIR . '/core/common/models/',
        'Phanbook\Seeder' => ROOT_DIR . '/core/modules/seeder/',
        'Phanbook\Factory' => ROOT_DIR . '/core/common/factory',
        'Phanbook\Plugins' => ROOT_DIR . '/core/common/plugins/',
        'Phanbook\Tools\Cli' => ROOT_DIR . '/core/common/tools/cli/',
        'Phanbook\Cli\Tasks' => ROOT_DIR . '/core/modules/cli/tasks/',
        'Phanbook\Validators' => ROOT_DIR . '/core/common/validators/',
        'Phanbook\Controllers' => ROOT_DIR . '/core/common/controllers/',
        'Phanbook\Common\Library' => ROOT_DIR . '/core/common/library/',
        'Phanbook\Common\Exceptions' => ROOT_DIR . '/core/common/exceptions/'
    ])
    ->registerFiles([
        ROOT_DIR . '/bootstrap/helpers.php',
    ])
    ->register();

// Register The Composer Auto Loader
require ROOT_DIR . '/vendor/autoload.php';
