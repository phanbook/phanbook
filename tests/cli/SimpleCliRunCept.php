<?php
/**
 * @var Codeception\Scenario $scenario
 */

$I = new CliTester($scenario);
$I->wantToTest('execute simple cli task');
$I->runShellCommand('php cli Tests test1');
$I->seeInShellOutput('Hello World!');
