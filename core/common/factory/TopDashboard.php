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
/**
 * This class'll declare product (analytic dimension) for TopDashboardFactory
 */
class TopDashboard implements TopDashboardInterface
{
    public $analytic;
    public $numbDate;
    public $analyticValue;
    public $title;
    public $timeRanger;
    public $description;
    public $status;
    public $ratio;
    public $notice;
    public $dimension;

    public function initialize()
    {

    }
    /**
     * Set display warning level in dashboard
     * @param int $type set invert
     */
    public function setNotice($type = 0)
    {
        if ($type == 1) {
            $this->ratio = -$this->ratio;
        }
    }
    public function setDimension($dimension)
    {
        $this->dimension = $dimension;
    }
    public function setAnalytic($analytic)
    {
        $this->analytic = $analytic;
    }
    public function setNumbDate($numbDate)
    {
        $this->numbDate = $numbDate;
        $this->setTimeRanger();
    }
    public function setAnalyticValue($value)
    {
        if ($value && is_numeric($value)) {
            $this->analyticValue = round($value, 2);
        }
    }
    public function setTitle($title)
    {
        $this->title = $title;
    }
    public function setTimeRanger()
    {
        switch ($this->numbDate) {
            case 1:
                $this->timeRanger = "Today";
                break;
            case 30:
                $this->timeRanger = "Last Month";
                break;
            default:
                $this->timeRanger = "Last ".$numbDate." days";
                break;
        }
    }
    public function setDescription($description)
    {
        $this->description = $description;
    }
    public function setStatus($status)
    {
        $this->status = $status;
    }
    /**
     * Check if number is increase or decrease
     * @param percent $ratio
     */
    public function setRatio($valuePrev)
    {
        if ($valuePrev && is_numeric($valuePrev) && $this->analyticValue) {
            $this->ratio = round($this->analyticValue/$valuePrev - 1, 2)*100;
            $this->setStatus(true);
        } else {
            $this->setStatus(false);
        }
        unset($this->analytic);
    }
    public function create()
    {
        // get analytic from now
        $this->analytic->getAnalyticDataFromNow("ga:". $this->dimension, $this->numbDate);
        //get analytic from last ranger time
        $this->analytic->getAnalyticDataFromPrev("ga:". $this->dimension, $this->numbDate);
    }
    public function fixValue()
    {

    }
}
