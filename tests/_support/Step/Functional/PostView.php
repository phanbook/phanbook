<?php

namespace Step\Functional;

use Phalcon\Tag;
use Codeception\Scenario;
use Phanbook\Models\Users;
use Phanbook\Models\Posts;
use Faker\Factory as Faker;

class PostView extends \FunctionalTester
{
    const DEFAULT_KARMA = 0;
    protected $faker;

    public function __construct(Scenario $scenario)
    {
        parent::__construct($scenario);

        $this->faker = Faker::create();
    }

    public function haveAuthor()
    {
        return $this->haveRegularUser(false);
    }

    public function haveBlogPost($authorId)
    {
        $I     = $this;
        $title = $this->faker->title;
        $data  = [
            'usersId' => $authorId,
            'type'    => 'blog',
            'title'   => $title,
            'slug'    => Tag::friendlyTitle($title),
            'content' => $this->faker->text(),
        ];

        return $I->haveRecord(Posts::class, $data);
    }

    public function haveRegularUser($login = true)
    {
        $I    = $this;
        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
            'karma'     => self::DEFAULT_KARMA,
            'status'    => Users::STATUS_ACTIVE,
            'passwd'    => $this->faker->password,
        ];

        $id = $I->haveRecord(Users::class, $data);

        if ($login) {
            $I->haveInSession('auth', [
                'id'        => $id,
                'admin'     => false,
                'moderator' => false,
                'theme'     => 'D',
                'name'      => $data['firstname'],
                'fullname'  => $data['firstname'] . ' ' . $data['lastname'],
                'username'  => $data['username'],
                'email'     => $data['email'],
            ]);
        }

        return $id;
    }

    public function haveClientIp()
    {
        $_SERVER['REMOTE_ADDR'] = $this->faker->ipv4;

        return $_SERVER['REMOTE_ADDR'];
    }
}
