<?php


Use Phanbook\Models\Users;

class UsersTest extends TestBase
{



    // tests
    public function testKaram()
    {
        $user = new Users;
        $user->karma = 1000;
        $input = $user->getHumanKarma();

        $this->assertEquals('1.0k', $input);
    }
    public function testValidateReturnsFalseIfDuplicateEmail()
    {
       $user = new Users;
       $user->email = 'hello@phanbook.com';
       $this->assertFalse($user->save(), "New User should not created");
   }
}
