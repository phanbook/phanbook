<?php
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;

class UpdateTask extends Task
{
    //@todo laster
    public function mainAction()
    {
        echo "\n Installing the latest version\n";
        echo shell_exec("git checkout master");
        echo shell_exec("git pull origin master");
        echo "\n Phanbook upgraded successfully\n";
    }
}
