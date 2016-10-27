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

use Phalcon\Di;

/**
 * Translation function call anywhere.
 * Returns the translation string of the given key.
 *
 * @param string $string The string to be translated
 * @param array $placeholders The placeholders
 * @return string
 */
if (!function_exists('t')) {
    function t($string, array $placeholders = null)
    {
        $di = Di::getDefault();
        if ($di && $di->has('translation')) {
            /** @var \Phalcon\Translate\Adapter $translation */
            $translation = $di->getShared('translation');

            return $translation->t($string, $placeholders);
        }

        return $string;
    }
}

if (!function_exists('vd')) {
    /**
     * The var_dump helper
     * @param mixed $expression
     */
    function vd($expression)
    {
        echo PHP_SAPI == 'cli' ? ' ' : '<pre style="overflow: auto;" class="code-dump">';

        $trace = debug_backtrace();
        echo sprintf(
            'Called From: %s:%d %s',
            $trace[1]['file'],
            $trace[1]['line'],
            PHP_SAPI == 'cli' ? PHP_EOL : '<br>'
        );

        var_dump($expression);
        echo PHP_SAPI == 'cli' ? ' ' : '</pre>';
    }
}

if (!function_exists('vdd')) {
    /**
     * The var_dump helper
     * @param mixed $expression
     */
    function vdd($expression)
    {
        vd($expression);
        die();
    }
}

if (!function_exists('pr')) {
    /**
     * The print_r helper
     * @param mixed $expression
     */
    function pr($expression)
    {
        e(print_r($expression, true));
    }
}

if (!function_exists('prd')) {
    /**
     * The print_r helper
     * @param mixed $expression
     */
    function prd($expression)
    {
        pr($expression);
        die();
    }
}

if (!function_exists('e')) {
    /**
     * The echo helper
     * @param string $string
     */
    function e($string)
    {
        echo PHP_SAPI == 'cli' ? ' ' : '<pre style="overflow: auto;" class="code-dump">';

        $trace = debug_backtrace();
        echo sprintf(
            'Called From: %s:%d %s',
            $trace[1]['file'],
            $trace[1]['line'],
            PHP_SAPI == 'cli' ? PHP_EOL : '<br>'
        );

        echo $string;
        echo PHP_SAPI == 'cli' ? ' ' : '</pre>';
    }
}

if (!function_exists('gcm')) {
    /**
     * The get_class_methods helper
     * @param string $class
     * @return array
     */
    function gcm($class)
    {
        if (!is_string($class) || !class_exists($class)) {
            $methods = [];
        } else {
            $methods = get_class_methods($class);
        }

        return $methods;
    }
}

if (!function_exists('d')) {
    /**
     * The echo && die helper
     *
     * @param mixed $expression
     * @param bool $kill Exit?
     */
    function d($expression, $kill = true)
    {
        e($expression);

        if ($kill) {
            die();
        }
    }
}
