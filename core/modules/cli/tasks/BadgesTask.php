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
use Phanbook\Badges\Manager as BadgesManager;

/**
 * This script processes badges for users
 */
class BadgesTask extends Task
{
    public function mainAction()
    {
        echo "\n Start processes badges for users \n";

        $badge = new BadgesManager();
        $badge->process();

        echo "\n Adding successfully \n";
    }
}
