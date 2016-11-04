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
namespace Phanbook\Plugins\Mvc\View;

use Phalcon\Di;
use Phalcon\DiInterface;
use Phalcon\Events\Event;
use Phalcon\Mvc\User\Plugin;
use Phalcon\Mvc\ViewInterface;
use Phalcon\Mvc\View\Exception;

/**
 * \Phanbook\Plugins\Mvc\View\ErrorHandler
 *
 * @package Phanbook\Plugins\Mvc\View
 */
class ErrorHandler extends Plugin
{
    /**
     * @var DiInterface
     */
    protected $di;

    /**
     * ErrorHandler constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->di = $di ?: Di::getDefault();
    }

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

        $this->di->getShared('logger')->error($message);

        throw new Exception($message);
    }
}
