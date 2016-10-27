<?php
/**
 * @issue 81
 * @var   Codeception\Scenario $scenario
 */

use Step\Functional\PostReply as ReplyTester;

$I = new ReplyTester($scenario);
$I->wantToTest('see post replies');

$userId = $I->haveUser();
$postId = $I->havePost(['usersId' => $userId]);

$userId = $I->haveUser();
$I->haveReply(['postsId' => $postId, 'usersId' => $userId]);

$userId = $I->haveUser();
$I->haveReply(['postsId' => $postId, 'usersId' => $userId]);

$I->amOnPage("/questions/{$postId}/slug");
$I->see('Answers ( 2 )');
