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
    /**
     * Set object Phanbook\Google\Analytic to target class
     * @param Analytic $analytic analytic object
     */
    public function setAnalytic($analytic);
    /**
     * Set ranger date to get dimension from google analytic
     * @param int $numbDate number date (days)
     */
    public function setNumbDate($numbDate);
    /**
     * Set main value to target class
     * @param mixed $value
     */
    public function setAnalyticValue($value);
    /**
     * Set title will display in box on top of dashboard
     * @param string $title title of main value
     */
    public function setTitle($title);
    /**
     * Set time ranger (string) base on setNumbDate
     */
    public function setTimeRanger();
    /**
     * Description of main value
     * @param string $description
     */
    public function setDescription($description);
    /**
     * Status of target class
     * @param boolean $status true if all ok. otherwise, false
     */
    public function setStatus($status);
    /**
     * Fix main value (If necessary)
     */
    public function fixValue();
    /**
     * Observar Pattern
     * Update value to target class
     * @param  AbstractSubject $subject object parrent
     */
    public function update(AbstractSubject $subject);
    public function create();
}
