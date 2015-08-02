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

use Phanbook\Models\MyTimestampable;

class ActivityNotifications extends ModelBase
{
    use MyTimestampable;

    /* This is mean post reply*/
    const TYPE_REPLY  = 'R';

    /**
 * This is mean post
*/
    const TYPE_POSTS = 'P';

    const TYPE_COMMENTS = 'C';

    const TYPE_BADGES = 'B';

    const TYPE_V = 'V';
    const TYPE_O = 'O';


    /**
     *
     * @var integer
     */
    protected $id;

    /**
     * This is field display in notification for other user, for example
     * Thien has reply in Count total records with limit, Thien is mean it get from userId
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
     * This is field of user recive notification
     *
     * @var integer
     */
    protected $usersOriginId;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     *
     * @var string
     */
    protected $wasRead;

    /**
     *
     * @var string
     */
    protected $extra;

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
     * Method to set the value of field usersOriginId
     *
     * @param  integer $usersOriginId
     * @return $this
     */
    public function setUsersOriginId($usersOriginId)
    {
        $this->usersOriginId = $usersOriginId;

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
     * Method to set the value of field wasRead
     *
     * @param  string $wasRead
     * @return $this
     */
    public function setWasRead($wasRead)
    {
        $this->wasRead = $wasRead;

        return $this;
    }

    /**
     * Method to set the value of field extra
     *
     * @param  string $extra
     * @return $this
     */
    public function setExtra($extra)
    {
        $this->extra = $extra;

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
     * Returns the value of field postsReplyId
     *
     * @return integer
     */
    public function getPostsReplyId()
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
     * Returns the value of field usersOriginId
     *
     * @return integer
     */
    public function getUsersOriginId()
    {
        return $this->usersOriginId;
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
     * Returns the value of field wasRead
     *
     * @return string
     */
    public function getWasRead()
    {
        return $this->wasRead;
    }

    /**
     * Returns the value of field extra
     *
     * @return string
     */
    public function getExtra()
    {
        return $this->extra;
    }

    /**
     * Initialize method for model.
     */
    public function getSource()
    {
        return 'activityNotifications';
    }

    public function initialize()
    {
        $this->belongsTo('usersId', __NAMESPACE__ . '\Users', 'id', ['alias' => 'user']);
        $this->belongsTo('usersOriginId', __NAMESPACE__ . '\Users', 'id', ['alias' => 'userOrigin']);
        $this->belongsTo('postsId', __NAMESPACE__ . '\Posts', 'id', ['alias' => 'post']);
        $this->belongsTo('postsReplyId', __NAMESPACE__ . '\Posts', 'id', ['alias' => 'reply']);
    }
    /**
     * @return Activitynotifications[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Activitynotifications
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    public function beforeValidationOnCreate()
    {
        $this->wasRead = 'N';
    }
    public function markAsRead()
    {
        if ($this->wasRad == 'N') {
            $this->wasRead = 'Y';
            $this->save();
        }
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'usersId' => 'usersId',
            'postsId' => 'postsId',
            'postsReplyId' => 'postsReplyId',
            'type' => 'type',
            'usersOriginId' => 'usersOriginId',
            'createdAt' => 'createdAt',
            'wasRead' => 'wasRead',
            'extra' => 'extra'
        ];
    }
}
