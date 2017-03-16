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
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Queue;

use Phalcon\Queue\Beanstalkd;

/**
 * Server
 *
 * Facade to Phalcon\Queue\Beanstalkd
 */
class Server
{
    /**
     * Server constructor
     *
     * @param Beanstalkd $queue
     */
    public function __construct(Beanstalkd $queue)
    {
        $this->queue = $queue;
    }

    /**
     * Simulates putting a job in the queue
     *
     * @param array $job
     */
    public function put($job)
    {
        return true;
    }
}
