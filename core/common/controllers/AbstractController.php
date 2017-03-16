<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Controllers;

use Phalcon\Di\Injectable;
use Phanbook\Common\InjectableTrait;
use Phalcon\Mvc\ControllerInterface;

/**
 * \Phanbook\Controllers\AbstractController
 *
 * @package Phanbook\Controllers
 */
abstract class AbstractController extends Injectable implements ControllerInterface
{
    use InjectableTrait;

    /**
     * AbstractController constructor.
     */
    final public function __construct()
    {
        if (method_exists($this, "onConstruct")) {
            $this->onConstruct();
        }

        $this->injectDependencies();
    }
}
