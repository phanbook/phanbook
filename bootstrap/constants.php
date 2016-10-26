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

/**
 * @const DS The DIRECTORY_SEPARATOR shortcut.
 */
define('DS', DIRECTORY_SEPARATOR);

/**
 * @const ROOT_DIR The path to the Phanbook project root
 */
define('ROOT_DIR', dirname(dirname(__FILE__)));

/**
 * @const ENV_PRODUCTION Application production stage.
 */
defined('ENV_PRODUCTION') || define('ENV_PRODUCTION', 'production');

/**
 * @const ENV_STAGING Application staging stage.
 */
defined('ENV_STAGING') || define('ENV_STAGING', 'staging');

/**
 * @const ENV_LOCAL Application local stage.
 */
defined('ENV_LOCAL') || define('ENV_LOCAL', 'local');

/**
 * @const ENV_TESTING Application test stage.
 */
defined('ENV_TESTING') || define('ENV_TESTING', 'testing');

/**
 * @const APPLICATION_ENV Current application stage.
 */
define('APPLICATION_ENV', getenv('APPLICATION_ENV') ?: ENV_LOCAL);

/**
 * @const COMPATIBLE_VERSION The compatible Phalcon version.
 */
define('COMPATIBLE_VERSION', 3000040);
