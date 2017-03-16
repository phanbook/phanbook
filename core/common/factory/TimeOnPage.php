<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Factory;

class TimeOnPage extends TopDashboard
{
    /**
     * Override function create
     * Change special detail for each dimension
     * @return mixed
     */
    public function create()
    {
        $this->setNumbDate(1);
        $this->setDescription("Total Time On Page");
        parent::create();
    }
    public function fixValue()
    {
        $this->convertToTime();
    }
}
