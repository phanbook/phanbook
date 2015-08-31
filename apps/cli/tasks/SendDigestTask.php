<?php
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
