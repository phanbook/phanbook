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
namespace Phanbook\Common\Library\Providers;

use Phalcon\DiInterface;
use Phalcon\Mvc\User\Component;

/**
 * \Phanbook\Common\Library\Providers\AbstractServiceProvider
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
    public function __construct(DiInterface $di)
    {
        $this->setDI($di);
    }

    /**
     * Gets the Service name.
     *
     * @return string
     */
    public function getName()
    {
        return $this->serviceName;
    }
}
