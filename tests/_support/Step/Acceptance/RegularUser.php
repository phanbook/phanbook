<?php

namespace Step\Acceptance;

use Codeception\Scenario;
use Phanbook\Models\Users;
use Faker\Factory as Faker;

class RegularUser extends \AcceptanceTester
{
    protected $username;
    protected $firstname;
    protected $lastname;
    protected $passwd;
    protected $email;
    protected $faker;

    public function __construct(Scenario $scenario)
    {
        parent::__construct($scenario);

        $this->faker = Faker::create();
    }

    public function haveRegularUserInDb()
    {
        $data = $this->createUser();
        $data['status'] = Users::STATUS_ACTIVE;

        $id = $this->haveInDatabase('users', $data);
        $data['id'] = $id;

        return $data;
    }

    public function haveUserInDb()
    {
        $data = $this->createUser();

        $this->haveInDatabase('users', $data);

        return $data;
    }

    public function registerUser()
    {
        $I = $this;

        $I->amOnPage('/oauth/register/signup');

        $data = [
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'username'  => $this->faker->userName,
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

    public function password()
    {
        return $this->passwd;
    }

    protected function createUser()
    {
        /** @var \Phalcon\Security $security */
        $security = $this->grabServiceFromContainer('security');

        $this->username  = $this->faker->userName;
        $this->firstname = $this->faker->name;
        $this->lastname  = $this->faker->name;
        $this->passwd    = $this->faker->password;
        $this->email     = $this->faker->email;

        return [
            'username'  => $this->username,
            'firstname' => $this->firstname,
            'lastname'  => $this->lastname,
            'email'     => $this->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
            'passwd'    => $security->hash($this->passwd),
        ];
    }
}
