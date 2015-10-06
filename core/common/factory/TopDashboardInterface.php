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
