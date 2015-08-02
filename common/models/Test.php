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

class Test extends \Phalcon\Mvc\Collection
{



    public static function returnArrayForSelect($obj)
    {

        return (array)$obj;
    }

    public function initialize()
    {
        $this->setConnectionService('mongo');
        $this->setSource('data');
    }
}
