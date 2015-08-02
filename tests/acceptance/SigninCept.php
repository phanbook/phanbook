<?php
$I = new AcceptanceTester($scenario);
$I->wantTo('perform actions and see result');
$I->wantTo('sign in');
$I->amOnPage('/login');
$I->see('/login');
//$I->click('log in');
$I->see('news');