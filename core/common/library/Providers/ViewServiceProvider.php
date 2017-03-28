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

use Phalcon\Mvc\View;
use Phanbook\Common\Library\Events\ViewListener;

/**
 * \Phanbook\Common\Library\Providers\ViewServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ViewServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'view';

    protected $engines = [
        '.volt' => 'volt',
        '.php'  => 'phpEngine',
    ];

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $registeredEngines = $this->engines;

        $this->di->setShared(
            $this->serviceName,
            function () use ($registeredEngines) {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config');

                $view = new View();

                $engines = [];
                foreach ($registeredEngines as $ext => $service) {
                    $engines[$ext] = $this->getShared($service, [$view, $this]);
                }

                $view->registerEngines($engines);
                $view->setViewsDir($config->application->view->viewsDir);
                $view->disableLevel([
                    View::LEVEL_MAIN_LAYOUT => true,
                    View::LEVEL_LAYOUT      => true,
                ]);

                $eventsManager = $this->getShared('eventsManager');
                $eventsManager->attach('view:notFoundView', new ViewListener($this));

                $view->setEventsManager($eventsManager);

                return $view;
            }
        );
    }
}
