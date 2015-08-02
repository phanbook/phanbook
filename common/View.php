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
namespace Phanbook\Mvc;

class View extends \Phalcon\Mvc\View
{
    public $theme;

    public function __construct($config)
    {

        $this->theme = $config['theme'];
    }

    /**
     * Pick view to render.
     *
     * @param array|string $renderView View to render.
     *
     * @return PhalconView|void
     */
    public function pickCustom($renderView)
    {
        if ($this->theme != null) {
            $renderView = '../themes/' . $this->theme . '/' .$renderView;
        }
        parent::pick($renderView);
    }
}
