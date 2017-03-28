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
namespace Phanbook\Validators;

use Phalcon\Validation\Validator;
use Phalcon\Validation\ValidatorInterface;
use Phalcon\Validation\Message;

class Image extends Validator
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

        $allowedTypes = [
            'image/gif',
            'image/jpg',
            'image/png',
            'image/bmp',
            'image/jpeg'
        ];

        if (in_array($value[0]->getRealType(), $allowedTypes)) {
            return true;
        }

        $message = $this->getOption('message');
        if (!$message) {
            $message = 'Invalid file extension.';
        }

        $validator->appendMessage(new Message($message, $attribute, 'postcode'));

        return false;
    }
}
