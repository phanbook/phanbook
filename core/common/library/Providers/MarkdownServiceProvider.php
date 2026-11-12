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

use Phanbook\Markdown\ParsedownExtra;

/**
 * \Phanbook\Common\Library\Providers\MarkdownServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class MarkdownServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'markdown';

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
                $parsedown = new ParsedownExtra();
                // Safe mode escapes raw HTML and strips javascript:/unsafe links in user-supplied
                // markdown (questions/answers/bio are rendered unescaped by Volt), preventing XSS.
                $parsedown->setSafeMode(true);

                return $parsedown;
            }
        );
    }
}
