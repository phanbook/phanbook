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

use Phalcon\Mvc\Model\Behavior\Timestampable;

/**
 * To use Sends e-mails to users in the spool
 *
 * @property Phanbook\Models\Users        user
 * @property Phanbook\Models\Posts        post
 * @property Phanbook\Models\PostsReply   reply
 *
 * @see Phanbook\Mail\SendSpool
 */
class Notifications extends ModelBase
{
    //This is mean post reply
    const TYPE_REPLY  = 'R';

    //This is mean post
    const TYPE_POSTS = 'P';

    const TYPE_COMMENTS = 'C';
    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var integer
     */
    protected $usersId;

    /**
     *
     * @var integer
     */
    protected $postsId;

    /**
     *
     * @var integer
     */
    protected $postsReplyId;

    /**
     *
     * @var string
     */
    protected $type;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     *
     * @var integer
     */
    protected $modifiedAt;

    /**
     *
     * @var string
     */
    protected $messageId;

    /**
     *
     * @var string
     */
    protected $sent;

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
     * Method to set the value of field postsReplysId
     *
     * @param  integer $postsReplysId
     * @return $this
     */
    public function setPostsreplyId($postsReplyId)
    {
        $this->postsReplyId = $postsReplyId;

        return $this;
    }

    /**
     * Method to set the value of field type
     *
     * @param  string $type
     * @return $this
     */
    public function setType($type)
    {
        $this->type = $type;

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
     * Method to set the value of field modifiedAt
     *
     * @param  integer $modifiedAt
     * @return $this
     */
    public function setModifiedAt($modifiedAt)
    {
        $this->modifiedAt = $modifiedAt;

        return $this;
    }

    /**
     * Method to set the value of field messageId
     *
     * @param  string $messageId
     * @return $this
     */
    public function setMessageId($messageId)
    {
        $this->messageId = $messageId;

        return $this;
    }

    /**
     * Method to set the value of field sent
     *
     * @param  string $sent
     * @return $this
     */
    public function setSent($sent)
    {
        $this->sent = $sent;

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
     * Returns the value of field usersId
     *
     * @return integer
     */
    public function getUsersId()
    {
        return $this->usersId;
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
     * Returns the value of field postsReplysId
     *
     * @return integer
     */
    public function getPostsreplyId()
    {
        return $this->postsReplyId;
    }

    /**
     * Returns the value of field type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
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
     * Returns the value of field modifiedAt
     *
     * @return integer
     */
    public function getModifiedAt()
    {
        return $this->modifiedAt;
    }

    /**
     * Returns the value of field messageId
     *
     * @return string
     */
    public function getMessageId()
    {
        return $this->messageId;
    }

    /**
     * Returns the value of field sent
     *
     * @return string
     */
    public function getSent()
    {
        return $this->sent;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'notifications';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Notifications[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Notifications
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
    /**
     * Independent Column Mapping.
     * Keys are the real names in the table and the values their names in the application
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'usersId' => 'usersId',
            'postsId' => 'postsId',
            'postsReplyId' => 'postsReplyId',
            'type' => 'type',
            'createdAt' => 'createdAt',
            'modifiedAt' => 'modifiedAt',
            'messageId' => 'messageId',
            'sent' => 'sent'
        ];
    }
    public function beforeValidationOnCreate()
    {
        $this->sent = 'N';
    }
    public function initialize()
    {
        $this->belongsTo('usersId', __NAMESPACE__ . '\Users', 'id', ['alias' => 'user']);
        $this->belongsTo('postsId', __NAMESPACE__ . '\Posts', 'id', ['alias' => 'post']);
        $this->belongsTo('postsReplyId', __NAMESPACE__ . '\PostsReply', 'id', ['alias' => 'reply']);
        $this->addBehavior(
            new Timestampable(
                [
                'beforeCreate' => [
                    'field' => 'createdAt'
                ],
                'beforeUpdate' => [
                    'field' => 'modifiedAt'
                ]
                ]
            )
        );
    }
}
