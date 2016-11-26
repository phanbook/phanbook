<?php

namespace App\Test\Unit\Library\Filters;

use Phalcon\Filter;
use App\Test\Module\UnitTest;
use Phanbook\Common\Library\Filters\YesNoFilter;

class YesNoFilterTest extends UnitTest
{
    /**
     * @test
     * @dataProvider providerFragments
     * @param mixed $word
     * @param string $expected
     */
    public function shouldValidateYesOrNo($word, $expected)
    {
        $filter = new Filter();
        $filter->add('yes_no', new YesNoFilter());

        $actual = $filter->sanitize($word, 'yes_no');
        $this->assertEquals($expected, $actual);
    }

    public function providerFragments()
    {
        return [
            ['Y', 'Y'],
            ['N', 'N'],
            ['Z', ''],
            ['YesNoFilterTest', 'Y'],
            ['NoYesFilterTest', 'N'],
            [false, ''],
            [1, ''],
            ['1', ''],
            ['y', ''],
            ['n', ''],
            ['', ''],
            ['"Y"', 'Y'],
            ['"N"', 'N'],
        ];
    }
}
