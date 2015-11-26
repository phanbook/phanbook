<?php
/**
 * Phanbook                  : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http             ://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license http             ://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Backend\Forms;

use Phalcon\Forms\Element\File;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Text;
use Phalcon\Validation\Validator\Identical;
use Phanbook\Models\MediaType;

class MediaForm extends Form
{
    public function initialize()
    {
        $file = new File('media');
        $this->add($file);

        // CSRF
        $csrf = new Hidden('csrf');
        $csrf->addValidator(
            new Identical(
                [
                    'value'  => $this->security->getSessionToken(),
                    'message'=> $this->constants->CSRF_ERROR()
                ]
            )
        );
        // Display for type of media. Such as images, videos, audios, etc
        $totalMedia = MediaType::sum(["column" => "amount"]);
        $mediaType = new Select(
            "mediaType",
            MediaType::find( [ 'columns'=> array('id', " CONCAT(name, ' (', amount, ')') as type_amount") ]),
            [
                'using' => [
                        'id',
                        'type_amount'
                ],
                'name'    =>  'mediaType',
                'class'     =>  'form-control col-md-3 btn-mini',
                'useEmpty'  =>  true,
                'emptyText' =>  "All (" . $totalMedia . ")",
                'emptyValue'    =>  "all"
            ]
        );
        $this->add($mediaType);

        // Search some thing
        $search = new Text(
            'search',
            [
                'placeholder' => $this->constants->SEARCH_PLACEHOLDER(),
                'class'       => 'form-control btn-mini',
                'required'    => false
            ]
        );
        $this->add($search);
    }
}
