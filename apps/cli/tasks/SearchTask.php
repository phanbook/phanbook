<?php
namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Search\Indexer;

class SearchTask extends Task
{
    public function mainAction()
    {
        echo "\n Init search Indexer  \n";

        $search = new Indexer();
        $search->indexAll();

        echo "\n Phanbook search successfully \n";
    }
}
