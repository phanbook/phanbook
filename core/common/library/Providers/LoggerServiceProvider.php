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

use Phalcon\Logger\Adapter\File;

/**
 * \Phanbook\Common\Library\Providers\LoggerServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class LoggerServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'logger';

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
                return new File(logs_path(date('Y-m-d') . '.log'), ['mode' => 'a+']);
            }
        );
    }
}
