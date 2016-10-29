<?php

namespace App\Test\Unit;

use App\Test\Module\UnitTest;

class HelpersTest extends UnitTest
{
    public function testAppPath()
    {
        $this->assertEquals(ROOT_DIR, app_path());
        $this->assertEquals(ROOT_DIR . DIRECTORY_SEPARATOR . 'foo', app_path('foo'));
        $this->assertEquals(ROOT_DIR . DIRECTORY_SEPARATOR . 'bar/', app_path('bar/'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('index.php', 'public');
    }

    public function testConfigPath()
    {
        $base = ROOT_DIR . DIRECTORY_SEPARATOR . 'core' . DIRECTORY_SEPARATOR . 'config';
        $this->assertEquals($base, config_path());
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'foo', config_path('foo'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/', config_path('bar/'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('core' . DIRECTORY_SEPARATOR . 'config');
    }

    public function testContentPath()
    {
        $base = ROOT_DIR . DIRECTORY_SEPARATOR . 'content';
        $this->assertEquals($base, content_path());
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'foo', content_path('foo'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/', content_path('bar/'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('content');
    }

    public function testThemesPath()
    {
        $base = ROOT_DIR . DIRECTORY_SEPARATOR . 'content' . DIRECTORY_SEPARATOR . 'themes';
        $this->assertEquals($base, themes_path());
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'foo', themes_path('foo'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/', themes_path('bar/'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/info.php', themes_path('bar/info.php'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('content' . DIRECTORY_SEPARATOR . 'themes');
    }

    public function testModulesPath()
    {
        $base = ROOT_DIR . DIRECTORY_SEPARATOR . 'core' . DIRECTORY_SEPARATOR . 'modules';
        $this->assertEquals($base, modules_path());
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'foo', modules_path('foo'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/', modules_path('bar/'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/Backend', modules_path('bar/Backend'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('core' . DIRECTORY_SEPARATOR . 'modules');
    }

    public function testLogsPath()
    {
        $base = ROOT_DIR . DIRECTORY_SEPARATOR . 'content' . DIRECTORY_SEPARATOR . 'logs';
        $this->assertEquals($base, logs_path());
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'foo', logs_path('foo'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/', logs_path('bar/'));
        $this->assertEquals($base . DIRECTORY_SEPARATOR . 'bar/baz.log', logs_path('bar/baz.log'));
        $this->tester->amInPath(app_path());
        $this->tester->seeFileFound('content' . DIRECTORY_SEPARATOR . 'logs');
    }
}
