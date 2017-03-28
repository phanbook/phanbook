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
namespace Phanbook\Models;

use Phanbook\Google\Analytic;
use Phanbook\Factory\TopDashboardFactory;
use Phanbook\Factory\TopDashboardSubject;
use Phanbook\Models\Services\Service;

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
        $settingsService = new Service\Settings();

        $listTopActivity = $settingsService->getListTopActivity();
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
