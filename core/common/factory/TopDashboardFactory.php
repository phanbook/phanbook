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
 * This class'll determining which product (analytic dimension) will produce
 */
class TopDashboardFactory extends FactoryMethod
{
    /**
     *
     * @var Phanbook\Google\Analytic object
     */
    private $analyticClient;
    public function setAnalytic($analyticClient)
    {
        $this->analyticClient = $analyticClient;
        $this->analyticClient->setUseBatch(true);
    }
    protected function createObject($dimension)
    {
        switch ($dimension) {
            case "visits":
                return new Visits();
                break;
            case "pageviews":
                return new PageViews();
                break;
            case "timeOnPage":
                return new TimeOnPage();
                break;
            case "bounceRate":
                return new BounceRate();
                break;
            case 'avgSessionDuration':
                return new AvgSessionDuration();
                break;
            default:
                return null;
                break;
        }
    }
    public function create($dimension)
    {
        $obj = $this->createObject($dimension);
        $obj->setAnalytic($this->analyticClient);
        $obj->setDimension($dimension);
        $obj->create();
        return $obj;
    }
    public function executeBatch()
    {
        $result = $this->analyticClient->batchExecute();
        $this->analyticClient->setUseBatch(false);
        return $result;
    }
}
