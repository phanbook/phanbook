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
namespace Phanbook\Backend\Forms;

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;
use Phanbook\Models\Settings;

class DashboardForm extends Form
{
    public function initialize()
    {

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

        $unauthor = new Submit(
            'unauthor',
            [
                'name'  =>  'unauthor',
                'value' => 'Go to setting',
                'class' => 'btn btn-sm btn-warning'
            ]
        );
        $unauthor->setLabel("This feature need to be configured");
        $this->add($unauthor);

        $profile = new Submit(
            'profile',
            [
                'name'  =>  'profile',
                'value' => 'Go to setting',
                'class' => 'btn btn-sm btn-warning'
            ]
        );
        $profile->setLabel("You must select view before use this feature");
        $this->add($profile);

    }
}
