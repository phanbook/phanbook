<?php

namespace Phanbook\Tools\Cli;

class Output
{
    /**
     * Bash shell code for red
     * @const COLOR_RED
     */
    const COLOR_RED = "\e[0;31m";

    /**
     * Bash shell code for yellow
     * @const COLOR_YELLOW
     */
    const COLOR_YELLOW = "\e[1;33m";

    /**
     * Bash shell code for green
     * @const COLOR_GREEN
     */
    const COLOR_GREEN = "\e[0;32m";

    /**
     * Bash shell code for blue
     * @const COLOR_BLUE
     */
    const COLOR_BLUE = "\e[0;34m";

    /**
     * Bash shell code for no color
     * @const COLOR_NONE original shell color
     */
    const COLOR_NONE = "\e[0m";

    /**
     * output sent to standard error
     * @var string
     */
    protected static $stderr;

    /**
     * output sent to standard output
     * @var string
     */
    protected static $stdout;

    /**
     * output to standard error
     *
     * @param $msg string
     */
    public static function stderr($msg)
    {
        fwrite(STDERR, $msg . PHP_EOL);
        self::$stderr .= $msg . PHP_EOL;
    }

    /**
     * output to standard output
     *
     * @param $msg string
     */
    public static function stdout($msg)
    {
        fwrite(STDOUT, $msg . PHP_EOL);
        self::$stdout .= $msg . PHP_EOL;
    }

    /**
     * get all standard output text
     *
     * @return string
     */
    public static function getStdout()
    {
        return self::$stdout;
    }

    /**
     * get all standard error text
     *
     * @return string
     */
    public static function getStderr()
    {
        return self::$stderr;
    }

    /**
     * Clear Output
     */
    public static function clear()
    {
        unset(self::$stderr);
        self::$stderr = '';

        unset(self::$stdout);
        self::$stdout = '';
    }
}
