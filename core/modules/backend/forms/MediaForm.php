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
use Phanbook\Media\MediaFiles;

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
                    'message'=> CSRF_ERROR
                ]
            )
        );
        $userName = $this->getDI()->getAuth()->getUsername();
        // Display for type of media. Such as images, videos, audios, etc
        // Get user media config file for total media file
        $mediaFiles = new MediaFiles();
        $userConfig = $mediaFiles->getConfigFile($userName);
        $totalMedia = 0;
        $displayData = [];
        foreach ($userConfig as $key => $value) {
            $totalMedia += $value;
            $displayData[MediaType::getTypeFromName($key)->getId()] = $key. "($value)";
        }
        $mediaType = new Select(
            "mediaType",
            $displayData,
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
                'placeholder' => SEARCH_PLACE_HOLDER,
                'class'       => 'form-control btn-mini',
                'required'    => false
            ]
        );
        $this->add($search);
    }
}
