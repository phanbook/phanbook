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

use Memcached;
use Phalcon\Cache\Frontend\Data;
use Phalcon\Cache\Backend\Libmemcached;
use Phalcon\Cache\Frontend\None as FrontendNone;
use Phalcon\Cache\Backend\Memory as BackendMemory;

/**
 * \Phanbook\Common\Library\Providers\ModelsCacheServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ModelsCacheServiceProvider extends AbstractServiceProvider
{
    const DEFAULT_CACHE_TTL = 86400;
    const DEFAULT_HOST = 'localhost';
    const DEFAULT_PORT = 11211;
    const DEFAULT_WEIGHT = 1;
    const DEFAULT_OPT_HASH = Memcached::HASH_MD5;
    const DEFAULT_PREFIX = 'phanbook_';

    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'modelsCache';

    protected $defaultConfig = [
        'servers' => [
            [
                'host'   => ModelsCacheServiceProvider::DEFAULT_HOST,
                'port'   => ModelsCacheServiceProvider::DEFAULT_PORT,
                'weight' => ModelsCacheServiceProvider::DEFAULT_WEIGHT,
            ],
        ],
        'client' => [
            Memcached::OPT_HASH => ModelsCacheServiceProvider::DEFAULT_OPT_HASH,
        ],
    ];

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $defaultConfig = $this->defaultConfig;

        $this->di->setShared(
            $this->serviceName,
            function () use ($defaultConfig) {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config')->application;

                if ($config->debug && (!isset($config->modelsCache->force) || !$config->modelsCache->force)) {
                    return new BackendMemory(new FrontendNone());
                }

                $lifeTime = ModelsCacheServiceProvider::DEFAULT_CACHE_TTL;
                if (isset($config->modelsCache->lifeTime)) {
                    $lifeTime = (int) $config->modelsCache->lifeTime;
                }

                $prefix = ModelsCacheServiceProvider::DEFAULT_PREFIX;
                if (isset($config->modelsCache->prefix)) {
                    $prefix = $config->modelsCache->prefix;
                }

                $memcachedConfig = $config->modelsCache->toArray();
                unset($memcachedConfig['lifeTime'], $memcachedConfig['force'], $memcachedConfig['prefix']);

                $memcachedConfig = array_merge($defaultConfig['servers'][0], $memcachedConfig);
                $memcachedConfig['prefix'] = $prefix;

                return new Libmemcached(new Data(['lifetime' => $lifeTime]), $memcachedConfig);
            }
        );
    }
}
