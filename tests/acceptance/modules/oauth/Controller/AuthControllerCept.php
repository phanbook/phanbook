<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('add a new user and see it in database');
$I->amOnPage('/oauth/login');

$I->see('Sign Up With Google');
$I->click('.google-button');
$I->see('Sign Up With Github');
$I->click('.gitbub-button');
$I->see('Sign Up With Facebook');
$I->see('Login');
$I->submitForm(
    '#login-form',
    [
        'email' => 'Davert',
        'password' => '123456',
        'remember' => true
    ],
    'Login'
);


$I->click('Sign Up With Email');
$I->fillField('firstname', 'Phanbook');
$I->fillField('email', 'hello@phanbook.com');
$I->fillField('username', 'admin');
$I->click('Sign in');
$I->seeInDatabase('users', ['email' => 'hello@phanbook.com', 'username' => 'admin']);

