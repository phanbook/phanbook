<?php

namespace App\Test\Unit\Models\Services;

use App\Test\Module\UnitTest;
use Phanbook\Models\Settings as Entity;
use Phanbook\Models\Services\Service\Settings;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

class SettingsTest extends UnitTest
{
    /**
     * @test
     * @dataProvider providerValidSettingName
     * @param string $name
     */
    public function shouldFindRequiredSettingEntityFromTheDatabase($name)
    {
        $settingsService = new Settings();

        $this->tester->seeInDatabase('settings', ['name' => $name]);
        $this->assertInstanceOf(Entity::class, $settingsService->findFirstByName($name));
    }

    /**
     * @test
     * @dataProvider providerValidSettingName
     * @param string $name
     */
    public function shouldGetRequiredSettingEntityFromTheDatabase($name)
    {
        $settingsService = new Settings();

        $this->tester->seeInDatabase('settings', ['name' => $name]);
        $this->assertInstanceOf(Entity::class, $settingsService->getFirstByName($name));
    }

    /**
     * @test
     * @dataProvider providerInvalidSettingName
     * @param mixed $name
     */
    public function shouldThrowExpectedExceptionInCaseOfGetNonExistentEntity($name)
    {
        $settingsService = new Settings();

        $this->tester->dontSeeInDatabase('settings', ['name' => $name]);
        $this->tester->expectException(
            new EntityNotFoundException($name, 'name'),
            function () use ($settingsService, $name) {
                $settingsService->getFirstByName($name);
            }
        );
    }

    /**
     * @test
     * @dataProvider providerInvalidSettingName
     * @param mixed $name
     */
    public function shouldReturnNullInCaseOfGetNonExistentEntity($name)
    {
        $settingsService = new Settings();

        $this->tester->dontSeeInDatabase('settings', ['name' => $name]);
        $this->assertNull($settingsService->findFirstByName($name));
    }

    public function shouldGetListOfTopActivity()
    {
        $settingsService = new Settings();
        $activities = $settingsService->getListTopActivity();

        $this->assertTrue(is_array($activities));
        $this->assertNotEmpty($activities);

        foreach ($activities as $activity) {
            $this->assertInstanceOf(\stdClass::class, $activity);
            $this->assertTrue(property_exists($activity, 'code'));
            $this->assertTrue(property_exists($activity, 'name'));
            $this->assertTrue(property_exists($activity, 'default'));
        }
    }

