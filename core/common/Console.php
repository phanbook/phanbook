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
namespace Phanbook\Common;

use Phalcon\Cli\Console as CLIConsole;

/**
 *\Phanbook\Console
 *
 * @package Phanbook
 */
class Console extends CLIConsole
{
    /**
     * The number of arguments passed to the application.
     * @var int
     */
    protected $argc;

    /**
     * Array of arguments passed to the application.
     *
     * @var array
     */
    protected $argv;

    /**
     * Set application arguments.
     *
     * @param array $argv Array of arguments passed to the application.
     * @param int   $argc The number of arguments passed to the application.
     *
     * @return $this
     */
    public function setArgs($argv, $argc)
    {
        $this->argv = $argv;
        $this->argc = $argc;

        return $this;
    }

    /**
     * Run the application.
     */
    public function run()
    {
        $arguments = $this->getArguments();

        $this->handle($arguments);
    }

    protected function getArguments()
    {
        $argv = $_SERVER['argv'];

        $arguments = [];
        $params    = [];

        foreach ($argv as $i => $arg) {
            if ($i == 1) {
                $arguments['task'] = $arg;
            } elseif ($i === 2) {
                $arguments['action'] = $arg;
            } elseif ($i >= 3) {
                $params[] = $arg;
            }
        }

        $params = $this->convertParams($params);
        if (count($params)) {
            $arguments['params'] = $params;
        }

        return $arguments;
    }

    protected function convertParams(array $params)
    {
        $result = [];

        foreach ($params as $param) {
            if (preg_match('/^(\-\-|\-)(.*)=(.*)$/', $param, $matches)) {
                $result[$matches[2]] = $matches[3];
            } elseif (preg_match('/^(\-\-|\-)(.*)$/', $param, $matches)) {
                $result[$matches[2]] = true;
            } else {
                $result[] = $param;
            }
        }
        return $result;
    }
}
