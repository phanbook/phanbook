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

use Phalcon\Cache\Backend;
use Phalcon\Cache\Frontend;

/**
 * \Phanbook\Common\Library\Providers\UrlResolverServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ViewCacheServiceProvider extends AbstractServiceProvider
{
    const DEFAULT_CACHE_TTL = 86400;

    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'viewCache';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->set(
            $this->serviceName,
            function () {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config');

                if ($config->application->debug) {
                    return new Backend\Memory(new Frontend\None());
                }

                // Cache data for one day by default
                if (!isset($config->cache->lifetime)) {
                    $lifetime = ViewCacheServiceProvider::DEFAULT_CACHE_TTL;
                } else {
                    $lifetime = $config->cache->lifetime;
                }

                $frontCache = new Frontend\Output(['lifetime' => (int) $lifetime]);

                return new Backend\File(
                    $frontCache,
                    [
                        'cacheDir' => $config->cache->cacheDir,
                        'prefix'   => $config->cache->prefix
                    ]
                );
            }
        );
    }
}
