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
namespace Phanbook\Common;

use ReflectionMethod;
use Phalcon\DiInterface;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;

/**
 * \Phanbook\Common\InjectionInvoker
 *
 * @package Phanbook\Common
 */
class InjectionInvoker
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * InjectionInvoker constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
    }

    public function invoke($object)
    {
        $reflectionMethod = new ReflectionMethod($object, 'inject');
        $methodParams = $reflectionMethod->getParameters();

        $params = [];

        if (!count($methodParams)) {
            return;
        }

        foreach ($methodParams as $key => $methodParam) {
            if ($methodParam->getClass()) {
                $className = $methodParam->getClass()->getName();
                if ($this->getDI()->has($className)) {
                    $params[$key] = $this->getDI()->getShared($className);
                } elseif (class_exists($className)) {
                    $params[$key] = new $className();
                }
            } elseif ($this->getDI()->has($methodParam->getName())) {
                $params[$key] = $this->getDI()->getShared($methodParam->getName());
            } else {
                $params[$key] = null;
            }
        }

        call_user_func_array([$object, 'inject'], $params);
    }
}
