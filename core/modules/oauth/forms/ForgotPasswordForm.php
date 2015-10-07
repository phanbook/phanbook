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
namespace Phanbook\Oauth\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Check;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Identical;

class ForgotPasswordForm extends Form
{
    public function initialize()
    {
        //Email
        $email = new Text(
            'email',
            [
            'placeholder' => 'Email',
            'class'       => 'form-control',
            'required'    => 'true',
            'autofocus'   => 'true'
            ]
        );
        $email->addValidators(
            [
                new PresenceOf(
                    [
                    'message' => 'The e-mail is required'
                    ]
                ),
                new Email(
                    [
                    'message' => 'The e-mail is not valid'
                    ]
                )
            ]
        );
        $this->add($email);
        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(
            new Identical(
                array(
                'value'   => $this->security->getSessionToken(),
                'message' => 'CSRF validation failed'
                )
            )
        );

        $this->add($csrf);
        //Submit
        $this->add(
            new Submit(
                'recover',
                [
                'class' => 'submit-button-login',
                'value' => 'Recover'
                ]
            )
        );
    }

    /**
     * Prints messages for a specific element
     */
    public function messages($name)
    {
        if ($this->hasMessagesFor($name)) {
            foreach ($this->getMessagesFor($name) as $message) {
                $this->flash->error($message);
            }
        }
    }
}
