<?php
$I = new FunctionalTester($scenario);
$I->wantTo('perform shadow login as first user');
$I->amOnPage('/');
$I->see('log in');
