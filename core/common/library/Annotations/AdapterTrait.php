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
namespace Phanbook\Common\Library\Annotations;

use Phalcon\Annotations\Adapter as PhAdapter;

/**
 * \Phanbook\Common\Library\Annotations\AdapterTrait
 *
 * @package Phanbook\Common\Library\Annotations
 */
trait AdapterTrait
{
    /**
     * Gets the fully qualified class name from the file path.
     *
     * @param  string $filePathName
     * @return null|string
     */
    public function getFullyQualifiedClassName($filePathName)
    {
        $className = $this->getClassNameFromFile($filePathName);
        if (empty($className)) {
            return null;
        }

        $namespace = $this->getClassNamespaceFromFile($filePathName);
        if (!empty($namespace)) {
            return '\\' . $namespace . '\\' . $className;
        }

        return '\\' . $className;
    }

    /**
     * Gets the class namespace from the file path.
     *
     * @param  string $filePathName
     * @return null|string
     */
    protected function getClassNamespaceFromFile($filePathName)
    {
        $contents = file_get_contents($filePathName);

        $tokens = token_get_all($contents);
        $count = count($tokens);
        $i = 0;

        $namespace = '';
        $found = false;

        while ($i < $count) {
            $token = $tokens[$i];
            if (is_array($token) && $token[0] === T_NAMESPACE) {
                while (++$i < $count) {
                    if ($tokens[$i] === ';') {
                        $found = true;
                        $namespace = trim($namespace);
                        break;
                    }

                    $namespace .= is_array($tokens[$i]) ? $tokens[$i][1] : $tokens[$i];
                }

                break;
            }

            $i++;
        }

        return $found ? $namespace : null;
    }

    /**
     * Gets the class name from the file path.
     *
     * @param  string $filePathName
     * @return null|string
     */
    protected function getClassNameFromFile($filePathName)
    {
        $contents = file_get_contents($filePathName);

        $classes = [];
        $tokens = token_get_all($contents);
        $count = count($tokens);

        for ($i = 2; $i < $count; $i++) {
            if ($tokens[$i - 2][0] == T_CLASS && $tokens[$i - 1][0] == T_WHITESPACE && $tokens[$i][0] == T_STRING) {
                $class_name = $tokens[$i][1];
                $classes[] = $class_name;
            }
        }

        return empty($classes[0]) ? null : $classes[0];
    }
}
