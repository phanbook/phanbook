<?php
/**
 * @issue 101
 * @var   Codeception\Scenario $scenario
 */

use Step\Functional\UserProfile as ProfileTester;

$I = new ProfileTester($scenario);
$I->wantToTest('edit user profile');

$email = uniqid() . '@' . uniqid() . '.com';

$id = $I->regularUser();
$I->amOnProfile();
$I->fillEmail($email);
$I->clickUpdate();
$I->seeInDatabase('users', ['id' => $id, 'email' => $email]);
