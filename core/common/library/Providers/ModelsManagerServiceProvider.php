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

use Phalcon\Mvc\Model\Manager;

/**
 * \Phanbook\Common\Library\Providers\ModelsManagerServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ModelsManagerServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'modelsManager';

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
                $modelsManager = new Manager();
                $modelsManager->setEventsManager($this->getShared('eventsManager'));

                return $modelsManager;
            }
        );
    }
}
