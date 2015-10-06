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
namespace Phanbook\Models;
use Phanbook\Google\Analytic;

/**
*   class FactoryMethod
*/
abstract class TopDashboardFactoryMethod
{
    const Visits = "visits";
    const PageViews = "pageviews";
    const TimeOnPage = "timeOnPage";

    abstract protected function createTopDashboard($dimension);

    public function create($dimension)
    {
        $obj = $this->createTopDashboard($dimension);
        $obj->setAnalytic(new Analytic());
        $obj->create($dimension);
        return $obj;
    }
}

class TopDashboardFactory extends TopDashboardFactoryMethod
{
    protected function createTopDashboard($dimension)
    {
        switch ($dimension) {
            case parent::Visits:
                return new Visits();
                break;
            case parent::PageViews:
                return new PageViews();
                break;
            case parent::TimeOnPage:
                return new TimeOnPage();
                break;
            default:
                return null;
                break;
        }
    }
}

interface TopDashboardInterface
{
    public function setAnalytic($analytic);
    public function setNumbDate($numbDate);
    public function setAnalyticValue($value);
    public function setTitle($title);
    public function setTimeRanger();
    public function setDescription($description);
    public function setStatus($status);
    public function create($dimension);
}

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

class Visits extends TopDashboard
{
    public function create($dimension)
    {
        $this->setNumbDate(1);
        $this->setTimeRanger();
        $this->setTitle("Visits");
        $this->setDescription("Total Visits");
        $temp = $this->analytic->getAnalyticData("ga:". $dimension, $this->numbDate);
        if ($temp != false) {
            $this->setAnalyticValue($temp[0]);
            $this->setStatus(true);
        } else {
            $this->setStatus(false);
        }
    }
}

class PageViews extends TopDashboard
{
    public function create($dimension)
    {
        $this->setNumbDate(30);
        $this->setTimeRanger();
        $this->setTitle("Page Views");
        $this->setDescription("Total Page Views");
        $temp = $this->analytic->getAnalyticData("ga:". $dimension, $this->numbDate);
        if ($temp != false) {
            $this->setAnalyticValue($temp[0]);
            $this->setStatus(true);
        } else {
            $this->setStatus(false);
        }
    }
}

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







