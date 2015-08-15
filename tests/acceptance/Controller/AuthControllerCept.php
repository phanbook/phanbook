<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('add a new user and see it in database');
$I->amOnPage('/login');
$I->click('Sign Up With Email');
$I->fillField('firstname', 'Phanbook');
$I->fillField('email', 'hello@phanbook.com');
$I->fillField('username', 'admin');
$I->click('Sign in');
$I->seeInDatabase('users', ['email' => 'hello@phanbook.com', 'username' => 'admin']);

