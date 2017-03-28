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
use Phanbook\Search\Indexer;
use Phanbook\Cli\Library\Output;

class SearchTask extends Task
{
    public function mainAction()
    {
        Output::stdout('Init search Indexer');

        $search = new Indexer();
        $search->indexAll();

        Output::stdout('Phanbook search successfully');
    }
}
