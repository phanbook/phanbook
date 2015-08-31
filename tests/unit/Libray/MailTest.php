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

        $this->assertEquals(1, $mail->sendTest('hello@phanbook.com'));
        $this->assertEquals('hello@phanbook.com', $mail->getToMailTest('hello@phanbook.com'));
    }
}
