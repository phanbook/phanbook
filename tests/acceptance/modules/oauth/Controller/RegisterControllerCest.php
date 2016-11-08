<?php

use Step\Acceptance\RegularUser;

class RegisterControllerCest
{
    public function registerNewMember(RegularUser $I)
    {
        $I->wantTo('register new membership and see user in the database');

        $data = $I->registerUser();
        $I->seeInDatabase('users', $data);
    }
}
