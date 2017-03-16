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
namespace Phanbook\Backend\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;

class SettingReadingForm extends Form
{
    public function initialize($entity = null)
    {
        $perPage = $this->config->perPage;
        if (!isset($perPage)) {
            $perPage = null;
        }
        //perPage
        $perPage = new Numeric(
            'perPage',
            [
                'class'       => 'form-control',
                'required'    => true,
                'value'       => $perPage,
            ]
        );
        $perPage->addValidator(
            new PresenceOf(
                array(
                'message' => t('The PerPage is required.')
                )
            )
        );
        $this->add($perPage);

        $this->add(
            new Submit(
                'save',
                [
                    'class' => 'btn btn-sm btn-info',
                    'value' => 'Save'
                ]
            )
        );
    }
}
