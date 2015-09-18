<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Oauth\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\StringLength;

class ResetPasswordForm extends Form
{
    public function initialize()
    {
        //New password
        $passwordNew = new Password(
            'password_new',
            array(
            'placeholder'  => 'New password',
            'class'        => 'form-control',
            'autocomplete' => 'off'
            )
        );

        $passwordNew->addValidators(
            array(
                new PresenceOf(
                    array(
                    'message' => 'Password is required'
                    )
                ),
                new StringLength(
                    array(
                    'min'            => 5,
                    'messageMinimum' => 'Password is too short. Minimum 5 characters'
                    )
                ),
                new Confirmation(
                    array(
                    'message' => 'Password doesn\'t match confirmation',
                    'with'    => 'password_new_confirm'
                    )
                )
            )
        );

        $this->add($passwordNew);

        //Confirm New Password
        $passwordNewConfirm = new Password(
            'password_new_confirm',
            array(
            'placeholder'  => 'Confirm new password',
            'class'        => 'form-control',
            'autocomplete' => 'off'
            )
        );

        $passwordNewConfirm->addValidator(
            new PresenceOf(
                array(
                'message' => 'The confirmation password is required'
                )
            )
        );

        $this->add($passwordNewConfirm);


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
                'change',
                [
                'class' => 'submit-button-login',
                'value' => 'Sign in'
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
