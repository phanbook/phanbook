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
namespace Phanbook\Common\Library\Providers;

use Phalcon\DiInterface;
use Phalcon\Mvc\ViewBaseInterface;
use Phalcon\Mvc\View\Engine\Php as PhpEngine;

/**
 * \Phanbook\Common\Library\Providers\PhpTemplateEngineServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class PhpTemplateEngineServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'phpEngine';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->setShared(
            $this->serviceName,
            function (ViewBaseInterface $view, DiInterface $di = null) {
                return new PhpEngine($view, $di ?: $this);
            }
        );
    }
}
