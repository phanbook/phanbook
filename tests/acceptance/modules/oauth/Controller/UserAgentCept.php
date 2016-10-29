<?php
/**
 * @issue 107
 * @var   Codeception\Scenario $scenario
 */

$I = new AcceptanceTester($scenario);
$I->wantToTest('auth with long user agent');

$I->amOnPage('/oauth/login');

$I->haveUserAgent(str_repeat('a', 10000));
$I->setHeader('X-Requested-With', 'Codeception');

$I->fillField('email', 'admin');
$I->fillField('password', 'phanbook');
$I->checkOption('#remember-me');
$I->click('Sign In');

$I->seeResponseCodeIs(200);
$I->see('Welcome back Admin');
