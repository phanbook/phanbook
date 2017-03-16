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
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Mail\Digest;
use Phanbook\Cli\Library\Output;

class SendDigestTask extends Task
{
    public function mainAction()
    {
        Output::stdout('Send digest email');
        $spool = new Digest();
        try {
            var_dump($spool->send());
        } catch (\Exception $e) {
            Output::stdout($e->getMessage());
            Output::stdout($e->getTraceAsString());
        }
    }
}
