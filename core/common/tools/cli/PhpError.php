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
namespace Phanbook\Tools\Cli;

/**
 * \Phanbook\Tools\Cli\PhpError
 *
 * @package Phanbook\Tools\Cli
 */
class PhpError
{
    /**
     * Record any warnings/errors by php
     *
     * @param int $errNo The error number
     * @param string $errStr The error description
     * @param string $errFile The file where the error occurred
     * @param int $errLine The line where the error occurred
     * @param array $errContext The error context
     * @return bool
     */
    public static function errorHandler($errNo, $errStr, $errFile, $errLine, array $errContext = null)
    {
        if ($errNo != E_STRICT) {
            // Get Remote Ip or CLI script?
            if (PHP_SAPI == 'cli') {
                $script = $_SERVER['PHP_SELF'];
                $ip = 'CLI';
            } else {
                $protocol = isset($_SERVER['HTTPS']) ? 'https://' : 'http://';
                $script = $protocol . $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
                $ip = $_SERVER['REMOTE_ADDR'];
            }
            // @TODO: later
            /*$rt = new \Models\RuntimeError();
            $rt->title = $errStr;
            $rt->file = $errFile;
            $rt->line = $errLine;
            $rt->error_type = $errNo;
            $rt->server_name = php_uname('n');
            $rt->execution_script = $script;
            $rt->pid = getmypid();
            $rt->ip_address = $ip;
            $rt->save();*/
        }

        return false;
    }

    /**
     * Capture any errors at the end script (especially runtime errors)
     */
    public static function runtimeShutdown()
    {
        $e = error_get_last();
        if (!empty($e)) {
            // Record Error
            PhpError::errorHandler($e['type'], $e['message'], $e['file'], $e['line']);
        }
    }
}
