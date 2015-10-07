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
ini_set('memory_limit', '-1');

//  Global constants
define('DS', DIRECTORY_SEPARATOR);
define('ROOT_DIR', dirname(__FILE__) . DS);
define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'local'));

require ROOT_DIR . 'core/config/loader.php';
require ROOT_DIR . 'vendor/autoload.php';

try {
    /**
     * Include services
     */
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

    /**
     * Sets the event manager
     */
    $application->setEventsManager($eventsManager);

    echo $application->handle()->getContent();
} catch (Phalcon\Exception $e) {
    echo $e->getMessage();
} catch (PDOException $e) {
    echo $e->getMessage();
}
