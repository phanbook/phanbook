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
use Phanbook\Models\Settings;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;

class GoogleAnalyticForm extends Form
{
    public function initialize($para, $analytic)
    {
        $trackingID = Settings::getAnalyticTrackingID();
        $accountID = Settings::getAnalyticAccountID();
        // CSRF
        $csrf = new Hidden('csrf');
        $csrf->addValidator(
            new Identical(
                array(
                    'value' => $this->security->getSessionToken(),
                    'message' => t('CSRF validation failed')
                )
            )
        );
        $this->add($csrf);

        $this->add(
            new Submit(
                'save',
                [
                    'name' => 'save',
                    'value' => 'Save Changes',
                    'class' => 'btn btn-sm btn-info'
                ]
            )
        );
        $author = new Submit(
            'author',
            [
                'name' => 'author',
                'value' => 'Authorization',
                'class' => 'btn btn-sm btn-info'
            ]
        );
        $author->setLabel("Authorization this feature with Google");
        $this->add($author);

        $unauthor = new Submit(
            'unauthor',
            [
                'name' => 'unauthor',
                'value' => 'Clear Authorization',
                'class' => 'btn btn-sm btn-warning'
            ]
        );
        $unauthor->setLabel("This feature had been activated. Clear authorization?");
        $this->add($unauthor);

        $accessCode = new Text(
            'accessCode',
            [
                'placeholder' => t('Access Code'),
                'class' => 'form-control',
                'value' => ''
            ]
        );
        $accessCode->setLabel('Access Code');
        $this->add($accessCode);
        $listView = $analytic->getListView();
        $listViewDisplay = [];
        if ($listView['state']) {
            foreach ($listView['listView'] as $view) {
                $parse = parse_url($view['profileURL']);

                $item = $view['webPropertyId'] . "_._" . $view['accountID'];
                $value = $parse['host'] . " => " . $view['profileName'];

                $listViewDisplay[$item] = $value;
            }
        }
        $selectView = new Select(
            'selectView',
            $listViewDisplay,
            [
                'class' => 'form-control',
                'useEmpty' => true,
                'emptyText' => 'Please, choose one...'
            ]
        );
        $selectView->setLabel('Select View ');
        $selectView->setDefault($trackingID . "_._" . $accountID);
        $this->add($selectView);

        $data = Settings::getListTopActivity();
        $listTopActivity = [];
        $listDefaultActivity = [];
        foreach ($data as $activity) {
            $listTopActivity[$activity->code] = $activity->name;
            if ($activity->default == 1) {
                $listDefaultActivity[] = $activity->code;
            }
        }

        $topActivity = new Select(
            'topActivity',
            $listTopActivity,
            [
                'name' => 'topActivity[]',
                'class' => 'form-control',
                'multiple' => 'multiple'
            ]
        );
        $topActivity->setLabel('Select 4 activity on top of dashboard');
        $topActivity->setDefault($listDefaultActivity);
        $this->add($topActivity);
    }
}
