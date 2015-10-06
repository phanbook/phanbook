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

    public function getAnalyticData()
    {
        $listTopActivity = Settings::getListTopActivity();
        $response = [];
        $topDashboardFactory = new TopDashboardFactory();
        foreach ($listTopActivity as $activity) {
            if ($activity->default == 1) {
                $temp = $topDashboardFactory->create($activity->code);
                if ($temp->status) {
                    $response[] = $temp;
                }
            }
        }
        return $response;
    }
}
