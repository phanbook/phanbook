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
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Cli\Tasks;

use Phalcon\Cli\Task;
use Phanbook\Cli\Library\Output;

/**
 * \Phanbook\Cli\Tasks\TestsTask
 *
 * @property \Phanbook\Mail\Mail mail
 * @package Phanbook\Cli\Tasks
 */
class TestsTask extends Task
{
    public function test1Action()
    {
        Output::stdout('Hello World!');
    }

    public function mainAction()
    {
        Output::stdout("Main Action");
    }

    public function test2Action($paramArray)
    {
        Output::stdout('First param: ' . $paramArray[0]);
        Output::stdout('Second param: ' . $paramArray[1]);
    }

    public function renderAction()
    {
        echo $this->mail->renderTest();
    }
}
