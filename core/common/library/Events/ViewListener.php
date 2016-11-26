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
use Phalcon\Mvc\ViewInterface;
use Phalcon\Mvc\View\Exception;

/**
 * \Phanbook\Common\Library\Events\ViewListener
 *
 * @package Phanbook\Plugins\Mvc\View
 */
class ViewListener extends AbstractEvent
{
    /**
     * Notify about not found views.
     *
     * @param Event $event
     * @param ViewInterface $view
     * @param mixed $viewEnginePath
     *
     * @throws Exception
     */
    public function notFoundView(Event $event, ViewInterface $view, $viewEnginePath)
    {
        if ($viewEnginePath && !is_array($viewEnginePath)) {
            $viewEnginePath = [$viewEnginePath];
        }

        $message = sprintf(
            'View was not found in any of the views directory. Active render paths: [%s]',
            ($viewEnginePath ? join(', ', $viewEnginePath) : gettype($viewEnginePath))
        );

        $this->logger->error($message);

        if ($event->isCancelable()) {
            $event->stop();
        }

        throw new Exception($message);
    }
}
