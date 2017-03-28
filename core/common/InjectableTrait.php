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

use Phalcon\Di;
use ReflectionMethod;
use Phalcon\Di\Injectable;

/**
 * \Phanbook\Common\InjectableTrait
 *
 * @package Phanbook\Common
 */
trait InjectableTrait
{
    protected function injectDependencies()
    {
        if (!method_exists($this, 'inject')) {
            return;
        }

        $reflectionMethod = new ReflectionMethod($this, 'inject');
        $methodParams = $reflectionMethod->getParameters();

        $params = [];

        if (!count($methodParams)) {
            return;
        }

        if ($this instanceof Injectable) {
            $di = $this->getDI();
        } else {
            $di = Di::getDefault();
        }

        foreach ($methodParams as $key => $methodParam) {
            if ($methodParam->getClass()) {
                $className = $methodParam->getClass()->getName();
                if ($di->has($className)) {
                    $params[$key] = $di->getShared($className);
                } elseif (class_exists($className)) {
                    $params[$key] = new $className();
                }
            } elseif ($di->has($methodParam->getName())) {
                $params[$key] = $di->getShared($methodParam->getName());
            } else {
                $params[$key] = null;
            }
        }

        call_user_func_array([$this, 'inject'], $params);
    }
}
