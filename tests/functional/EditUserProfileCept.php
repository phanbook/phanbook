<?php
/**
 * @issue 101
 * @var   Codeception\Scenario $scenario
 */

use Step\Functional\UserProfile as ProfileTester;

$I = new ProfileTester($scenario);
$I->wantToTest('edit user profile');

$_SERVER['REMOTE_ADDR'] = '127.0.0.1';

$id = $I->regularUser();
$I->amOnProfile();
$I->fillEmail('serghei@phalconphp.com');
$I->clickUpdate();
$I->seeInDatabase('users', ['id' => $id, 'email' => 'serghei@phalconphp.com']);
