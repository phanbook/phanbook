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

use Phalcon\Forms\Element\File;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;

class LogoForm extends Form
{
    public function initialize()
    {
        $file = new File('logo');
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
        $logoFrontend = new Hidden('logoFrontend', ['value' => 'logo']);
        $this->add($logoFrontend);
        //Backend
        $logoBackend = new Hidden('logoBackend', ['value' => 'logo_backend']);
        $this->add($logoBackend);
        //Logo login
        $logoLogin = new Hidden('logoLogin', ['value' => 'logo_login']);
        $this->add($logoLogin);

        //Logo Favicon
        $logoFavicon = new Hidden('logoFavicon', ['value' => 'favicon']);
        $this->add($logoFavicon);
        $this->add(
            new Submit(
                'changeLogo',
                [
                    'value' => 'Change Logo',
                    'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
