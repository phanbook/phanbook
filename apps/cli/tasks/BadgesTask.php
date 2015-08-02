<?php
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Badges\Manager as BadgesManager;

/**
 * This script processes badges for users
 */
class BadgesTask extends Task
{
    public function mainAction()
    {
        echo "\n Statrt processes badges for users \n";

        $badge = new BadgesManager();
        $badge->process();

        echo "\n Adding successfully \n";
    }
}
