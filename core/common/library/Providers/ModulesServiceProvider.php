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
namespace Phanbook\Common\Library\Providers;

use RecursiveDirectoryIterator;
use Phanbook\Cli\Module as Cli;
use Phanbook\Oauth\Module as oAuth;
use Phanbook\Backend\Module as Backend;
use Phanbook\Frontend\Module as Frontend;

/**
 * \Phanbook\Common\Library\Providers\ModulesServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ModulesServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'modules';

    protected $modules = [];

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function configure()
    {
        $directory = new RecursiveDirectoryIterator(modules_path());

        foreach ($directory as $item) {
            $name = $item->getFilename();
            if (!$item->isDir() || $name[0] == '.') {
                continue;
            }

            $this->modules[$name] = [
                'className' => 'Phanbook\\' . ucfirst($name) . '\\Module',
                'path'      => modules_path("{$name}/Module.php"),
                'router'    => modules_path("{$name}/config/routing.php"),
            ];
        }

        $core = [
            'frontend' => [
                'className' => Frontend::class,
                'path'      => modules_path('frontend/Module.php')
            ],
            'oauth' => [
                'className' => oAuth::class,
                'path'      => modules_path('oauth/Module.php')
            ],
            'backend' => [
                'className' => Backend::class,
                'path'      => modules_path('backend/Module.php')
            ],
            'cli' => [
                'className' => Cli::class,
                'path'      => modules_path('cli/Module.php')
            ]
        ];

        $this->modules = array_merge($core, $this->modules);
    }

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $modules = $this->modules;

        $this->di->setShared(
            $this->serviceName,
            function () use ($modules) {
                return $modules;
            }
        );
    }

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function boot()
    {
        /** @var \Phanbook\Common\Application $bootstrap */
        $bootstrap = $this->getDI()->getShared('bootstrap');

        /** @var \Phalcon\Mvc\Application $app */
        $app = $bootstrap->getApplication();
        $app->registerModules($this->modules);
        $app->setDefaultModule('frontend');
    }
}
