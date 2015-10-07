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
use Phanbook\Tools\Cli\Output;

class TestsTask extends Task
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
