<?php
/**
 * @var Codeception\Scenario $scenario
 */

use Step\Functional\UserProfile as ProfileTester;

$I = new ProfileTester($scenario);
$I->wantToTest('edit user settings');

$id = $I->regularUser();
$I->amOnSettings();
$I->selectOption('form input[name=digest]', 'N');
$I->clickSave();
$I->seeInDatabase('users', ['id' => $id, 'digest' => 'N']);
