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
namespace Phanbook\Factory;

/**
 * This class'll declare special think in PageViews dimension
 */
class PageViews extends TopDashboard
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
        $this->setDescription("Total Page Views");
        parent::create();
    }
}
