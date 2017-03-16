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
namespace Phanbook\Common\Library\Volt;

use Phanbook\Models\Services\Service;

/***
 * \Phanbook\Common\Library\Volt\VoltFunctions
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
            case 'teaser':
                return Functions\Teaser::class . "::create({$arguments})";
            case 'vote_score':
                return 'container(' . Service\Vote::class . "::class)->getScore({$arguments})";
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

        return null;
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
            case 'teaser':
                return Functions\Teaser::class . '::create(' . $arguments . ')';
            case 'strlen':
                return "\\Stringy\\create('$arguments')->length()";
        }

        return null;
    }
}
