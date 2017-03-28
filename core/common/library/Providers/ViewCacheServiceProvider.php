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
                $config = $this->getShared('config')->application;

                if ($config->debug && (!isset($config->viewCache->force) || !$config->viewCache->force)) {
                    return new Backend\Memory(new Frontend\None());
                }

                $lifetime = ViewCacheServiceProvider::DEFAULT_CACHE_TTL;
                if (isset($config->viewCache->lifetime)) {
                    $lifetime = (int) $config->viewCache->lifetime;
                }

                return new Backend\File(
                    new Frontend\Output(['lifetime' => (int) $lifetime]),
                    [
                        'cacheDir' => $config->viewCache->cacheDir,
                        'prefix'   => $config->viewCache->prefix
                    ]
                );
            }
        );
    }
}
