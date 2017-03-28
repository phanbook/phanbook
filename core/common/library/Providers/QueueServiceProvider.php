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

use Phalcon\Queue\Beanstalk;
use Phanbook\Queue\DummyServer;

/**
 * \Phanbook\Common\Library\Providers\QueueServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class QueueServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'queue';

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
                $config = $this->getShared('config');

                if (!isset($config->beanstalk->enabled) || !$config->beanstalk->enabled) {
                    return new DummyServer();
                }

                if (!isset($config->beanstalk->host) || !isset($config->beanstalk->port)) {
                    trigger_error('Beanstalk is not configured', E_USER_ERROR);
                }

                return new Beanstalk(
                    [
                        'host' => $config->beanstalk->host,
                        'port' => $config->beanstalk->port,
                    ]
                );
            }
        );
    }
}
