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

use Phalcon\DiInterface;
use Phalcon\Events\Manager;
use Phalcon\Events\ManagerInterface;

/**
 * \Phanbook\Common\Module
 *
 * @package Phanbook\Common
 */
abstract class Module implements ModuleInterface
{
    /**
     * @var DiInterface
     */
    protected $di;

    /**
     * @var Manager
     */
    protected $eventsManager;

    /**
     * Module constructor.
     *
     * @param DiInterface  $di
     * @param Manager|null $manager
     */
    public function __construct(DiInterface $di = null, Manager $manager = null)
    {
        $this->di = $di ?: container();
        $this->eventsManager = $manager;
    }

    /**
     * Initialize module.
     */
    public function initialize()
    {
        $this->registerAutoloaders($this->di);
        $this->registerServices($this->di);
    }

    /**
     * Returns the internal event manager.
     *
     * @return ManagerInterface
     */
    public function getEventsManager()
    {
        $eventsManager = $this->eventsManager;

        if ($eventsManager instanceof ManagerInterface) {
            return $eventsManager;
        }

        if ($this->di->has('eventsManager')) {
            $eventsManager = $this->di->getShared('eventsManager');
        } else {
            $eventsManager = new Manager();
            $eventsManager->enablePriorities(true);
        }

        $this->setEventsManager($eventsManager);

        return $eventsManager;
    }

    /**
     * Sets the events manager.
     *
     * @param  ManagerInterface $eventsManager
     * @return $this
     */
    public function setEventsManager(ManagerInterface $eventsManager)
    {
        $this->eventsManager = $eventsManager;

        return $this;
    }
}
