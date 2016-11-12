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

use Phalcon\DiInterface;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;

/**
 * \Phanbook\Common\Library\Events\AbstractEvent
 *
 * @package Phanbook\Common\Library\Events
 */
abstract class AbstractEvent
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * AbstractEvent constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
    }
}
