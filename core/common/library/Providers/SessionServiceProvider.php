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
                $config = $this->getShared('config');

                if (isset($config->application->session->adapter)) {
                    $sessionAdapter = '\Phalcon\Session\Adapter\\'  . $config->application->session->adapter;
                    if (class_exists($sessionAdapter)) {
                        $config = $config->application->session->toArray();
                        unset($config['adapter']);

                        /** @var \Phalcon\Session\AdapterInterface $session */
                        $session = new $sessionAdapter($config);
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
