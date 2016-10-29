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
use Phalcon\Mvc\Application;

require ROOT_DIR . '/core/config/services.php';

/**
 * Handle the request
 */
$application = new Application();

/**
 * Assign the DI
 */
$application->setDI($di);

$modules = require ROOT_DIR . '/core/config/modules.php';

require ROOT_DIR . '/core/config/routing.php';

/**
 * Include modules
 */
$application->registerModules($modules);

return $application;
