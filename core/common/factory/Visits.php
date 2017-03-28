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

class Visits extends TopDashboard
{
    public function create()
    {
        $this->setNumbDate(1);
        $this->setTitle("Visits");
        $this->setDescription("Total Visits");
        parent::create();
    }
}
