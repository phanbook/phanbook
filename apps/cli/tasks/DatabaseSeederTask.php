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
