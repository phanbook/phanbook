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
namespace Phanbook\Common\Library\Events;

use Phalcon\DiInterface;
use Phalcon\Di\Injectable;
use Phanbook\Common\InjectableTrait;

/**
 * \Phanbook\Common\Library\Events\AbstractEvent
 *
 * @property \Phalcon\Logger\AdapterInterface $logger
 *
 * @package Phanbook\Common\Library\Events
 */
abstract class AbstractEvent extends Injectable
{
    use InjectableTrait;

    /**
     * AbstractEvent constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        if ($di) {
            $this->setDI($di);
        }

        $this->injectDependencies();
    }
}
