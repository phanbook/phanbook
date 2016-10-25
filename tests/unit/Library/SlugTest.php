<?php

namespace App\Test\Unit\Library;

use App\Test\Module\UnitTest;

class SlugTest extends UnitTest
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

    public function testSlug()
    {
        $slug = $this->di->get('phanbook')->slug();

        foreach ($this->nonAsciiStringProvider() as $value => $expected) {
            $this->assertEquals($expected, $slug->generate($value));
        }
    }
}
