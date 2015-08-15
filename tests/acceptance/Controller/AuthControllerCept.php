<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('add a new user and see it in database');
$I->amOnPage('/login');
$I->click('Sign Up With Email');
$I->fillField('firstname', 'Phanbook');
$I->fillField('email', 'phanbook@phanbook.com');
$I->fillField('username', 'phanbook');
$I->click('Sign in');
$I->seeInDatabase('users', ['email' => 'phanbook@phanbook.com', 'username' => 'phanbook']);

