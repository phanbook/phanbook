<?php
$I = new FunctionalTester($scenario);
$I->wantTo('perform actions and see result');
$I->amOnPage('/login');
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
