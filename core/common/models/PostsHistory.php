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

class PostsHistory extends ModelBase
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var integer
     */
    protected $postsId;

    /**
     *
     * @var integer
     */
    protected $usersId;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     *
     * @var string
     */
    protected $content;

    /**
     * Method to set the value of field id
     *
     * @param  integer $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field postsId
     *
     * @param  integer $postsId
     * @return $this
     */
    public function setPostsId($postsId)
    {
        $this->postsId = $postsId;

        return $this;
    }

    /**
     * Method to set the value of field usersId
     *
     * @param  integer $usersId
     * @return $this
     */
    public function setUsersId($usersId)
    {
        $this->usersId = $usersId;

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
     * Method to set the value of field content
     *
     * @param  string $content
     * @return $this
     */
    public function setContent($content)
    {
        $this->content = $content;

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
     * Returns the value of field postsId
     *
     * @return integer
     */
    public function getPostsId()
    {
        return $this->postsId;
    }

    /**
     * Returns the value of field usersId
     *
     * @return integer
     */
    public function getUsersId()
    {
        return $this->usersId;
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
     * Returns the value of field content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Initialize method for model.
     */
    public function getSource()
    {
        return 'postsHistory';
    }

    /**
     * @return Postshistory[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Postshistory
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    public function beforeValidation()
    {
        $this->createdAt = time();
    }
    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'postsId' => 'postsId',
            'usersId' => 'usersId',
            'createdAt' => 'createdAt',
            'content' => 'content'
        ];
    }
}
