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
use Phanbook\Models\Posts;
use Phanbook\Models\Tags;
use Phanbook\Models\Users;
use Phanbook\Databases\Seeder;

/**
 *
 */
class PostsSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();
        $log   = new Stream('php://stdout');

        $log->info('Start ' . __CLASS__);

        /** @var Phalcon\Db\AdapterInterface $database */
        $database = $this->getDI()->get('db');
        $userIds     = Users::find(['columns' => 'id'])->toArray();
        $database->begin();

        for ($i = 0; $i <= self::POSTS_TOTAL; $i++) {
            $title       = $faker->company;
            $userRandId     = array_rand($userIds);
            $posts               = new Posts();

            $posts->usersId      = $userIds[$userRandId]['id'];
            $posts->type         = rand(0, 1) ? 'questions' : 'tips';
            $posts->title        = $title;
            $posts->slug         = \Phalcon\Tag::friendlyTitle($title);
            $posts->numberViews  = rand(5, 100);
            $posts->numberReply  = rand(0, 20);
            $posts->content      = $faker->text;
            $posts->sticked      = 'N';
            $posts->status       = 'A';
            $posts->locked       = 'N';
            $posts->deleted      = 0;
            $posts->acceptedAnswer = 'N';

            if (!$posts->save()) {
                var_dump($posts->getMessages());
                $database->rollback();
                die;
            }

            $log->info('posts: '.$posts->getTitle());
        }
    }
}
