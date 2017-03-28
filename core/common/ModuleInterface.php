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

use Phalcon\Events\EventsAwareInterface;
use Phalcon\Mvc\ModuleDefinitionInterface;

/**
 * \Phanbook\Common\ModuleInterface
 *
 * @package Phanbook\Common
 */
interface ModuleInterface extends ModuleDefinitionInterface, EventsAwareInterface
{
    /**
     * Initialize the module.
     */
    public function initialize();

    /**
     * Gets controllers/tasks namespace.
     *
     * @return string
     */
    public function getHandlersNamespace();
}
