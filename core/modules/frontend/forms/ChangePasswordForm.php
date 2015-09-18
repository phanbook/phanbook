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
use Phalcon\Forms\Element\Password;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\Confirmation;
use Phalcon\Validation\Validator\StringLength;

class ChangePasswordForm extends Form
{
    public function initialize()
    {
        //current password
        $passwd = new Password(
            'passwd',
            array(
            'placeholder'  => t('Enter your current password'),
            'class'        => 'form-control',
            'autofocus'    => true,
            'autocomplete' => 'off'
            )
        );

        $passwd->addValidator(
            new PresenceOf(
                array(
                'message' => t('We need your current password.')
                )
            )
        );

        $this->add($passwd);

        //New password
        $passwdNew = new Password(
            'passwd_new',
            array(
            'placeholder'  => t('New password'),
            'class'        => 'form-control',
            'autocomplete' => 'off'
            )
        );

        $passwdNew->addValidators(
            array(
                new PresenceOf(
                    array(
                    'message' => t('Password is required')
                    )
                ),
                new StringLength(
                    array(
                    'min'            => 5,
                    'messageMinimum' => t('Password is too short. Minimum 5 characters')
                    )
                ),
                new Confirmation(
                    array(
                    'message' => t('Password doesn\'t match confirmation'),
                    'with'    => 'passwd_new_confirm'
                    )
                )
            )
        );

        $this->add($passwdNew);

        //Confirm New Password
        $passwdNewConfirm = new Password(
            'passwd_new_confirm',
            array(
            'placeholder'  => t('Confirm new password'),
            'class'        => 'form-control',
            'autocomplete' => 'off'
            )
        );

        $passwdNewConfirm->addValidator(
            new PresenceOf(
                array(
                'message' => t('The confirmation password is required')
                )
            )
        );

        $this->add($passwdNewConfirm);


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
                'class' => 'btn btn-info btm-sm',
                'value' => t('Save')
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
                $this->flashSession->error($message);
            }
        }
    }
}
