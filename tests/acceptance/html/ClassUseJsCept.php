<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('See all class to use for javascript');
$I->amOnPage('/questions/1/phanbook');

//$I->see('Sign Up With Google');
// $I->click('.iam-subscribe');

// $I->click('.voter');

// //Acept
// $I->click('.iam-accepting');
// $I->click(['data-object' => 'posts']);
// $I->see('Sign Up With Github');
// $I->click('.gitbub-button');
// $I->see('Sign Up With Facebook');
// $I->see('Login');
// $I->submitForm(
//     '#login-form',
//     [
//         'email' => 'Davert',
//         'password' => '123456',
//         'remember' => true
//     ],
//     'Login'
// );


// $I->click('Sign Up With Email');
// $I->fillField('firstname', 'Phanbook');
// $I->fillField('email', 'hello@phanbook.com');
// $I->fillField('username', 'admin');
// $I->click('Sign in');
// $I->seeInDatabase('users', ['email' => 'hello@phanbook.com', 'username' => 'admin']);

