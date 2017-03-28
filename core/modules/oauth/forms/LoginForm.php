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
use Phalcon\Forms\Element\Check;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;

/**
 * \Phanbook\Oauth\Forms\LoginForm
 *
 * @package Phanbook\Oauth\Forms
 */
class LoginForm extends Form
{
    public function initialize()
    {
        // Email
        $email = new Text(
            'email',
            [
                'class'       => 'text-box',
                'required'    => true,
                'autofocus'   => true,
                'placeholder' => t('Username or Email'),
            ]
        );
        $email->addValidator(new PresenceOf(['message' => t('The Username or E-Mail is required')]));
        $this->add($email);

        // Password
        $password = new Password(
            'password',
            [
                'placeholder' => t('Password'),
                'class'       => 'text-box',
                'required'    => true,
            ]
        );
        $password->addValidator(new PresenceOf(['message' => t('The password is required')]));
        $this->add($password);

        // Remember me
        $remember = new Check(
            'remember',
            [
                'value'   => 'yes',
                'checked' => 'checked',
                'id'      => 'remember-me',
            ]
        );
        $this->add($remember);

        // Submit
        $this->add(
            new Submit(
                'submit',
                [
                    'class' => 'submit-button-login',
                    'value' => t('Sign In')
                ]
            )
        );
    }

    /**
     * Prints messages for a specific element.
     * @param string $name
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
