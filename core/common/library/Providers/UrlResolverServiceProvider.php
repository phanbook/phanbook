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

use Phalcon\Mvc\Url;

/**
 * \Phanbook\Common\Library\Providers\UrlResolverServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class UrlResolverServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'url';

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

                $url = new Url();

                if (isset($config->application->staticBaseUri)) {
                    $url->setStaticBaseUri($config->application->staticBaseUri);
                } else {
                    $url->setStaticBaseUri('/');
                }

                if (isset($config->application->baseUri)) {
                    $url->setBaseUri($config->application->baseUri);
                } else {
                    $url->setBaseUri('/');
                }

                return $url;
            }
        );
    }
}
