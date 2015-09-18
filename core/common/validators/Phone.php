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

class Phone extends Validator
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

        if (empty($value) || preg_match('/^[0-9]{10}+$/', $value)) {
            return true;
        }

        $message = $this->getOption('message');
        if (!$message) {
            $message = 'The phone number is not valid';
        }

        $validator->appendMessage(new Message($message, $attribute, 'postcode'));

        return false;
    }
}
