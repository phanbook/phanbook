<?php

namespace Step\Functional;

use Codeception\Scenario;
use Phanbook\Models\Users;
use Faker\Factory as Faker;

class UserProfile extends \FunctionalTester
{
    protected $url = '/users/profile';
    protected $faker;

    public function __construct(Scenario $scenario)
    {
        parent::__construct($scenario);

        $this->faker = Faker::create();
    }

    public function regularUser()
    {
        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
            'status'    => Users::STATUS_ACTIVE,
            'passwd'    => $this->faker->password,
        ];

        $I  = $this;
        $id = $I->haveRecord(Users::class, $data);

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

        return $id;
    }

    public function amOnProfile()
    {
        $I = $this;

        $I->amOnPage($this->url);
    }

    public function amOnSettings()
    {
        $I = $this;

        $I->amOnPage('/users/setting');
    }

    public function fillEmail($email)
    {
        $I = $this;

        $I->fillField('email', $email);
    }

    public function clickUpdate()
    {
        $I = $this;

        $I->click('Update');
    }

    public function clickSave()
    {
        $I = $this;

        $I->click('Save');
    }
}
