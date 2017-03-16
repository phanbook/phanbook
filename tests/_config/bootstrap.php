<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */

use Phanbook\Common\Application;

// Register the auto loader
require __DIR__.'/../../bootstrap/autoloader.php';

// Create the Application
$app = new Application();

// Run the Application
return $app->getApplication();
