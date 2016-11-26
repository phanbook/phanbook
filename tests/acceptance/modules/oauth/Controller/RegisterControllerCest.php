<?php

use Step\Acceptance\RegularUser;

class RegisterControllerCest
{
    public function registerNewMember(RegularUser $I)
    {
        $I->wantTo('register new membership and see user in the database');

        $data = $I->registerUser();
        $I->seeResponseCodeIs(200);
        $I->see('Your account was successfully created. An email was sent to your address in order to continue the process.');
        $I->seeInDatabase('users', $data);
    }
}
