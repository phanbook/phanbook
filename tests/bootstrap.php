<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link          http://phanbook.com Phanbook Project
 * @since         1.0.0
 * @license       http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
use Phalcon\Mvc\Application;

error_reporting(E_ALL);

// Set internal character encoding to UTF-8.
//mb_internal_encoding('UTF-8');
ini_set('memory_limit', '-1');


if (!defined('ROOT_DIR')) {
    define('ROOT_DIR', dirname(__DIR__) .'/');
}
if (!defined('APPLICATION_ENV')) {
    define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'local'));
}

require ROOT_DIR . 'vendor/autoload.php';
require ROOT_DIR . 'core/config/loader.php';
require ROOT_DIR . 'core/config/services.php';

/**
 * Handle the request
 */
$application = new Application();

/**
 * Assign the DI
 */
$application->setDI($di);

/**
 * Include modules
 */
$application->registerModules(require ROOT_DIR . 'core/config/modules.php');

return new \Phalcon\Mvc\Application($di);
