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

class TopDashboard implements TopDashboardInterface
{
    public $analytic;
    public $numbDate;
    public $analyticValue;
    public $title;
    public $timeRanger;
    public $description;
    public $status;

    public function setAnalytic($analytic)
    {
        $this->analytic = $analytic;
    }
    public function setNumbDate($numbDate)
    {
        $this->numbDate = $numbDate;
    }
    public function setAnalyticValue($value)
    {
        $this->analyticValue = $value;
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
    public function create($dimension)
    {

    }
}
