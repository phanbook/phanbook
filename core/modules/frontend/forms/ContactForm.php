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
namespace Phanbook\Frontend\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;

class ContactForm extends Form
{
    public function initialize($entity = null)
    {

        //name
        $name = new Text(
            'name',
            [
            'placeholder' => t('You name'),
            'class'       => 'form-control',
            'required'    => true
            ]
        );
        $name->addValidator(
            new PresenceOf(
                [
                'message' => t('The name is required.')
                ]
            )
        );
        $this->add($name);
        //email
        $email = new Text(
            'email',
            [
            'placeholder' => t('You email'),
            'class'       => 'form-control',
            'required'    => true
            ]
        );
        $email->addValidator(
            new PresenceOf(
                [
                'message' => t('The email is required.')
                ]
            )
        );
        $this->add($email);
        //subject
        $subject = new Text(
            'subject',
            [
            'placeholder' => t('You subject'),
            'class'       => 'form-control',
            'required'    => true
            ]
        );
        $subject->addValidator(
            new PresenceOf(
                [
                'message' => t('The subject is required.')
                ]
            )
        );
        $this->add($subject);
        //description
        $description = new TextArea(
            'description',
            [
            'placeholder' => t('Please enter you messages'),
            'class'       => 'form-control',
            'rows'        => '5',
            'required'    => true
            ]
        );
        $description->addValidator(
            new PresenceOf(
                [
                'message' => t('Description is required.')
                ]
            )
        );
        $this->add($description);


        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(
            new Identical(
                [
                'value'   => $this->security->getSessionToken(),
                'message' => 'CSRF validation failed'
                ]
            )
        );

        $this->add($csrf);

        $this->add(
            new Submit(
                'submit',
                [
                'class' => 'btn btn-sm btn-info',
                'value' => 'Submit'
                ]
            )
        );
    }
}
