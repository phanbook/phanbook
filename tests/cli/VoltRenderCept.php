<?php
/**
 * @var Codeception\Scenario $scenario
 */

$I = new CliTester($scenario);
$I->wantToTest('render simple mail using Volt Engine');
$I->runShellCommand('php cli Tests render');
$I->seeInShellOutput('This is a test email. @' . date('Y') . ' Phanbook v1');
