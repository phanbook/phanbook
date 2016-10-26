<?php

namespace App\Test\Unit\Library;

use App\Test\Module\UnitTest;

class MailTest extends UnitTest
{
    public function testMail()
    {
        $mail = $this->di->get('mail');

        //it work if a config mail is correct, to do search free email smtp for that
        //$this->assertEquals(1, $mail->sendTest('hello@phanbook.com'));
        $this->assertEquals('hello@phanbook.com', $mail->getToMailTest('hello@phanbook.com'));
    }

    public function testRender()
    {
        $this->markTestSkipped('This test need to refactor');

        $mail       = $this->di->get('mail');
        $expected   = 'This is a test email.';
        $ouput      = exec('php cli Tests render');
        echo $ouput;

        $this->assertContains($expected, ob_get_clean());
    }
}
