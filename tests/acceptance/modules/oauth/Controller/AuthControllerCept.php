<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('add a new user and see it in database');
$I->amOnPage('/oauth/login');

$I->see('Sign In');
$I->submitForm(
    '#login-form',
    [
        'email' => 'Davert@gmail.com',
        'password' => '123456',
        'remember' => true
    ],
    'Sign In'
);


$I->amOnPage('/oauth/register/signup');

$I->fillField('firstname', 'Phanbook');
$I->fillField('email', 'hello@phanbook.com');
$I->fillField('username', 'admin');
$I->click('Sign in');
$I->seeInDatabase('users', ['email' => 'hello@phanbook.com', 'username' => 'admin']);

