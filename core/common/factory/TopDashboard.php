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

use Phanbook\Models\Settings;

/**
 * This class'll declare product (analytic dimension) for TopDashboardFactory
 */
class TopDashboard implements TopDashboardInterface
{
    /**
     * @var Phanbook\Google\Analytic object
     */
    public $analytic;

    /**
     * @var integer
     */
    public $numbDate;

    /**
     * @var mixed
     */
    public $analyticValue;

    /**
     * @var string
     */
    public $title;

    /**
     *
     * @var string
     */
    public $timeRanger;

    /**
     *
     * @var string
     */
    public $description;

    /**
     *
     * @var boolean
     */
    public $status;

    /**
     *
     * @var float
     */
    public $ratio;

    /**
     *
     * @var google dimension
     */
    public $dimension;

    /**
     *
     * @var mixed
     */
    public $analyticPrevValue;

    public function initialize()
    {

    }
    /**
     * Set invert display warning level in dashboard
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
        $topActivities = Settings::getListTopActivity();
        foreach ($topActivities as $activity) {
            if ($activity->code == $this->dimension) {
                $this->setTitle($activity->name);
            }
        }
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
        if (is_numeric($value)) {
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
     * Check if main value is increase or decrease
     * If ratio > 0, main value's increase. Otherwise, main value's decrease
     */
    public function setRatio()
    {
        if (is_numeric($this->analyticPrevValue) && is_numeric($this->analyticValue)) {
            $this->ratio = round($this->analyticValue/$this->analyticPrevValue - 1, 2)*100;
            $this->setStatus(true);
        } else {
            $this->setStatus(false);
        }
        unset($this->analytic);
    }
    public function setAnalyticPrevValue($prevValue)
    {
        if (is_numeric($prevValue)) {
            $this->analyticPrevValue = $prevValue;
        }
    }
    /**
     * [create description]
     * @return [type] [description]
     */
    public function create()
    {
        // get analytic from now
        $this->analytic->getAnalyticDataFromNow("ga:". $this->dimension, $this->numbDate, "_now");
        //get analytic from last ranger time
        $this->analytic->getAnalyticDataFromPrev("ga:". $this->dimension, $this->numbDate, "_prev");
    }
    public function update(AbstractSubject $subject)
    {
        if ($subject->compareKey("response-ga:".$this->dimension."_now") || $subject->compareKey("response-ga:".$this->dimension."_prev")) {
            if ($subject->compareKey("response-ga:".$this->dimension."_now")) {
                $this->setAnalyticValue($subject->getValue()['ga:'.$this->dimension]);
            } else {
                $this->setAnalyticPrevValue($subject->getValue()['ga:'.$this->dimension]);
            }
            if (is_numeric($this->analyticValue) && is_numeric($this->analyticPrevValue)) {
                $this->setRatio();
                $this->fixValue();
            }
        }
    }
    public function fixValue()
    {
    }
    /**
     * Convert seconds to time string
     * @param  int $s seconds
     * @return string    Time string
     */
    protected function convertToTime()
    {
        $s = $this->analyticValue;
        $h = floor($s / 3600);
        $s -= $h * 3600;
        $m = floor($s / 60);
        $s -= $m * 60;
        $this->analyticValue = $h.':'.sprintf('%02d', $m).':'.sprintf('%02d', $s);
    }
}
