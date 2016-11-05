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
namespace Phanbook\Plugins\Db;

use Phalcon\Di;
use Phalcon\Logger;
use Phalcon\DiInterface;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Logger\Adapter\File;

/**
 * \Phanbook\Plugins\Db\Listener
 *
 * @package Phanbook\Plugins\Db
 */
class Listener extends Plugin
{
    const DEFAULT_LOG_FILE = 'db.log';

    /**
     * @var DiInterface
     */
    protected $di;

    /**
     * @var string
     */
    protected $logFilename;

    /**
     * @var File
     */
    protected $logger;

    /**
     * Listener constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->di = $di ?: Di::getDefault();

        $config = $this->di->getShared('config')->database;

        if (!isset($config->logFile) || empty($config->logFile) || !is_scalar($config->logFile)) {
            $this->logFilename = self::DEFAULT_LOG_FILE;
        }

        /** @var File $mainLogger */
        $mainLogger = $this->di->getShared('logger');

        $this->logger = new File(logs_path(date('Y-m-d') . '-' . $this->logFilename));

        $this->logger->setLogLevel($mainLogger->getLogLevel());
        $this->logger->setFormatter($mainLogger->getFormatter());
    }

    /**
     * Database queries listener.
     *
     * You can disable queries logging by changing log level.
     *
     * @param  Event $event
     * @param  Pdo   $connection
     * @return bool
     */
    public function beforeQuery(Event $event, Pdo $connection)
    {
        $string    = $connection->getSQLStatement();
        $variables = $connection->getSqlVariables();
        $context   = $variables ?: [];

        $this->logger->log(Logger::DEBUG, $string . ' [' . implode(', ', $context) . ']');

        return true;
    }
}
