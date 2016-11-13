<?php

use Step\Acceptance\RegularUser;

class AuthControllerCest
{
    public function showWelcome(RegularUser $I)
    {
        $I->wantTo('login as regular user and see welcome text');

        $data = $I->haveRegularUserInDb();

        $I->dropFromDatabase('successLogins', ['usersId' => $data['id']]);
        $I->dontSeeInDatabase('successLogins', ['usersId' => $data['id']]);

        $I->loginUser();
        $I->seeResponseCodeIs(200);
        $I->see('Welcome back');

        $I->seeInDatabase('successLogins', ['usersId' => $data['id']]);
    }

    public function loginAsInactiveUser(RegularUser $I)
    {
        $I->wantTo('login as inactive regular user and see inactive text');

        $I->haveUserInDb();
        $I->loginUser();
        $I->seeResponseCodeIs(422);
        $I->see('The user is inactive');
    }

    public function loginWithIncorrectEmail(RegularUser $I)
    {
        $I->wantTo('login with invalid email and detect login throttling');

        $I->haveUserInDb();

        $I->amOnPage('/oauth/login');
        $I->see('Sign In');
        $I->fillField('email', uniqid() . '@' . uniqid());
        $I->fillField('password', $I->password());

        $I->dropFromDatabase('failedLogins', ['ipAddress' => 2130706433]);
        $I->dontSeeInDatabase('failedLogins', ['ipAddress' => 2130706433]);

        $I->click('Sign In');

        $I->seeResponseCodeIs(422);
        $I->see('Wrong email/password combination');

        $I->seeInDatabase('failedLogins', ['ipAddress' => 2130706433]);
    }

    public function loginWithIncorrectPassword(RegularUser $I)
    {
        $I->wantTo('login with invalid password and detect login throttling');

        $user = $I->haveUserInDb();

        $I->amOnPage('/oauth/login');
        $I->see('Sign In');
        $I->fillField('email', $user['email']);
        $I->fillField('password', uniqid());

        $I->dropFromDatabase('failedLogins', ['ipAddress' => 2130706433]);
        $I->dontSeeInDatabase('failedLogins', ['ipAddress' => 2130706433]);

        $I->click('Sign In');

        $I->seeResponseCodeIs(422);
        $I->see('Wrong email/password combination');

        $I->seeInDatabase('failedLogins', ['ipAddress' => 2130706433]);
    }
}
