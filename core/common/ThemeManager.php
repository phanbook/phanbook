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
     * The Theme path.
     * @var string
     */
    protected $themePath;

    /**
     * The Theme name.
     * @var string
     */
    protected $themeName;

    /**
     * ThemeManager constructor.
     * @param string $themePath The Theme path.
     * @param string $themeName The Theme name.
     */
    public function __construct($themePath, $themeName)
    {
        $this->themePath = rtrim($themePath, '\\/');
        $this->themeName = $themeName;
    }

    /**
     * Get Theme path.
     *
     * @return string
     */
    public function getThemePath()
    {
        return $this->themePath;
    }

    /**
     * Get Theme name.
     *
     * @return string
     */
    public function getThemeName()
    {
        return $this->themeName;
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
            'targetBasePath' => ROOT_DIR . '/public'
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
            ->setSourcePath($this->themePath)
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
            ->setSourcePath($this->themePath)
            ->addJs('/assets/js/app.js');

        if (file_exists($this->themePath . '/assets/js/custom.js')) {
            $themeJs->addJs('/assets/js/custom.js');
        }

        $themeJs
            ->setLocal(true)
            ->addFilter(new Jsmin());

        $assets->set('theme_js', $themeJs);

        return $this;
    }
}
