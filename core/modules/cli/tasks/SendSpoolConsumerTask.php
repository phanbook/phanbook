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
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Mail\SendSpool;
use Phanbook\Tools\Cli\Output;

class SendSpoolConsumerTask extends Task
{
    public function mainAction()
    {
        Output::stdout('Send email for post reply');
        $spool = new SendSpool();
        try {
            var_dump($spool->consumeQueue());
        } catch (Exception $e) {
            echo $e->getMessage(), PHP_EOL;
            echo $e->getTraceAsString();
        }

    }
}
