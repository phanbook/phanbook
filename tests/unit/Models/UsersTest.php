<?php

namespace App\Test\Unit\Models;

use Phanbook\Models\Users;
use App\Test\Module\UnitTest;

class UsersTest extends UnitTest
{
    public function testKarma()
    {
        $user = new Users;
        $user->setKarma(1000);

        $this->assertEquals('1.0k', $user->getHumanKarma());
    }

    public function testValidateReturnsFalseIfDuplicateEmail()
    {
       $user = new Users;
       $user->setEmail('hello@phanbook.com');

       $this->assertFalse($user->save(), "New User should not created");
   }
}
