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
namespace Phanbook\Forms;

use Phalcon\Forms\Form;
use Phanbook\Models\Tags;

class FormBase extends Form
{

    protected $tagsId;


    public function renderTags()
    {
        $element = "<select id ='tags' name='tags[]' class ='form-control' multiple='multiple'>";

        $tags = Tags::find();
        foreach ($tags as $key => $tag) {
            $selected = '';
            if (is_array($this->tagsId)) {
                if (in_array($tag->id, $this->tagsId)) {
                    $selected = 'selected';
                }
            }
            $element .= "<option value='{$tag->id}' {$selected}> {$tag->name}";
            $element .= "</option>";
        }
        $element .= "</select>";
        return $element;
    }
}
