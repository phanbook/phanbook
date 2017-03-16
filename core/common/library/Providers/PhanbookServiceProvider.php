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

use Phanbook\Utils\Phanbook;

/**
 * \Phanbook\Common\Library\Providers\PhanbookServiceProvider
 *
 * @deprecated
 * @package Phanbook\Common\Library\Providers
 */
class PhanbookServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'phanbook';

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

                $info = themes_path("{$config->theme}/info.php");

                if (!file_exists($info)) {
                    trigger_error('You need to created a file info theme', E_USER_ERROR);
                }

                /** @noinspection PhpIncludeInspection */
                return new Phanbook(require $info);
            }
        );
    }
}
