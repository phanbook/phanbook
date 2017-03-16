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
namespace Phanbook\Queue;

/**
 * DummyServer
 *
 * This class replaces Beanstalkd by a dummy server
 */
class DummyServer
{
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
