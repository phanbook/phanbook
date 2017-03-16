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

use Phalcon\Mvc\Collection\Manager;

/**
 * \Phanbook\Common\Library\Providers\CollectionManagerServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class CollectionManagerServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'collectionManager';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->setShared(
            $this->serviceName,
            function () {
                /** @var \Phalcon\DiInterface $this */
                $collectionManager = new Manager();
                $collectionManager->setEventsManager($this->getShared('eventsManager'));

                return $collectionManager;
            }
        );
    }
}
