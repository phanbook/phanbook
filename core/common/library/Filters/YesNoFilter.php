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
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
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
