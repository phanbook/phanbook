<?php

namespace Phanbook\Cli\Tasks;

use Phalcon\CLI\Task;
use Phanbook\Tools\Cli\Output;
use Phanbook\Databases\UsersSeeder;
use Phanbook\Databases\PostsSeeder;
use Phanbook\Databases\TagsSeeder;
use Phanbook\Databases\PostsTagsSeeder;

/**
 * Class DatabaseSeedingTask.
 */
class DatabaseSeederTask extends Task
{
    /**
     * Convert
     *
     * @param array $params
     */
    public function mainAction($params = array())
    {
        Output::stdout('Main Action');
        TagsSeeder::run();
        UsersSeeder::run();
        PostsSeeder::run();
        PostsTagsSeeder::run();
        Output::stdout('Completed');
    }
}
