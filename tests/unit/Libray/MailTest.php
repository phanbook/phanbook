<?php
namespace Libray;


class MailTest extends \Codeception\TestCase\Test
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

    // tests
    public function testMail()
    {
        $mail = $this->di->get('mail');

        //it work if a config mail is correct, to do search free email smtp for that
        //$this->assertEquals(1, $mail->sendTest('hello@phanbook.com'));
        $this->assertEquals('hello@phanbook.com', $mail->getToMailTest('hello@phanbook.com'));
    }
}
