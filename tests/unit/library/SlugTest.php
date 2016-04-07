<?php

require_once 'TestBase.php';

class SlugTest extends TestBase
{

    public function nonAsciiStringProvider()
    {
        return [
            "Phålcón" => 'phalcon',
            "I ♥ Phålcón\021" => 'i-phalcon',
            "ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÑÒÓÔÕÖÙÚÛÜÝßàáâãäåæçèéêëìíîïñòóôõöùúûüýÿ" => 'aaaaaaaeceeeeiiiinooooouuuuyssaaaaaaaeceeeeiiiinooooouuuuyy',
            "Giải thiết kế giao diện người dùng cho Phanbook" => 'giai-thiet-ke-giao-dien-nguoi-dung-cho-phanbook'
        ];
    }
    // tests
    public function testSlug()
    {
        $slug = $this->di->get('phanbook')->slug();

        foreach ($this->nonAsciiStringProvider() as $value => $expected) {
            $this->assertEquals($expected, $slug->generate($value));

        }
    }
}
