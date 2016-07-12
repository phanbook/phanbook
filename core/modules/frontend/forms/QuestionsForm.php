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

use Phanbook\Forms\FormBase;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Submit;
use Phalcon\Forms\Element\Hidden;
use Phalcon\Forms\Element\Textarea;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Identical;
use Phanbook\Models\Province;

class QuestionsForm extends FormBase
{
    public function initialize($entity = null)
    {
        // In edit page the id is hidden
        if (!is_null($entity)) {
            $this->add(new Hidden('id'));
            $this->tagsId = $entity->getTagsId();
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
            'id'          => 'question-details',
            'required'    => true,
            'rows'        => 8,
            'cols'        => 100,
            'data-provide'=> 'markdown',
            'data-iconlibrary' => 'fa',
            'required'    => true,
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


        $this->add(
            new Submit(
                'save',
                array(
                'class' => 'button color small submit',
                'id'    => 'publish-question',
                'value' => t('Publish Your Question')
                )
            )
        );
    }
}
