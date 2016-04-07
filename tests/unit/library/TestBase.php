<?php

class TestBase extends \Codeception\TestCase\Test
{

    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
        $this->di= $this->getModule('Phalcon2')->di;

    }

    protected function _after()
    {

    }
}
