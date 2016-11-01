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
namespace Phanbook\Common\Library\Behavior;

use Phalcon\Di as PhD;
use Phalcon\DiInterface;

/**
 * \Phanbook\Common\Library\Behavior\Di
 *
 * Dependency Injection Trait.
 * It should be used for classes which do not extend Injectable
 * and do not implement DiInterface interface.
 *
 * <code>
 * class A {
 *     // Some logic
 * }
 *
 * use Phanbook\Common\Library\Behavior\Di as DiBehavior;
 *
 * class B extends A {
 *     use DiBehavior {
 *         DiBehavior::__construct as protected injectDi;
 *     }
 *
 *     public function __construct()
 *     {
 *         $this->injectDi();
 *     }
 * }
 * </code>
 *
 * @package Phanbook\Common\Library\Behavior
 */
trait Di
{
    /**
     * The Dependency Injection Container.
     * @var DiInterface
     */
    protected $di;

    /**
     * Di constructor.
     *
     * @param DiInterface|null $di The Dependency Injection Container.
     */
    public function __construct(DiInterface $di = null)
    {
        $this->setDI($di ?: PhD::getDefault());
    }

    /**
     * Gets the Dependency Injection Container.
     *
     * @return DiInterface
     */
    public function getDI()
    {
        return $this->di;
    }

    /**
     * Sets the Dependency Injection Container.
     *
     * @param DiInterface $di
     * @return $this
     */
    public function setDI(DiInterface $di)
    {
        $this->di = $di;

        return $this;
    }
}
