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

use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\Identical;
use Phalcon\Validation\Validator\PresenceOf;

class ReplyForm extends Form
{
    public function initialize($entity = null)
    {
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
        }
        //content
        $content = new Textarea(
            'content',
            array(
            'placeholder' => t('Please be sure to answer the question. Provide details and share your research!'),
            'class'       => 'wmd-input',
            'id'           => 'wmd-input',
            'required'    => true,
            'rows'  =>10

            )
        );
        $content->addValidator(
            new PresenceOf(
                array(
                'message' => t('content is required.')
                )
            )
        );
        $this->add($content);

        $this->add(new Hidden('idObject'));
        $this->add(new Hidden('object'));

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

        //Submit
        $this->add(
            new Submit(
                'postAnswer',
                [
                'value' => t('Post Your Answer'),
                'class' => 'btn btn-sm btn-info'
                ]
            )
        );
    }
}
