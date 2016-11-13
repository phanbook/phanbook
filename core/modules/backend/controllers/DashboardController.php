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
namespace Phanbook\Backend\Controllers;

use Phanbook\Models\Dashboard;
use Phanbook\Backend\Forms\DashboardForm;

/**
 * \Phanbook\Backend\Controllers\DashboardController
 *
 * @package Phanbook\Blog\Controllers
 */
class DashboardController extends ControllerBase
{
    /**
     * @var \Phanbook\Google\Analytic
     */
    private $analytic;
    /**
     * @var \Phanbook\Models\Dashboard
     */
    private $model;

    public function initialize()
    {
        $this->model = new Dashboard();
        $this->analytic = $this->model->getAnalyticObject();
    }

    /**
     * Dashboard index.
     */
    public function indexAction()
    {
        $isLogged = false;

        try {
            // We check if user authorization
            if ($this->analytic->checkAccessToken()) {
                $isLogged = true;
                $this->view->setVars([
                    'analyticTopActivity' => $this->model->getAnalyticData(),
                    'analyticData'        => true,
                ]);
            }
        } catch (\Google_Exception $e) {
            // Skip Google errors
            $this->logger->error(
                sprintf('%s:%s: %s', __FILE__, __LINE__, $e->getMessage())
            );
        }

        $this->tag->setTitle(t('Dashboard'));

        $this->view->setVars([
            'form'     => new DashboardForm(),
            'isLogged' => $isLogged,
        ]);
    }
}
