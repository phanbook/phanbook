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

use Phalcon\Logger;
use Phalcon\Logger\Adapter\File;
use Phalcon\Logger\Formatter\Line;

/**
 * \Phanbook\Common\Library\Providers\LoggerServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class LoggerServiceProvider extends AbstractServiceProvider
{
    const DEFAULT_LEVEL = 'debug';
    const DEFAULT_FORMAT = '[%date%][%type%] %message%';

    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'logger';

    protected $logLevels = [
        'emergency' => Logger::EMERGENCY,
        'emergence' => Logger::EMERGENCE,
        'critical'  => Logger::CRITICAL,
        'alert'     => Logger::ALERT,
        'error'     => Logger::ERROR,
        'warning'   => Logger::WARNING,
        'notice'    => Logger::NOTICE,
        'info'      => Logger::INFO,
        'debug'     => Logger::DEBUG,
        'custom'    => Logger::CUSTOM,
        'special'   => Logger::SPECIAL,
    ];

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $logLevels = $this->logLevels;

        $this->di->set(
            $this->serviceName,
            function ($filename = null) use ($logLevels) {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config')->application->logger;

                if (!isset($config->level)) {
                    $level = self::DEFAULT_LEVEL;
                } else {
                    $level = strtolower($config->level);
                }

                if (!isset($logLevels[$level])) {
                    $level = Logger::DEBUG;
                } else {
                    $level = $logLevels[$level];
                }

                if (!isset($config->format)) {
                    $format = self::DEFAULT_FORMAT;
                } else {
                    $format = $config->format;
                }

                $filename = ($filename ?: date('Y-m-d')) . '.log';

                $logger = new File(logs_path($filename));

                $logger->setFormatter(new Line($format));
                $logger->setLogLevel($level);

                return $logger;
            }
        );
    }
}
