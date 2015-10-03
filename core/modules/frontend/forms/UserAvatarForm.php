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

use Phalcon\Forms\Element\File;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;

class UserAvatarForm extends Form
{
    public function initialize()
    {
        $file = new File('avatar');
        $this->add($file);

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

        $this->add(
            new Submit(
                'changeAvatar',
                [
                'value' => 'Change avatar',
                'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
