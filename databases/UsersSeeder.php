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
use Phanbook\Models\Users;

/**
 *
 */
class UsersSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();
        $log   = new Stream('php://stdout');
        $log->info('Start '. __CLASS__);

        /** @var Phalcon\Db\AdapterInterface $database */
        $database = $this->getDI()->get('db');
        $database->begin();

        for ($i = 0; $i <= self::USERS_TOTAL; $i++) {
            $user               = new Users();
            $user->username     = $faker->userName;
            $user->email        = $faker->email;
            $user->timezone     = $faker->timezone;
            $user->moderator    = rand(0, 1) ? 'Y' : 'N';
            $user->karma        = mt_rand(10, 20000);
            $user->vote         = mt_rand(10, 200);
            $user->votePoint    = mt_rand(10, 100);
            $user->gender       = rand(0, 1) ? 1 : 2; //1-male, 2-female
            $user->passwd       = 'todolate';
            $user->status       = 1; //1-active, 2-pending
            $user->theme        = 'D';
            if (!$user->save()) {
                var_dump($users->getMessages());
                $database->rollback();
                die;
            }

            $log->info('users: '.$user->getUsername());
        }
    }
}
