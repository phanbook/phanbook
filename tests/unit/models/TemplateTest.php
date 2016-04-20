<?php


Use Phanbook\Models\Template;

class TemplateTest extends TestBase
{



    // tests
    public function testManageFileTrue()
    {
        $template = new Template;
        $dir = $template->manageFile(true);
        $this->assertTrue($dir);
    }
}
