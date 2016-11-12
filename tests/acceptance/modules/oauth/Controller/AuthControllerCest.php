<?php

use Step\Acceptance\RegularUser;

class AuthControllerCest
{
    public function showWelcome(RegularUser $I)
    {
        $I->wantTo('login as regular user and see welcome text');

        $I->haveRegularUserInDb();
        $I->loginUser();
        $I->seeResponseCodeIs(200);
        $I->see('Welcome back');
    }

    public function loginAsInactiveUser(RegularUser $I)
    {
        $I->wantTo('login as inactive regular user and see inactive text');

        $I->haveUserInDb();
        $I->loginUser();
        $I->seeResponseCodeIs(422);
        $I->see('The user is inactive');
    }
}
