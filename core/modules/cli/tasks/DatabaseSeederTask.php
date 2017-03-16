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
use Phanbook\Cli\Library\Output;
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
