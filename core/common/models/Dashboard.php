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
        $response = [];
        $topDashboardFactory = new TopDashboardFactory();
        $topDashboardFactory->setAnalytic($this->analytic);
        foreach ($listTopActivity as $activity) {
            if ($activity->default == 1) {
                $response[] = $topDashboardFactory->create($activity->code);
            }
        }
        $batchResult = $topDashboardFactory->executeBatch();
        for ($i=0; $i < count($response); $i++) {
            foreach ($batchResult as $key => $value) {
                /**
                 * Do not change the order of If conditions below
                 * It related to function create in class TopDashboard
                 */
                if ("response-ga:".$response[$i]->dimension."_now" == $key) {
                    $response[$i]->setAnalyticValue($value['rows'][0][0]);
                }
                if ("response-ga:".$response[$i]->dimension."_prev" == $key) {
                    $response[$i]->setRatio($value['rows'][0][0]);
                }
            }
            $response[$i]->fixValue();
        }
        return $response;
    }
}
