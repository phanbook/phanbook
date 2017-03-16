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
use Phanbook\Tools\ZFunction;
use Phanbook\Cli\Library\Output;

class UpdateTask extends Task
{
    /**
     * The task updated core Phanbook
     *
     * @return mixed
     */
    public function mainAction()
    {
        Output::stdout('======================================================');
        Output::stdout('Loading phanbook repositories with package information');

        Output::stdout('Call function ZFunction::gitUpdate()');
        ZFunction::gitUpdate();

        Output::stdout('Phanbook upgraded successfully');
        Output::stdout('======================================================');
    }
}
