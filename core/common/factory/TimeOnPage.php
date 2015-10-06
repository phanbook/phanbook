<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Factory;

class TimeOnPage extends TopDashboard
{
    public function create($dimension)
    {
        $this->setNumbDate(30);
        $this->setTimeRanger();
        $this->setTitle("Time On Page");
        $this->setDescription("Total Time On Page");
        $temp = $this->analytic->getAnalyticData("ga:". $dimension, $this->numbDate);
        if ($temp != false) {
            $this->setAnalyticValue($temp[0]);
            $this->setStatus(true);
        } else {
            $this->setStatus(false);
        }
    }
}
