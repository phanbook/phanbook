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
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\Password;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\Regex;
use Phalcon\Validation\Validator\Identical;
use Phanbook\Validators\Phone;
use Phanbook\Models\User;

class SignupForm extends Form
{
    public function initialize()
    {
        //Firstname
        $firstName = new Text(
            'firstname',
            [
            'placeholder' => 'Firstname',
            'required' => 'true',
            'autofocus' => 'true',
            'class'     => 'text-box'
            ]
        );
        $firstName->addValidators(
            [
            new PresenceOf(
                [
                'message' => 'Firstname is required.'
                ]
            )
            ]
        );
        $this->add($firstName);

        //Lastname
        $lastName = new Text(
            'lastname',
            [
            'placeholder' => 'Lastname',
            'autofocus' => 'true'
            ]
        );
        // $lastName->addValidators([
        //     new PresenceOf([
        //         'message' => 'Lastname is required.'
        //     ])
        // ]);
        $this->add($lastName);

        //$username
        $username = new Text(
            'username',
            [
            'placeholder' => t('Username'),
            'required' => 'true',
            'autofocus' => 'true',
            'class'     => 'text-box'
            ]
        );
        $username->addValidators(
            [
                new PresenceOf(
                    [
                    'message' => t('Username is required.')
                    ]
                )
            ]
        );
        $this->add($username);

        //Email
        $email = new Text(
            'email',
            [
            'placeholder' => 'Email',
            'required' => 'true',
            'class'    => 'text-box'
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

        //Phone
        // $phone = new Text('phone', [
        //     'placeholder' => 'Phone',
        //     'required' => 'true'
        // ]);
        /*$phone->addValidators([
            new PresenceOf([
                'message' => 'Phone numer is required.'
            ]),
            new Phone(array(
                'message' => 'Phone number is invalid and it needs to be in format 0722000777',
            ))
        ]);*/
        //$this->add($phone);

        //@TODO : remove this when they fix radio button bug in Phalcon
        /*if (!empty($entity) && $entity->getGender() == User::GENDER_MALE || $this->request->getPost('gender') == User::GENDER_MALE) {
            $this->add(new Radio('genderMale', ['value' => User::GENDER_MALE,'checked' => 'checked', 'name' => 'gender', 'label' => 'Male']));
        } else {
            $this->add(new Radio('genderMale', ['value' => User::GENDER_MALE, 'name' => 'gender', 'label' => 'Male']));
        }

        if (!empty($entity) && $entity->getGender() == User::GENDER_FEMALE || $this->request->getPost('gender') == User::GENDER_FEMALE) {
            $this->add(new Radio('genderFemale', ['value' => User::GENDER_FEMALE,'checked' => 'checked', 'name' => 'gender', 'label' => 'Female']));
        } else {
            $this->add(new Radio('genderFemale', ['value' => User::GENDER_FEMALE, 'name' => 'gender']));
        }*/

        // CSRF
        // $csrf = new Hidden('csrf');

        // $csrf->addValidator(
        //     new Identical(array(
        //         'value'   => $this->security->getSessionToken(),
        //         'message' => t('CSRF validation failed')
        //     ))
        // );

        // $this->add($csrf);

        //Submit
        $this->add(
            new Submit(
                'signup',
                [
                'value' => 'Sign in',
                'class' => 'submit-button-signup'
                ]
            )
        );
    }
}
