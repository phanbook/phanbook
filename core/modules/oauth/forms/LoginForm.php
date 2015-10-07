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

class LoginForm extends Form
{
    public function initialize()
    {
        //Email
        $email = new Text(
            'email',
            [
            'class'       => 'text-box',
            'required'    => 'true',
            'autofocus'   => 'true',
            'placeholder' => 'Username or Email'
            ]
        );
        $email->addValidators(
            [
                new PresenceOf(
                    [
                    'message' => t('The e-mail is required')
                    ]
                )
            ]
        );
        $this->add($email);

        //Password
        $password = new Password(
            'password',
            [
            'placeholder' => t('Password'),
            'class'       => 'text-box',
            'required'    => 'true'
            ]
        );
        $password->addValidator(
            new PresenceOf(
                [
                'message' => t('The password is required')
                ]
            )
        );
        $this->add($password);

        //Remember me
        $remember = new Check(
            'remember',
            [
            'value'     => 'yes',
            'checked'   => 'checked'
            ]
        );
        $this->add($remember);

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
                'login',
                [
                'class' => 'submit-button-login',
                'value' => t('Login')
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
