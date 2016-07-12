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
namespace Phanbook\Utils;

use Phalcon\Mvc\User\Component;

class Editor extends Component
{

    public function loadAssetsCk()
    {
        $this->assets
            ->addJs('core/assets/js/editor/ckeditor.js')
            ->addJs('core/assets/js/editor/ckeditor-init.js')
        ;
    }

    public function loadAssetsMarkdown()
    {
        $this->assets
            ->addCss('core/assets/css/editor.css');
        $this->assets
            ->addJs('core/assets/js/editor/markdown.js')
            ->addJs('core/assets/js/editor/md-converts.js')
            ->addJs('core/assets/js/editor/editor.js');
    }

    public function init()
    {
        if ($this->config->editor == 'markdown') {
            $this->loadAssetsMarkdown();
        } else {
            $this->loadAssetsCk();
        }
    }
}
