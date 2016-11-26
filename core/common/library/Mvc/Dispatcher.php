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
namespace Phanbook\Common\Library\Mvc;

use Phalcon\Mvc\Dispatcher as PhDispatcher;

/**
 * \Phanbook\Common\Library\Mvc\Dispatcher
 *
 * @package Phanbook\Common\Library\Mvc
 */
class Dispatcher extends PhDispatcher
{
    /**
     * {@inheritdoc}
     *
     * @param array $forward
     */
    public function forward($forward)
    {
        $this->getEventsManager()->fire('dispatch:beforeForward', $this, $forward);

        parent::forward($forward);
    }
}
