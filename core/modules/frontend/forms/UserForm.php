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
use Phanbook\Models\Users;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phanbook\Validators\BirthDate;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;

class UserForm extends Form
{
    public function initialize(Users $entity = null)
    {
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
        }

        // First name
        $firstName = new Text(
            'firstname',
            [
                'placeholder' => t('Firstname'),
                'required' => 'true',
                'autofocus' => 'true',
            ]
        );
        $firstName->addValidators(
            [
                new PresenceOf(
                    [
                        'message' => t('Firstname is required.')
                    ]
                )
            ]
        );
        $this->add($firstName);

        // Last name
        $lastName = new Text(
            'lastname',
            [
                'placeholder' => 'Lastname',
                'required' => 'true',
                'autofocus' => 'true',
            ]
        );
        $lastName->addValidators(
            [
                new PresenceOf(
                    [
                        'message' => 'Lastname is required.'
                    ]
                )
            ]
        );
        $this->add($lastName);

        // Username
        $username = new Text(
            'username',
            [
                'placeholder' => t('Username'),
                'required' => 'true',
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

        // @TODO: remove this when they fix radio button bug in Phalcon
        if (!empty($entity) && $entity->getGender() == Users::GENDER_MALE ||
            $this->request->getPost('gender') == Users::GENDER_MALE
        ) {
            $this->add(
                new Radio(
                    'genderMale',
                    ['value' => Users::GENDER_MALE, 'checked' => 'checked', 'name' => 'gender', 'label' => 'Male']
                )
            );
        } else {
            $this->add(new Radio('genderMale', ['value' => Users::GENDER_MALE, 'name' => 'gender', 'label' => 'Male']));
        }

        if (!empty($entity) && $entity->getGender() == Users::GENDER_FEMALE ||
            $this->request->getPost('gender') == Users::GENDER_FEMALE
        ) {
            $this->add(
                new Radio(
                    'genderFemale',
                    ['value' => Users::GENDER_FEMALE, 'checked' => 'checked', 'name' => 'gender', 'label' => 'Female']
                )
            );
        } else {
            $this->add(new Radio('genderFemale', ['value' => Users::GENDER_FEMALE, 'name' => 'gender']));
        }

        // Phanbook weekly digest
        if (!empty($entity) && $entity->getDigest() == Users::DIGEST_YES ||
            $this->request->getPost('digestYes') == Users::DIGEST_YES
        ) {
            $this->add(
                new Radio(
                    'digestYes',
                    ['value' => Users::DIGEST_YES, 'checked' => 'checked', 'name' => 'digest']
                )
            );
        } else {
            $this->add(new Radio('digestYes', ['value' => Users::DIGEST_YES, 'name' => 'digest']));
        }

        if (!empty($entity) && $entity->getDigest() == Users::DIGEST_NO ||
            $this->request->getPost('digest') == Users::DIGEST_NO
        ) {
            $this->add(
                new Radio(
                    'digestNo',
                    ['value' => Users::DIGEST_NO, 'checked' => 'checked', 'name' => 'digest']
                )
            );
        } else {
            $this->add(new Radio('digestNo', ['value' => Users::DIGEST_NO, 'name' => 'digest']));
        }

        // Notification
        $this->add(new Select(
            'notifications',
            [
                Users::NOTIFY_N => 'Never receive an e-mail notification',
                Users::NOTIFY_Y => 'Receive e-mail notifications from all new threads and comments',
                Users::NOTIFY_P => 'When someone replies to a discussion that I started or replied to'
            ]
        ));

        // Email
        $email = new Text(
            'email',
            [
                'placeholder' => 'Email',
                'required' => 'true',
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

        // Bio
        $bio = new TextArea(
            'bio',
            [
                'placeholder' => 'Please add Bio information of your',
                'required' => true,
                'class' => 'wmd-input',
                'id' => 'wmd-input',
                'rows' => 10
            ]
        );
        $bio->addValidators(
            [
                new PresenceOf(
                    [
                        'message' => 'The bio is required'
                    ]
                )
            ]
        );
        $this->add($bio);

        $twitter = new Text(
            'twitter',
            [
                'placeholder' => 'Please add twitTer of your',
            ]
        );
        $this->add($twitter);

        $github = new Text(
            'github',
            [
                'placeholder' => 'Please add github of your',
            ]
        );
        $this->add($github);

        // Birth date
        $birthDate = new Text(
            'birthDate',
            [
                'placeholder' => 'yyyy-mm-dd'
            ]
        );
        $birthDate->addValidators(
            [
                new BirthDate(
                    array(
                        'message' => t('Birthdate is invalid.')
                    )
                )
            ]
        );
        $this->add($birthDate);


        // Submit
        $this->add(
            new Submit(
                'save',
                [
                    'value' => 'Save',
                    'class' => 'btn btn-sm btn-info'
                ]
            )
        );
        $this->add(
            new Submit(
                'saveAvatar',
                [
                    'value' => 'Change avatar',
                    'class' => 'button color small login-submit submit'
                ]
            )
        );
    }
}
