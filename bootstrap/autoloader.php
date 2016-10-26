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

// Register The Composer Auto Loader
require ROOT_DIR . '/vendor/autoload.php';

(new Loader)
    ->registerNamespaces([
        'Phanbook' => ROOT_DIR . '/core/',
        'Phanbook\Tools' => ROOT_DIR . '/core/tools/',
        'Phanbook\Tools\Cli' => ROOT_DIR . '/core/tools/cli/',
    ])
    ->register();

// Load constants
require 'helpers.php';
