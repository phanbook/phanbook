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

use Phalcon\Di;
use Phalcon\Tag;
use Phanbook\Models\Tags;
use Phanbook\Models\Users;
use Phanbook\Models\Posts;
use Faker\Factory as Faker;
use Phanbook\Models\PostsTags;
use Phanbook\Models\PostsReply;
use Phanbook\Common\Application;
use Phalcon\Logger\Adapter\Stream;

require dirname(dirname(dirname(__FILE__))) . '/bootstrap/autoloader.php';

new Application('cli');

$faker = Faker::create();
$log   = new Stream('php://stdout');

$log->info('Start');

/** @var Phalcon\Db\AdapterInterface $database */
$database = Di::getDefault()->getShared('db');

$database->begin();
for ($i = 0; $i <= 50; $i++) {
    $name = explode(' ', $faker->name, 2);
    if (count($name) == 1) {
        $name[1] = $faker->name;
    }

    $user = new Users([
        'username'  => $faker->userName,
        'firstname' => $name[0],
        'lastname'  => $name[1],
        'email'     => $faker->email,
        'bio'       => $faker->paragraph,
        'birthdate' => $faker->date(),
    ]);

    if (!$user->save()) {
        $database->rollback();
        $log->error(implode(PHP_EOL, $user->getMessages()));
        exit(1);
    }

    $log->info('User: ' . $user->getFullName());
}
$database->commit();

$yesNo = ['N', 'Y'];

$database->begin();
for ($i = 0; $i <= 50; $i++) {
    $name = $faker->colorName;

    $tags = new Tags([
        'name'        => $name,
        'description' => $faker->paragraph(),
        'slug'        => Tag::friendlyTitle($name),
        'numberPosts' => 0,
        'noBounty'    => $yesNo[$faker->numberBetween(0, 1)],
        'noDigest'    => $yesNo[$faker->numberBetween(0, 1)],
    ]);

    if (!$tags->save()) {
        $database->rollback();
        $log->error(implode(PHP_EOL, $tags->getMessages()));
        exit(1);
    }

    $log->info('Tag: ' . $tags->getName());
}
$database->commit();

$types   = [Posts::POST_BLOG, Posts::POST_HACKERNEWS, Posts::POST_PAGE, Posts::POST_QUESTIONS];
$userIds = array_column(Users::find(['columns' => 'id'])->toArray(), 'id');

$database->begin();
for ($i = 0; $i <= 500; $i++) {
    $title = $faker->company;

    $userId = array_rand($userIds);
    $postId = array_rand($types);

    $post = new Posts([
        'usersId' => $userIds[$userId],
        'type'    => $types[$postId],
        'title'   => $title,
        'slug'    => Tag::friendlyTitle($title),
        'content' => $faker->text() . '<br>' . $faker->paragraph(),
    ]);

    if (!$post->save()) {
        $database->rollback();
        $log->error(implode(PHP_EOL, $post->getMessages()));
        exit(1);
    }

    $log->info('Post: ' . $post->getTitle());
}
$database->commit();

$postIds = array_column(Posts::find(['columns' => 'id'])->toArray(), 'id');
$tagIds  = array_column(Tags::find(['columns' => 'id'])->toArray(), 'id');

$database->begin();
for ($i = 0; $i <= 100; $i++) {
    $postId = array_rand($postIds);
    $tagId  = array_rand($tagIds);

    $postsTag = new PostsTags([
        'postsId' => $postIds[$postId],
        'tagsId'  => $tagIds[$tagId],
    ]);

    if (!$postsTag->save()) {
        $database->rollback();
        $log->error(implode(PHP_EOL, $postsTag->getMessages()));
        exit(1);
    }

    $log->info('Tag for post: ' . $postsTag->getPostsId());
}
$database->commit();

$database->begin();
for ($i = 0; $i <= 200; $i++) {
    $postId = array_rand($postIds);
    $userId = array_rand($userIds);

    $reply = new PostsReply([
        'postsId' => $postIds[$postId],
        'usersId' => $userIds[$userId],
        'content' => $faker->paragraph(),
    ]);

    if (!$reply->save()) {
        $database->rollback();
        $log->error(implode(PHP_EOL, $reply->getMessages()));
        exit(1);
    }

    $log->info('Reply to post: ' . $reply->getPostsId());
}
$database->commit();
