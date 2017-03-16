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
 * @property \Phalcon\Mvc\Dispatcher|\Phalcon\Mvc\DispatcherInterface $dispatcher
 * @property \Phalcon\Mvc\Router|\Phalcon\Mvc\RouterInterface $router
 * @property \Phalcon\Mvc\Url|\Phalcon\Mvc\UrlInterface $url
 * @property \Phalcon\Http\Request|\Phalcon\Http\RequestInterface $request
 * @property \Phalcon\Http\Response|\Phalcon\Http\ResponseInterface $response
 * @property \Phalcon\Http\Response\Cookies|\Phalcon\Http\Response\CookiesInterface $cookies
 * @property \Phalcon\Filter|\Phalcon\FilterInterface $filter
 * @property \Phalcon\Flash\Direct $flash
 * @property \Phalcon\Flash\Session $flashSession
 * @property \Phalcon\Session\Adapter\Files|\Phalcon\Session\Adapter|\Phalcon\Session\AdapterInterface $session
 * @property \Phalcon\Events\Manager|\Phalcon\Events\ManagerInterface $eventsManager
 * @property \Phalcon\Db\AdapterInterface $db
 * @property \Phalcon\Security $security
 * @property \Phalcon\Crypt|\Phalcon\CryptInterface $crypt
 * @property \Phalcon\Tag $tag
 * @property \Phalcon\Escaper|\Phalcon\EscaperInterface $escaper
 * @property \Phalcon\Annotations\Adapter\Memory|\Phalcon\Annotations\Adapter $annotations
 * @property \Phalcon\Mvc\Model\Manager|\Phalcon\Mvc\Model\ManagerInterface $modelsManager
 * @property \Phalcon\Mvc\Model\MetaData\Memory|\Phalcon\Mvc\Model\MetadataInterface $modelsMetadata
 * @property \Phalcon\Mvc\Model\Transaction\Manager|\Phalcon\Mvc\Model\Transaction\ManagerInterface $transactionManager
 * @property \Phalcon\Assets\Manager $assets
 * @property \Phalcon\Di|\Phalcon\DiInterface $di
 * @property \Phalcon\Session\Bag|\Phalcon\Session\BagInterface $persistent
 * @property \Phalcon\Mvc\View|\Phalcon\Mvc\ViewInterface $view
 *
 * @method \Phalcon\Config getConfig(mixed $params = null)
 * @method \Phalcon\Logger|\Phalcon\Logger\AdapterInterface getLogger(mixed $params = null)
 * @method \Phalcon\Http\Request|\Phalcon\Http\RequestInterface getRequest(mixed $params = null)
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

    /**
     * Trying to obtain the dependence from the Dependency Injection Container.
     *
     * <code>
     * use Phanbook\Common\Library\Behavior\Di;
     *
     * class A {
     *     // Some logic
     * }
     *
     * class B extends A {
     *     use Di {
     *         Di::__construct as protected injectDI;
     *     }
     *
     *     public function __construct()
     *     {
     *         $this->injectDI();
     *     }
     * }
     *
     * $a = new A();
     * $a->getLogger('db.log');
     * </code>
     *
     * @param string $func
     * @param mixed $argv
     *
     * @return mixed
     */
    public function __call($func, $argv)
    {
        return call_user_func_array([$this->getDI(), $func], $argv);
    }
}
