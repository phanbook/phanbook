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

use Phanbook\Common\Library\Acl\Manager;

/**
 * \Phanbook\Common\Library\Providers\AclServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class AclServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'aclManager';

    protected $config;

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function configure()
    {
        /** @noinspection PhpIncludeInspection */
        $config = require config_path('acl.php');

        $driver = $config['default'];

        $this->config['config']   = $config['drivers'][$driver];
        $this->config['lifetime'] = $config['lifetime'];
        $this->config['cacheKey'] = $config['cacheKey'];
    }

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $config = $this->config;

        $this->di->setShared(
            $this->serviceName,
            function () use ($config) {
                /** @var \Phalcon\DiInterface $this */
                $config = [
                    'adapter'  => '\Phalcon\Acl\Adapter\\' . $config['config']['adapter'],
                    'lifetime' => $config['lifetime'],
                    'cacheKey' => $config['cacheKey'],
                ];

                $manager = new Manager($config);

                $manager->setDI($this);
                $manager->setEventsManager($this->getShared('eventsManager'));

                return $manager;
            }
        );
    }
}
