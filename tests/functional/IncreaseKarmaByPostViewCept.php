<?php
/**
 * @var Codeception\Scenario $scenario
 */

use Phanbook\Models\Karma;
use Step\Functional\PostView as PostViewTester;

$I = new PostViewTester($scenario);
$I->wantToTest('see blog post and increase karma');

$authorId  = $I->haveAuthor();
$postId    = $I->haveBlogPost($authorId);
$visitorId = $I->haveRegularUser();
$ipAddress = $I->haveClientIp();

$I->dontSeeInDatabase('postsViews', ['postsId' => $postId, 'ipaddress' => $ipAddress]);

$I->amOnPage("/blog/{$postId}/slug");

$newAuthorKarma  = $I::DEFAULT_KARMA + Karma::INITIAL_KARMA + Karma::VISIT_ON_MY_POST;
$newVisitorKarma = $I::DEFAULT_KARMA + Karma::INITIAL_KARMA + Karma::VISIT_POST;

$I->seeInDatabase('users', ['id' => $authorId, 'karma' => $newAuthorKarma]);
$I->seeInDatabase('users', ['id' => $visitorId, 'karma' => $newVisitorKarma]);

$I->seeInDatabase('postsViews', ['postsId' => $postId, 'ipaddress' => $ipAddress]);
