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

    public function registerUser()
    {
        $I = $this;

        $I->amOnPage('/oauth/register/signup');

        $data = [
            'firstname' =>  $this->faker->name,
            'lastname' =>  $this->faker->name,
            'email' => $this->faker->email,
            'username' => $this->faker->userName,
        ];

        $I->fillField('firstname', $data['firstname']);
        $I->fillField('lastname', $data['lastname']);
        $I->fillField('email', $data['email']);
        $I->fillField('username', $data['username']);

        $I->click('Register');

        return $data;
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

    public function loginWithLongUserAgent()
    {
        $I = $this;

        $I->amOnPage('/oauth/login');
        $I->see('Sign In');
        $I->fillField('email', $this->email);
        $I->fillField('password', $this->passwd);

        $I->haveUserAgent(str_repeat('a', 10000));

        $I->checkOption('#remember-me');
        $I->click('Sign In');
    }
}
