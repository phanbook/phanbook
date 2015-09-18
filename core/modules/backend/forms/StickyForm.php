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
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Forms\Element\Radio;
use Phalcon\Forms\Element\Text;

class StickyForm extends Form
{
    public function initialize($entity)
    {

        // In edit page the id is hidden
        if (!empty($entity)) {
            $checked = null;
            $this->add(new Hidden('id'));
            $this->add(new Radio('unSticky', ['value' => 'N', 'checked' => $checked, 'name' => 'sticked']));
            if ($entity->getSticked() == 'Y') {
                $checked = 'checked';
            }
            $this->add(new Radio('sticky', ['value' => 'Y', 'checked' => $checked, 'name' => 'sticked']));
        } else {
            $this->add(new Text('id'));
            $this->add(new Radio('sticky', ['value' => 'Y', 'name' => 'sticked']));
            $this->add(new Radio('unSticky', ['value' => 'N', 'name' => 'sticked']));
        }

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
                'save',
                [
                'value' => 'Save sticky',
                'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
