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
namespace Phanbook\Backend\Forms;

use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\PresenceOf;

class TemplateForm extends Form
{
    public function initialize($entity = null)
    {
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
        }

        $name = new Text(
            'name',
            [
            'placeholder' => 'Name',
            'required'    => 'true',
            'autofocus'   => 'true'
            ]
        );
        $name->addValidators(
            [
                new PresenceOf(
                    [
                    'message' => 'Name is required.'
                    ]
                )
            ]
        );
        $this->add($name);

        $this->add(new Text('key', ['placeholder' => 'Key', 'required' => 'true']));
        $this->add(new Text('subject', ['placeholder' => 'Subject', 'required' => 'true']));
        $this->add(new TextArea('content', ['rows' => 30, 'cols' => 10, 'placeholder' => 'Content']));

        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(
            new Identical(
                array(
                'value'   => $this->security->getSessionToken(),
                'message' => t('CSRF validation failed')
                )
            )
        );

        $this->add($csrf);

        //Submit
        $this->add(
            new Submit(
                'save',
                [
                'value' => 'Save',
                'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
