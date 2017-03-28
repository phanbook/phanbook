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
namespace Phanbook\Common;

use Phalcon\Assets\Collection;
use Phalcon\Mvc\User\Component;
use Phalcon\Assets\Filters\Jsmin;
use Phalcon\Assets\Filters\Cssmin;
use Phalcon\Assets\Manager as AssetsManager;

/**
 * \Phanbook\Common\ThemeManager
 *
 * @package Phanbook\Common
 */
class ThemeManager extends Component
{
    /**
     * The Theme name.
     * @var string
     */
    protected $name;

    /**
     * ThemeManager constructor.
     *
     * @param string $name The Theme name.
     */
    public function __construct($name)
    {
        $this->name = $name;
    }

    /**
     * Get Theme name.
     *
     * @return string
     */
    public function getThemeName()
    {
        return $this->name;
    }

    /**
     * Get the Assets Manager.
     *
     * @return AssetsManager
     */
    public function getAssetsManager()
    {
        if (!$this->di->has('assets')) {
            $assets = new AssetsManager();
            $this->di->setShared('assets', $assets);

            return $assets;
        }

        return $this->di->getShared('assets');
    }

    public function initializeAssets()
    {
        $assets = $this->getAssetsManager();
        $assets->setOptions([
            'targetBasePath' => app_path('public')
        ]);

        $this
            ->initializeThemeCss()
            ->initializeThemeJs();
    }

    protected function initializeThemeCss()
    {
        $assets = $this->getAssetsManager();

        $themeCss = new Collection();
        $themeCss
            ->setTargetPath('/css/theme.css')
            ->setTargetUri('/css/theme.css?v=1')
            ->setSourcePath(themes_path($this->name))
            ->addCss('/assets/css/app.css')
            ->setLocal(true)
            ->addFilter(new Cssmin());

        $assets->set('theme_css', $themeCss);

        return $this;
    }

    protected function initializeThemeJs()
    {
        $assets = $this->getAssetsManager();

        $themeJs = new Collection();
        $themeJs
            ->setTargetPath('/js/theme.js')
            ->setTargetUri('/js/theme.js?v=1')
            ->setSourcePath(themes_path($this->name))
            ->addJs('/assets/js/app.js');

        if (file_exists(themes_path($this->name . '/assets/js/custom.js'))) {
            $themeJs->addJs('/assets/js/custom.js');
        }

        $themeJs
            ->setLocal(true)
            ->addFilter(new Jsmin());

        $assets->set('theme_js', $themeJs);

        return $this;
    }
}
