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
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Select;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phanbook\Models\Province;

class QuestionsForm extends Form
{
    public function initialize($entity = null)
    {
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
        }

        //title
        $title = new Text(
            'title',
            array(
            'placeholder' => t('title'),
            'class'       => 'form-control',
            'required'    => true
            )
        );
        $title->addValidator(
            new PresenceOf(
                array(
                'message' => t('The title is required.')
                )
            )
        );
        $this->add($title);

        $tags = new Hidden(
            'tags',
            array(
            'required'    => true
            )
        );
        $tags->addValidator(
            new PresenceOf(
                array(
                'message' => t('The title is required.')
                )
            )
        );
        $this->add($tags);

        //content
        $content = new Textarea(
            'content',
            array(
            'placeholder' => t('Please be sure to answer the question. Provide details and share your research!'),
            'class'       => 'wmd-input',
            'id'          => 'wmd-input',
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

        $this->add(new Hidden('object'));

        // To compare the post is question or tip
        $this->add(new Hidden('type'));
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
                array(
                'class' => 'btn btn-sm btn-success',
                'value' => t('Submit Post')
                )
            )
        );
    }
}
