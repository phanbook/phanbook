<?php
/**
 * @var Codeception\Scenario $scenario
 */

$I = new CliTester($scenario);
$I->wantToTest('execute cli task with params');
$I->runShellCommand('php cli Tests test2 foo bar');

$I->seeInShellOutput('First param: foo');
$I->seeInShellOutput('Second param: bar');
