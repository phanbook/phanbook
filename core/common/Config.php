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
namespace Phanbook\Common;

use LogicException;
use RuntimeException;
use Phalcon\Config as PhalconConfig;

/**
 * \Phanbook\Common\Config
 *
 * The application config.
 *
 * @package Phanbook\Common
 */
class Config extends PhalconConfig
{
    /**
     * The Application config location.
     * @type string
     */
    const CONFIG_DIR = '/core/config/';

    /**
     * Current Application stage.
     * @var string
     */
    protected $stage = ENV_LOCAL;

    /**
     * Config constructor.
     *
     * @param array|null $config The Application config.
     * @param string $stage The current Application stage.
     */
    public function __construct(array $config = null, $stage = ENV_LOCAL)
    {
        // @todo Validate stage
        $this->stage = $stage;

        parent::__construct($config);
    }

    /**
     * Load configuration from all files.
     *
     * @param string $stage
     * @return Config
     * @throws LogicException
     * @throws RuntimeException
     */
    public static function factory($stage = ENV_LOCAL)
    {
        $configPath = ROOT_DIR. self::CONFIG_DIR . 'config.php';
        if (!file_exists($configPath) || !is_file($configPath)) {
            throw new RuntimeException(
                sprintf(
                    'The Application config not found. Please make sure that the file "%s" is present',
                    $configPath
                )
            );
        }

        /** @noinspection PhpIncludeInspection */
        $config = require $configPath;

        if (is_array($config)) {
            $config = new self($config, $stage);
        }

        if (!$config instanceof PhalconConfig) {
            throw new RuntimeException(
                sprintf(
                    'The Application config must be an instance of %s.',
                    PhalconConfig::class
                )
            );
        }

        if (file_exists(ROOT_DIR. self::CONFIG_DIR . 'config.global.php')) {
            /** @noinspection PhpIncludeInspection */
            $global = require ROOT_DIR. self::CONFIG_DIR . 'config.global.php';

            if (is_array($global)) {
                $global = new self($config, $stage);
            }

            if ($global instanceof PhalconConfig) {
                $config->merge($global);
            }
        }

        if ($stage !== ENV_PRODUCTION) {
            if (file_exists(ROOT_DIR. self::CONFIG_DIR . 'config.' . APPLICATION_ENV . '.php')) {
                /** @noinspection PhpIncludeInspection */
                $local = require ROOT_DIR. self::CONFIG_DIR . 'config.' . APPLICATION_ENV . '.php';

                if (is_array($local)) {
                    $local = new self($config, $stage);
                }

                if ($local instanceof PhalconConfig) {
                    $config->merge($local);
                }
            }
        }

        return $config;
    }
}
