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

/**
 *
 */
class TagsSeeder extends Seeder
{
    public  function run()
    {
        $faker = Faker::create();
        $log   = new Stream('php://stdout');
        $log->info('Start ' . __CLASS__);

        /** @var Phalcon\Db\AdapterInterface $database */
        $database = $this->getDI()->get('db');
        $database->begin();

        for ($i = 0; $i <= self::TAGS_TOTAL; $i++) {
            $title       = $faker->company;
            $description = $faker->text;

            $tags               = new Tags();
            $tags->name         = $title;
            $tags->slug         = \Phalcon\Tag::friendlyTitle($title);
            $tags->numberPosts  = 0;
            $tags->noBounty     = 'N';
            $tags->noDigest     = 'N';
            $tags->description  = $description;

            if (!$tags->save()) {
                var_dump($tags->getMessages());
                $database->rollback();
                die;
            }

            $log->info('tags: '.$tags->getName());
        }
    }

    public function abc()
    {
        //d($this);
    }
}
