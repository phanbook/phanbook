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
namespace Phanbook\Common\Library\Providers;

use LogicException;
use Phalcon\DiInterface;
use Phalcon\Mvc\User\Component;

/**
 * \Phanbook\Common\Library\Providers\AbstractServiceProvider
 *
 * Base class for all providers.
 *
 * @package Phanbook\Common\Library\Providers
 */
abstract class AbstractServiceProvider extends Component implements ServiceProviderInterface
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName;

    /**
     * The Service Provider constructor.
     *
     * @param DiInterface $di The Dependency Injector.
     */
    final public function __construct(DiInterface $di)
    {
        if (!$this->serviceName) {
            throw new LogicException(
                sprintf('The service provider defined in "%s" cannot have an empty name.', get_class($this))
            );
        }

        $this->setDI($di);

        $this->configure();
    }

    /**
     * {@inheritdoc}
     *
     * @return string
     */
    public function getName()
    {
        return $this->serviceName;
    }

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function boot()
    {
    }

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function configure()
    {
    }
}
