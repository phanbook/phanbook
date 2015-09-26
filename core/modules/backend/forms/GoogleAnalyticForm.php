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

class GoogleAnalyticForm extends Form
{
    public function initialize()
    {

        $analytic = new Text(
            'analytic',
            [
                'placeholder' => t('Google Analytic'),
                'class'       => 'form-control',
                'value'       => $this->config->googleAnalytic
            ]
        );
        $this->add($analytic);
        /* Google client ID */
        
        $clientID = new Text(
            'clientID',
            [
                'placeholder'   =>  t('Client ID'),
                'class'         =>  'form-control',
                'value'         =>  $this->config->google->clientId
            ]
        );
        $this->add($clientID);

        $clientSecret = new Text(
            'clientSecret',
            [
                'placeholder'   =>  t('Client Secret'),
                'class'         =>  'form-control',
                'value'         =>  $this->config->google->clientSecret
            ]
        );
        $this->add($clientSecret);

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
                'value' => 'Change analytic',
                'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
