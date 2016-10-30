<?php
/**
 * @var Codeception\Scenario $scenario
 */

$I = new AcceptanceTester($scenario);
$I->wantToTest("See correct 404 message if it is not possible to show the blog post");

$I->amOnPage('/blog/9000000/slug');
$I->seeResponseCodeIs(404);
$I->see("Sorry! We can't seem to find the page you're looking for.");
