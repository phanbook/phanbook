<?php

namespace Step\Functional;

use Phalcon\Tag;
use Codeception\Scenario;
use Phanbook\Models\Posts;
use Phanbook\Models\Users;
use Faker\Factory as Faker;
use Phanbook\Models\PostsReply;

class PostReply extends \FunctionalTester
{
    protected $faker;

    public function __construct(Scenario $scenario)
    {
        parent::__construct($scenario);

        $this->faker = Faker::create();
    }

    /**
     * Creates a random random user and return its id
     *
     * @param array $attributes Model attributes [Optional]
     * @return int
     */
    public function haveUser(array $attributes = [])
    {
        $I       = $this;
        $default = [
            'username' => $this->faker->userName,
            'email'    => $this->faker->email,
            'timezone' => $this->faker->timezone,
            'passwd'   => $this->faker->password,
            'karma'    => 400
        ];

        $attributes = array_merge($default, $attributes);

        return $I->haveRecord(Users::class, $attributes);
    }

    /**
     * Creates a random post reply and return its id
     *
     * @param array $attributes Model attributes [Optional]
     * @return int
     */
    public function haveReply(array $attributes = [])
    {
        $I       = $this;
        $default = [
            'postsId' => $this->faker->numberBetween(),
            'usersId' => $this->faker->numberBetween(),
            'content' => $this->faker->paragraph(),
        ];

        return $I->haveRecord(PostsReply::class, array_merge($default, $attributes));
    }

    /**
     * Creates a random post and return its id
     *
     * @param array $attributes Model attributes [Optional]
     * @return int
     */
    public function havePost(array $attributes = [])
    {
        $I       = $this;
        $title   = $this->faker->title;
        $default = [
            'usersId' => $this->faker->numberBetween(),
            'type'    => 'questions',
            'title'   => $title,
            'slug'    => Tag::friendlyTitle($title),
            'content' => $this->faker->text(),
        ];

        // do not generate slug manually
        if (array_key_exists('slug', $attributes) && $attributes['slug'] === false) {
            unset($attributes['slug'], $default['slug']);
        }

        return $I->haveRecord(Posts::class, array_merge($default, $attributes));
    }
}
