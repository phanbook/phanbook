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
namespace Phanbook\Oauth\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * \Phanbook\Oauth\Forms\ForgotPasswordForm
 *
 * @package Phanbook\Oauth\Forms
 */
class ForgotPasswordForm extends Form
{
    public function initialize()
    {
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
                new PresenceOf(['message' => t('The e-mail is required')]),
                new Email(['message' => t('The e-mail is not valid')])
            ]
        );
        $this->add($email);

        $csrf = new Hidden('csrf');

        $csrf->addValidator(
            new Identical(
                [
                    'accepted' => $this->security->getSessionToken(),
                    'message'  => t('This form has altered. Please try submitting it again.')
                ]
            )
        );

        $this->add($csrf);

        $this->add(
            new Submit(
                'recover',
                [
                    'class' => 'submit-button-login',
                    'value' => t('Reset my password')
                ]
            )
        );
    }
}
