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

                if (isset($config->beanstalk->disabled) && $config->beanstalk->disabled) {
                    return new DummyServer();
                }

                if (!isset($config->beanstalk->host)) {
                    throw new \Exception('Beanstalk is not configured');
                }

                return new Beanstalk(['host' => $config->beanstalk->host]);
            }
        );
    }
}
