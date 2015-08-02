<?php
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Mail\SendSpool;

class SendSpoolTask extends Task
{
    public function mainAction()
    {
        echo "\n Send email for post reply\n";
        $spool = new SendSpool();
        try {
            var_dump($spool->sendRemaining());
        } catch (Exception $e) {
            echo $e->getMessage(), PHP_EOL;
            echo $e->getTraceAsString();
        }

    }
}
