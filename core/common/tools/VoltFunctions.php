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
namespace Phanbook\Tools;

/**
 * PHP Functions in Volt
 */
class VoltFunctions
{
    /**
     * Compile any function call in a template
     *
     * @param string $name      function name
     * @param mixed  $arguments function args
     *
     * @return string compiled function
     */
    public function compileFunction($name, $arguments)
    {
        if (function_exists($name)) {
            return $name . '(' . $arguments . ')';
        }
        $property = $name;
        $class = '\Phanbook\Tools\ZFunction';

        if (method_exists($class, $property)) {
            return $class . '::' . $property . '(' . $arguments . ')';
        }
        if (!$arguments) {
            // Get constant if exist
            if (defined($class . '::' . $property)) {
                return $class . '::' . $property;
            }

            // Get static property if exist
            if (property_exists($class, $property)) {
                return $class . '::$' . $property;
            }
        }
    }

    /**
     * Compile some filters
     *
     * @param string $name      filter name
     * @param mixed  $arguments filter args
     *
     * @return string compiled filter
     */
    public function compileFilter($name, $arguments)
    {
        if ($name == 'isset') {
            return '(isset(' . $arguments . ') ? ' . $arguments . ' : null)';
        }
        if ($name == 'long2ip') {
            return 'long2ip(' . $arguments . ')';
        }
        if ($name == 'truncate') {
            return '\Phanbook\Tools\ZFunction::truncate(' . $arguments . ')';
        }
        if ($name == 'strlen') {
            return '\Phanbook\Tools\ZFunction::strlen(' . $arguments . ')';
        }
    }
}
