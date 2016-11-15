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
namespace Phanbook\Common\Library\Events;

use Phalcon\Events\Event;
use Phalcon\Db\Adapter\Pdo;

/**
 * \Phanbook\Common\Library\Events\DbListener
 *
 * @package Phanbook\Common\Library\Events
 */
class DbListener extends AbstractEvent
{
    /**
     * Database queries listener.
     *
     * You can disable queries logging by changing log level.
     *
     * @param  Event $event
     * @param  Pdo   $connection
     * @return bool
     */
    public function beforeQuery(Event $event, Pdo $connection)
    {
        $string    = $connection->getSQLStatement();
        $variables = $connection->getSqlVariables();
        $context   = $variables ?: [];

        $logger = $this->getDI()->getLogger(date('Y-m-d') . '-' . 'db.log');
        $logger->debug($string . ' [' . implode(', ', $context) . ']');

        return true;
    }
}
