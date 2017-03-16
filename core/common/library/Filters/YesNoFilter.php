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
namespace Phanbook\Common\Library\Filters;

/**
 * \Phanbook\Common\Library\Filters\YesNoFilter
 *
 * @package Phanbook\Common\Library\Filters
 */
class YesNoFilter
{
    /**
     * @param  string $value
     * @return string
     */
    public function filter($value)
    {
        if (!is_string($value) || empty($value)) {
            return '';
        }

        return substr(preg_replace('#[^YN]#', '', $value), 0, 1);
    }
}
