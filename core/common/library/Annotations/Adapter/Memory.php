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
namespace Phanbook\Common\Library\Annotations\Adapter;

use Phalcon\Annotations\Adapter\Memory as PhMemory;
use Phanbook\Common\Library\Annotations\AdapterTrait;

/**
 * \Phanbook\Common\Library\Annotations\Adapter\Memory
 *
 * @package Phanbook\Common\Library\Annotations\Adapter
 */
class Memory extends PhMemory
{
    use AdapterTrait;
}