    /** @test */
    public function shouldAlwaysGetListOfTopActivityAsArrayOfObjects()
    {
        $settingsService = new Settings();

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticTopActivities'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticTopActivities']);

        $this->assertTrue(is_array($settingsService->getListTopActivity()));
    }

    /** @test */
    public function shouldFindGoogleAnalyticsAccessToken()
    {
        $settingsService = new Settings();

        $expected = [
            'access_token'  => uniqid(),
            'token_type'    => 'Bearer',
            'expires_in'    => 3600,
            'refresh_token' => uniqid(),
            'created'       => time(),
        ];

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticAccessToken'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticAccessToken']);
        $this->assertFalse($settingsService->hasAccessToken());

        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticAccessToken', 'value' => json_encode($expected)]);
        $this->assertEquals(json_encode($expected), $settingsService->findAccessToken());
        $this->assertTrue($settingsService->hasAccessToken());
    }

    /** @test */
    public function shouldSetGoogleAnalyticsAccessToken()
    {
        $settingsService = new Settings();

        $expected = [
            'access_token'  => uniqid(),
            'token_type'    => 'Bearer',
            'expires_in'    => 3600,
            'refresh_token' => uniqid(),
            'created'       => time(),
        ];

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticAccessToken'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticAccessToken']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticAccessToken', 'value' => '']);

        $this->assertTrue($settingsService->setAccessToken(json_encode($expected)));
        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticAccessToken', 'value' => json_encode($expected)]);
    }

    /** @test */
    public function shouldFindGoogleAnalyticsRefreshToken()
    {
        $settingsService = new Settings();

        $expected = uniqid();

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticRefreshToken'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticRefreshToken']);

        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticRefreshToken', 'value' => $expected]);
        $this->assertEquals($expected, $settingsService->findRefreshToken());
    }

    /** @test */
    public function shouldSetGoogleAnalyticsRefreshToken()
    {
        $settingsService = new Settings();

        $expected = uniqid();

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticRefreshToken'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticRefreshToken']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticRefreshToken', 'value' => '']);

        $this->assertTrue($settingsService->setRefreshToken($expected));
        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticRefreshToken', 'value' => $expected]);
    }

    /** @test */
    public function shouldFindGoogleAnalyticsProfileId()
    {
        $settingsService = new Settings();

        $expected = mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticProfileId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticProfileId']);

        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticProfileId', 'value' => $expected]);
        $this->assertEquals($expected, $settingsService->findAnalyticProfileID());
    }

    /** @test */
    public function shouldSetGoogleAnalyticsProfileId()
    {
        $settingsService = new Settings();

        $expected = mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticProfileId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticProfileId']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticProfileId', 'value' => '']);

        $this->assertTrue($settingsService->setAnalyticProfileID($expected));
        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticProfileId', 'value' => $expected]);
    }

    /** @test */
    public function shouldFindGoogleAnalyticsTrackingId()
    {
        $settingsService = new Settings();

        $expected = 'UA-' . mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticTrackingId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticTrackingId']);

        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticTrackingId', 'value' => $expected]);
        $this->assertEquals($expected, $settingsService->findAnalyticTrackingID());
    }

    /** @test */
    public function shouldSetGoogleAnalyticsTrackingId()
    {
        $settingsService = new Settings();

        $expected = 'UA-' . mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticTrackingId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticTrackingId']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticTrackingId', 'value' => '']);

        $this->assertTrue($settingsService->setAnalyticTrackingID($expected));
        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticTrackingId', 'value' => $expected]);
    }

    /** @test */
    public function shouldFindGoogleAnalyticsAccountId()
    {
        $settingsService = new Settings();

        $expected = mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticAccountId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticAccountId']);

        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticAccountId', 'value' => $expected]);
        $this->assertEquals($expected, $settingsService->findAnalyticAccountID());
    }

    /** @test */
    public function shouldSetGoogleAnalyticsAccountId()
    {
        $settingsService = new Settings();

        $expected = mt_rand(1, 100000000);

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticAccountId'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticAccountId']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticAccountId', 'value' => '']);

        $this->assertTrue($settingsService->setAnalyticAccountID($expected));
        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticAccountId', 'value' => $expected]);
    }

    /** @test */
    public function shouldSetGoogleAnalyticsTopActivity()
    {
        $settingsService = new Settings();

        $topActivity = [
            [
                'code'    => 'pageviews',
                'name'    => 'Total Page Views',
                'default' => 1,
            ],
            [
                'code'    => 'visits',
                'name'    => 'Total Visits',
                'default' => 1,
            ],
            [
                'code'    => 'timeOnPage',
                'name'    => 'Total Time On Page',
                'default' => 1,
            ],
            [
                'code'    => 'bounceRate',
                'name'    => 'Bounce Rate',
                'default' => 1,
            ],
        ];

        $this->tester->getApplication()->db->delete('settings', "`name` = 'googleAnalyticTopActivities'");
        $this->tester->dontSeeInDatabase('settings', ['name' => 'googleAnalyticTopActivities']);
        $this->tester->haveInDatabase('settings', ['name' => 'googleAnalyticTopActivities', 'value' => json_encode($topActivity)]);

        $new = [
            'pageviews',
        ];

        $this->assertTrue($settingsService->setListTopActivity($new));
        $actualActivity = [
            [
                'code'    => 'pageviews',
                'name'    => 'Total Page Views',
                'default' => 1,
            ],
            [
                'code'    => 'visits',
                'name'    => 'Total Visits',
                'default' => 0,
            ],
            [
                'code'    => 'timeOnPage',
                'name'    => 'Total Time On Page',
                'default' => 0,
            ],
            [
                'code'    => 'bounceRate',
                'name'    => 'Bounce Rate',
                'default' => 0,
            ],
        ];

        $this->tester->seeInDatabase('settings', ['name' => 'googleAnalyticTopActivities', 'value' => json_encode($actualActivity)]);

    }

    public function providerValidSettingName()
    {
        return [
            'Access Token'   => ['googleAnalyticAccessToken'],
            'Refresh Token'  => ['googleAnalyticRefreshToken'],
            'Profile Id'     => ['googleAnalyticProfileId'],
            'Account Id'     => ['googleAnalyticAccountId'],
            'Tracking Id'    => ['googleAnalyticTrackingId'],
            'Top Activities' => ['googleAnalyticTopActivities'],
        ];
    }

    public function providerInvalidSettingName()
    {
        return [
            [''],
            [null],
            [1],
            ['some-word'],
            ['another word'],
            ['*'],
        ];
    }
}
