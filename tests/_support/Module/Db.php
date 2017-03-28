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

namespace App\Test\Module;

use Codeception\Module\Db as CodeceptDb;

/**
 * \App\Test\Module\Db
 *
 * @package App\Test\Module
 */
class Db extends CodeceptDb
{
    public function dropFromDatabase($table, array $criteria = [])
    {
        $this->driver->deleteQueryByCriteria($table, $criteria);
    }
}
