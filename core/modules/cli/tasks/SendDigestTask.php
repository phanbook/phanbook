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
use Phanbook\Mail\Digest;
use Phanbook\Tools\Cli\Output;

class SendDigestTask extends Task
{
    public function mainAction()
    {
        Output::stdout('Send digest email');
        $spool = new Digest();
        try {
            var_dump($spool->send());
        } catch (Exception $e) {
            Output::stdout($e->getMessage());
            Output::stdout($e->getTraceAsString());
        }

    }
}
