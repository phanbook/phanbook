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

/***
 * \Phanbook\Tools\VoltFunctions
 *
 * PHP Functions in Volt
 *
 * @package Phanbook\Tools
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

        switch ($name) {
            case 'is_authorized':
                return '$this->auth->isAuthorizedVisitor()';
            case 'is_moderator':
                return '$this->auth->isModerator()';
            case 'is_admin':
                return '$this->auth->isAdmin()';
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
     * @param string $name      The filter name
     * @param mixed  $arguments The filter args
     *
     * @return string|null
     */
    public function compileFilter($name, $arguments)
    {
        switch ($name) {
            case 'isset':
                return '(isset(' . $arguments . ') ? ' . $arguments . ' : false)';
            case 'long2ip':
                return 'long2ip(' . $arguments . ')';
            case 'truncate':
                return '\Phanbook\Tools\ZFunction::truncate(' . $arguments . ')';
            case 'strlen':
                return '\Phanbook\Tools\ZFunction::strlen(' . $arguments . ')';
        }

        return null;
    }
}
