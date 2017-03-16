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
use Phalcon\Mvc\View\Engine\Volt;
use Phalcon\Mvc\ViewBaseInterface;
use Phanbook\Common\Library\Volt\VoltFunctions;

/**
 * \Phanbook\Common\Library\Providers\VoltTemplateEngineServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class VoltTemplateEngineServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'volt';

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
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config');

                $volt = new Volt($view, $di ?: $this);

                $volt->setOptions(
                    [
                        'compiledPath'      => $config->application->view->compiledPath,
                        'compiledSeparator' => $config->application->view->compiledSeparator,
                        'compiledExtension' => $config->application->view->compiledExtension,
                        'compileAlways'     => (bool) $config->application->debug,
                    ]
                );

                $volt->getCompiler()->addExtension(new VoltFunctions());

                return $volt;
            }
        );
    }
}
