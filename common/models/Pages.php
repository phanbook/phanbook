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
namespace Phanbook\Models;

use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Message;
use Phanbook\Models\MyTimestampable;

class Pages extends ModelBase
{
    use MyTimestampable;

    /**
     *
     * @var integer
     */
    protected $id;


    /**
     *
     * @var string
     */
    protected $key;

    /**
     *
     * @var string
     */
    protected $title;
    /**
     *
     * @var string
     */
    protected $content;

    /**
     *
     * @var string
     */
    protected $createdAt;

    /**
     *
     * @var integer
     */
    protected $editedAt;
    /**
     * Method to set the value of field id
     *
     * @param integer $id
     *
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field title
     *
     * @param string $title
     *
     * @return $this
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Method to set the value of field key
     *
     * @param string $key
     *
     * @return $this
     */
    public function setKey($key)
    {
        $this->key = $key;

        return $this;
    }

    /**
     * Method to set the value of field content
     *
     * @param string $content
     *
     * @return $this
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Method to set the value of field createdAt
     *
     * @param  integer $createdAt
     * @return $this
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Method to set the value of field editedAt
     *
     * @param  integer $editedAt
     * @return $this
     */
    public function setEditedAt($editedAt)
    {
        $this->editedAt = $editedAt;

        return $this;
    }
    /**
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Returns the value of field key
     *
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }


    /**
     * Returns the value of field content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Returns the value of field createdAt
     *
     * @return integer
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }
    /**
     * Returns the value of field editedAt
     *
     * @return integer
     */
    public function getEditedAt()
    {
        return $this->editedAt;
    }
    public function getSource()
    {
        return 'pages';
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'      => 'id',
            'key'     => 'key',
            'title'   => 'title',
            'content' => 'content',
            'createdAt' => 'createdAt',
            'editedAt'  => 'editedAt'
        );
    }

    public function initialize()
    {
        $this->useDynamicUpdate(true);
    }

    public function validation()
    {
        $this->validate(
            new Uniqueness(
                array(
                    "field"   => array('key'),
                    "message" => t("Another template with the key you submitted already exists.")
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }
}
