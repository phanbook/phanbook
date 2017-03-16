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

use Phalcon\Translate\Adapter\Gettext;
use Phalcon\Translate\Adapter\NativeArray;

/**
 * \Phanbook\Common\Library\Providers\TranslationServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class TranslationServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'translation';

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
                $language = $this->getShared('config')->language;
                $code     = $language->code;

                if ($this->getShared('cookies')->has('code')) {
                    $code = $this->getShared('cookies')->get('code')->getValue();
                }

                if ($language->gettext) {
                    return new Gettext([
                        'locale'        => $code,
                        'directory'     => app_path('core/lang'),
                        'defaultDomain' => 'messages',
                    ]);
                }

                $path = app_path("core/lang/messages/{$code}.php");
                if (!file_exists($path)) {
                    $this->getShared('logger')->error("You must specify a language file for language '$code'");
                    $path = app_path('core/lang/messages/en.php');
                }

                /** @noinspection PhpIncludeInspection */
                $data = include $path;
                if (!is_array($data)) {
                    $this->getShared('logger')->error(
                        "Translation data [{$path}] for language '$code' must be an array. Got: " . gettype($data)
                    );
                    $data = [];
                }

                return new NativeArray(['content' => $data]);
            }
        );
    }
}
