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

use Phalcon\Validation;
use Phalcon\Validation\Message;
use Phalcon\Validation\Validator;

class BirthDate extends Validator
{
    /**
     * Executes the validation
     *
     * @param  Validation $validator
     * @param  string $attribute
     * @return boolean
     */
    public function validate(Validation $validator, $attribute)
    {
        $value = $validator->getValue($attribute);

        if (empty($value) || $value == '0000-00-00') {
            return true;
        }

        $pattern = '/^([0-9]{4})-((?:0?[1-9])|(?:1[0-2]))-((?:0?[1-9])|' .
            '(?:[1-2][0-9])|(?:3[01]))([0-9]{2}:[0-9]{2}:[0-9]{2})?$/';

        if (preg_match($pattern, $value, $birthDate)) {
            if ($birthDate[1] > date('Y') && $birthDate[2] > date('m') && $birthDate[3] > date('d')
                || $birthDate[1] == date('Y') && $birthDate[2] == date('m') && $birthDate[3] > date('d')
                || $birthDate[1] == date('Y') && $birthDate[2] > date('m')
            ) {
                $validator->appendMessage(
                    new Message($this->getOption('message', 'Birthdate is invalid'), $attribute, 'Birthdate')
                );

                return false;
            }
            return true;
        }

        $validator->appendMessage(
            new Message($this->getOption('message', 'Birthdate is invalid'), $attribute, 'Birthdate')
        );

        return false;
    }
}
