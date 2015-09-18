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
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;

class ConfigurationsForm extends Form
{
    public function initialize($entity = null)
    {
        $config = $this->config->application;
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
        }

        //Name
        $name = new Text(
            'name',
            [
                'placeholder' => t('Name'),
                'class'       => 'form-control',
                'required'    => true,
                'value'       => $config->name
            ]
        );
        $name->addValidator(
            new PresenceOf(
                array(
                'message' => t('The name is required.')
                )
            )
        );
        $this->add($name);
        $publicUrl = new Text(
            'publicUrl',
            [
                'placeholder' => t('Site Address (URL)'),
                'class'       => 'form-control',
                'required'    => true,
                'value'       => $config->publicUrl
            ]
        );
        $publicUrl->addValidator(
            new PresenceOf(
                array(
                'message' => t('The name is required.')
                )
            )
        );
        $this->add($publicUrl);
        $tagline = new Text(
            'tagline',
            [
                'placeholder' => t('Tagline'),
                'class'       => 'form-control',
                'required'    => true,
                'value'       => $config->tagline
            ]
        );

        $this->add($tagline);

        // CSRF
        $csrf = new Hidden('csrf');

        $csrf->addValidator(
            new Identical(
                array(
                'value'   => $this->security->getSessionToken(),
                'message' => 'CSRF validation failed'
                )
            )
        );

        $this->add($csrf);

        $this->add(
            new Submit(
                'save',
                [
                    'class' => 'btn btn-sm btn-info',
                    'value' => 'Save'
                ]
            )
        );
    }
}
