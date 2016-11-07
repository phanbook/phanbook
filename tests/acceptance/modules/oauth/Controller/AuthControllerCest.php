<?php

use Step\Acceptance\RegularUser;

class AuthControllerCest
{
    function showWelcome(RegularUser $I)
    {
        $I->wantTo('login as regular user and see welcome text');

        $I->haveUserInDb();
        $I->loginUser();
        $I->see('Welcome back');
    }
}
