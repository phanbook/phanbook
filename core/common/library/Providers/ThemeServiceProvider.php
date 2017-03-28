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

use Phanbook\Common\ThemeManager;

/**
 * \Phanbook\Common\Library\Providers\ThemeServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class ThemeServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'theme';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->setShared(
            $this->serviceName,
            function () {
                /** @var \Phalcon\DiInterface $this */
                $config = $this->getShared('config');

                $manager = new ThemeManager($config->theme);
                $manager->setDI($this);

                return $manager;
            }
        );

        $this->di->getShared($this->serviceName)->initializeAssets();
    }
}
