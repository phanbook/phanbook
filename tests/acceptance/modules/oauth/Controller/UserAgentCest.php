<?php

use Step\Acceptance\RegularUser;

class UserAgentCest
{
    /**
     * @issue 107
     * @param RegularUser $I
     */
    function showWelcome(RegularUser $I)
    {
        $I->wantTo('login with long user agent');

        $I->haveRegularUserInDb();
        $I->loginUser();
        $I->seeResponseCodeIs(200);
        $I->see('Welcome back');
    }
}
