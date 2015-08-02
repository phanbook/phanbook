<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link          http://phanbook.com Phanbook Project
 * @since         1.0.0
 * @license       http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Databases;

use Faker\Factory as Faker;
use Phalcon\Logger\Adapter\Stream;
use Phanbook\Databases\Seeder;
use Phanbook\Models\Tags;
use Phanbook\Models\Posts;
use Phanbook\Models\PostsTags;

/**
 *
 */
class PostsTagsSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();
        $log   = new Stream('php://stdout');
        $log->info('Start ' . __CLASS__);

        /** @var Phalcon\Db\AdapterInterface $database */
        $database = $this->getDI()->get('db');
        $database->begin();
        $postsId = Posts::find(['columns' => 'id'])->toArray();
        $tagsId  = Tags::find(['columns'  => 'id'])->toArray();

        for ($i = 0; $i <= self::POSTS_TAGS_TOTAL; $i++) {
            $postRandId = array_rand($postsId);
            $tagsRandId = array_rand($tagsId);

            $postTag               = new PostsTags();
            $postTag->postsId       = $postsId[$postRandId]['id'];
            $postTag->tagsId       = $tagsId[$tagsRandId]['id'];

            if (!$postTag->save()) {
                var_dump($tags->getMessages());
                $database->rollback();
                die;
            }

            $log->info('Posts<->Tags '. $postTag->getPostsId() . '<->' . $postTag->getTagsId());
        }
    }
}
