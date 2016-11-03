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

use PDO;
use Phalcon\Logger;
use Phalcon\Logger\Adapter\File;
use Phalcon\Db\Adapter\Pdo\Mysql;

/**
 * \Phanbook\Common\Library\Providers\DatabaseServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class DatabaseServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'db';

    protected $logFile = 'db.log';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $logFile = $this->logFile;

        $this->di->setShared(
            $this->serviceName,
            function () use ($logFile) {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config');

                $connection = new Mysql(
                    [
                        'host'     => $config->database->mysql->host,
                        'username' => $config->database->mysql->username,
                        'password' => $config->database->mysql->password,
                        'dbname'   => $config->database->mysql->dbname,
                        'options'  => [
                            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES ' . $config->database->mysql->charset
                        ]
                    ]
                );

                $eventsManager = $this->getShared('eventsManager');

                if ($config->application->debug) {
                    $logger = new File(logs_path($logFile));
                    // Listen all the database events
                    $eventsManager->attach(
                        'db',
                        function ($event, $connection) use ($logger) {
                            if ($event->getType() == 'beforeQuery') {
                                if ($variables = $connection->getSQLVariables()) {
                                    $variables = ' [' . implode(',', $variables) . ']';
                                }

                                $logger->log($connection->getSQLStatement() . $variables, Logger::DEBUG);
                            }
                        }
                    );
                }

                $connection->setEventsManager($eventsManager);

                return $connection;
            }
        );
    }
}
