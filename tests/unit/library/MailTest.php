<?php

require_once 'TestBase.php';

class MailTest extends TestBase
{

    // tests
    public function testMail()
    {
        $mail = $this->di->get('mail');

        //it work if a config mail is correct, to do search free email smtp for that
        //$this->assertEquals(1, $mail->sendTest('hello@phanbook.com'));
        $this->assertEquals('hello@phanbook.com', $mail->getToMailTest('hello@phanbook.com'));
    }
    public function testRender()
    {
        $mail       = $this->di->get('mail');
        $expected   = 'This is a test email.';
        $ouput      = exec('php cli Tests render');
        echo $ouput;
        $this->assertContains($expected, ob_get_clean());
    }
}
