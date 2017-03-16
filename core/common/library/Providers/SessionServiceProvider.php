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

use Phalcon\Session\Adapter\Files;

/**
 * \Phanbook\Common\Library\Providers\SessionServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class SessionServiceProvider extends AbstractServiceProvider
{
    const UNIQUE_ID = 'phanbook_';

    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'session';

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
                $config = $this->getShared('config')->application->session;

                if (isset($config->adapter)) {
                    $sessionAdapter = '\Phalcon\Session\Adapter\\'  . $config->adapter;
                    if (class_exists($sessionAdapter)) {
                        if (isset($config->domain)) {
                            ini_set('session.cookie_domain', $config->domain);
                        }
                        $options = $config->options->toArray();
                        /** @var \Phalcon\Session\AdapterInterface $session */
                        $session = new $sessionAdapter($options);
                        $session->start();

                        return $session;
                    }
                }

                $session = new Files(['uniqueId' => SessionServiceProvider::UNIQUE_ID]);
                $session->start();

                return $session;
            }
        );
    }
}
