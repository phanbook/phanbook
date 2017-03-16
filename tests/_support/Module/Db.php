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
