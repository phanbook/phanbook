<?php

namespace Step\Acceptance;

use Codeception\Scenario;
use Faker\Factory as Faker;

class RegularUser extends \AcceptanceTester
{
    protected $faker;
    protected $passwd;
    protected $email;

    public function __construct(Scenario $scenario)
    {
        parent::__construct($scenario);

        $this->faker = Faker::create();
    }

    public function haveUserInDb()
    {
        $I = $this;

        $this->passwd = $this->faker->password;
        $this->email = $this->faker->email;

        /** @var \Phalcon\Security $security */
        $security = $this->grabServiceFromContainer('security');

        $I->haveInDatabase('users', [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
            'passwd'    => $security->hash($this->passwd),
        ]);
    }

    public function loginUser()
    {
        $I = $this;

        $I->amOnPage('/oauth/login');
        $I->see('Sign In');
        $I->fillField('email', $this->email);
        $I->fillField('password', $this->passwd);
        $I->click('Sign In');
    }
}
