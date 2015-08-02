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

//  Global constants
define('PS', PATH_SEPARATOR);
define('DS', DIRECTORY_SEPARATOR);
define('PUBLIC_DIR', __DIR__ . DS);
define('ROOT_DIR', dirname(__DIR__) . DS);
define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'local'));
require ROOT_DIR . 'common/config/loader.php';
require ROOT_DIR . 'vendor/autoload.php';

try {

    /**
     * Include services
     */
    require ROOT_DIR . 'common/config/services.php';

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

    echo $application->handle()->getContent();

} catch (Phalcon\Exception $e) {
    echo $e->getMessage();
} catch (PDOException $e) {
    echo $e->getMessage();
}

