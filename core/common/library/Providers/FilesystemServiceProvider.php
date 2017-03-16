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

use League\Flysystem\Filesystem;
use League\Flysystem\Adapter\Local;

/**
 * \Phanbook\Common\Library\Providers\FilesystemServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class FilesystemServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'filesystem';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->set(
            $this->serviceName,
            function ($path = null) {
                $path = $path ?: content_path('uploads') . DIRECTORY_SEPARATOR;
                $adapter = new Local($path);

                return new Filesystem($adapter);
            }
        );
    }
}
