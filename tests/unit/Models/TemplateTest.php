<?php

namespace App\Test\Unit\Models;

use Phanbook\Models\Template;
use App\Test\Module\UnitTest;

class TemplateTest extends UnitTest
{
    public function testManageFileTrue()
    {
        $template = new Template;

        $this->assertTrue($template->manageFile(true));
    }
}
