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
namespace Phanbook\Validators;

use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;
use Phalcon\Validation\Message;

class BirthDate extends Validator
{
    /**
     * Executes the validation
     *
     * @param  Phalcon\Validation $validator
     * @param  string             $attribute
     * @return boolean
     */
    public function validate(\Phalcon\Validation $validator, $attribute)
    {
        $value = $validator->getValue($attribute);

        if (empty($value) || $value == '0000-00-00') {
            return true;
        }

        if (preg_match('/^([0-9]{4})-((?:0?[1-9])|(?:1[0-2]))-((?:0?[1-9])|(?:[1-2][0-9])|(?:3[01]))([0-9]{2}:[0-9]{2}:[0-9]{2})?$/', $value, $birthDate)) {
            if ($birthDate[1] > date('Y') && $birthDate[2] > date('m') && $birthDate[3] > date('d')
                || $birthDate[1] == date('Y') && $birthDate[2] == date('m') && $birthDate[3] > date('d')
                || $birthDate[1] == date('Y') && $birthDate[2] > date('m')
            ) {
                $message = $this->getOption('message');
                if (!$message) {
                    $message = 'Birthdate is invalid';
                }

                $validator->appendMessage(new Message($message, $attribute, 'Birthdate'));

                return false;
            }
            return true;
        }

        $message = $this->getOption('message');
        if (!$message) {
            $message = 'Birthdate is invalid';
        }

        $validator->appendMessage(new Message($message, $attribute, 'Birthdate'));

        return false;
    }
}
