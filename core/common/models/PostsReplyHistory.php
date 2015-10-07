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

use Phanbook\ModelsMyTimestampable;

class PostsReplyHistory extends ModelBase
{
    use MyTimestampable;
    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var integer
     */
    protected $postsReplyId;

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
     * Method to set the value of field postsReplyId
     *
     * @param  integer $postsReplyId
     * @return $this
     */
    public function setPostsReplyId($postsReplyId)
    {
        $this->postsReplyId = $postsReplyId;

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
     * Returns the value of field postsReplyId
     *
     * @return integer
     */
    public function getPostsReplyId()
    {
        return $this->postsReplyId;
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


    public function getSource()
    {
        return "postsReplyHistory";
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'postsReplyId' => 'postsReplyId',
            'usersId' => 'usersId',
            'createdAt' => 'createdAt',
            'content' => 'content'
        );
    }
}
