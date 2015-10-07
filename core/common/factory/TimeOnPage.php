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
    /**
     * Override function create
     * Change special detail for each dimension
     * @param  string $dimension dimension to get metrics
     * @return
     */
    public function create()
    {
        $this->setNumbDate(1);
        $this->setTitle("Time On Page");
        $this->setDescription("Total Time On Page");
        parent::create();
    }
    public function fixValue()
    {
        $this->analyticValue = $this->secondsToTime($this->analyticValue);
    }
    /**
     * Convert seconds to time string
     * @param  int $s seconds
     * @return string    Time string
     */
    private function secondsToTime($s)
    {
        $h = floor($s / 3600);
        $s -= $h * 3600;
        $m = floor($s / 60);
        $s -= $m * 60;
        return $h.':'.sprintf('%02d', $m).':'.sprintf('%02d', $s);
    }
}
