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
 * This class declare TopDashboard Factory
 */
class AvgSessionDuration extends TopDashboard
{
    /**
     * Override function create
     * Change special detail for each dimension
     * @param  string $dimension google analytic metric
     * @return
     */
    public function create()
    {
        $this->setNumbDate(30);
        $this->setDescription("Session Duration");
        parent::create();
    }
    public function fixValue()
    {
        $this->convertToTime();
    }
}
