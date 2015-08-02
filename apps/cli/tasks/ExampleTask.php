<?php
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Tools\Cli\Output;

class ExampleTask extends Task
{
    public function test1Action()
    {
        Output::stdout("Hello World!");
    }

    public function mainAction()
    {
        Output::stdout("Main Action");
    }


    public function cmdAction()
    {
        $cmd = \Cli\Execute::singleton();
        $success = $cmd->execute("whoami", __FILE__, __LINE__, $output);

        Output::stdout("You're running this script under $output user");
    }


    public function test2Action($paramArray)
    {
        Output::stdout("First param: $paramArray[0]");
        Output::stdout("Second param: $paramArray[1]");
    }


    /**
     * Action to trigger a fatal error
     */
    public function fatalAction()
    {
        // trigger a fatal error w/ Class that doesn't exist
        //new TriggerARuntimeFatal();
        strpos();
    }
}
