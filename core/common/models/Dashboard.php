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
use Phanbook\Models\Settings;
use Phanbook\Factory\TopDashboardFactory;
use Phanbook\Factory\TopDashboardSubject;

class Dashboard extends ModelBase
{
    private $analytic;
    public function initialize()
    {
        $this->analytic = new Analytic();
    }

    public function getAnalyticObject()
    {
        return $this->analytic;
    }
    /**
     * Get data analytic from google Analytic
     * Using Factory Method pattern to create each of dimensions
     * @return array list of object TopDashboard
     */
    public function getAnalyticData()
    {
        $listTopActivity = Settings::getListTopActivity();
        $objectSubject = new TopDashboardSubject();
        $topDashboardFactory = new TopDashboardFactory();
        $topDashboardFactory->setAnalytic($this->analytic);

        foreach ($listTopActivity as $activity) {
            if ($activity->default == 1) {
                $topDashboardObj = $topDashboardFactory->create($activity->code);
                $objectSubject->attach($topDashboardObj);
            }
        }
        $batchResult = $topDashboardFactory->executeBatch();
        foreach ($batchResult as $objectName => $objectValue) {
            $objectSubject->setKey($objectName);
            $objectSubject->setValue($objectValue['totalsForAllResults']);
            $objectSubject->notify();
        }
        return $objectSubject->getObservers();
    }
}
