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

use Phalcon\Config;
use RuntimeException;

/**
 * \Phanbook\Common\Library\Providers\ConfigServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ConfigServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'config';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->checkApplicationConfig();
        $merge = $this->mergeCallback();

        $this->di->setShared(
            $this->serviceName,
            function () use ($merge) {
                /** @noinspection PhpIncludeInspection */
                $config = require config_path('config.php');

                if (is_array($config)) {
                    $config = new Config($config);
                }

                if (!$config instanceof Config) {
                    throw trigger_error(
                        sprintf('The Application config must be an instance of %s.', Config::class),
                        E_USER_ERROR
                    );
                }

                $merge($config, config_path('config.global.php'));
                $merge($config, content_path('options/options.php'));

                if (APPLICATION_ENV !== ENV_PRODUCTION) {
                    $merge($config, config_path('config.' . APPLICATION_ENV . '.php'));
                }

                return $config;
            }
        );
    }

    protected function checkApplicationConfig()
    {
        $configPath = config_path('config.php');
        if (!file_exists($configPath) || !is_file($configPath)) {
            throw new RuntimeException(
                sprintf(
                    'The Application config not found. Please make sure that the file "%s" is present',
                    $configPath
                )
            );
        }
    }

    protected function mergeCallback()
    {
        return function (&$config, $path) {
            if (file_exists($path)) {
                /** @noinspection PhpIncludeInspection */
                $toMerge = require $path;

                if (is_array($toMerge)) {
                    $toMerge = new Config($toMerge);
                }

                if ($toMerge instanceof Config) {
                    /** @var Config $config */
                    $config->merge($toMerge);
                }
            }
        };
    }
}
