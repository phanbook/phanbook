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

use Phanbook\Models\ActivityNotifications;

class UsersBadges extends ModelBase
{
    /**
     * Gold badges recognize important contributions from members of the community.
     * They are rarely awarded.
     */
    const CODE = 1;
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
     * @var string
     */
    protected $badge;

    /**
     *
     * @var string
     */
    protected $type;

    /**
     * Gold badges recognize important contributions from members of the community.
     * @var integer
     */
    protected $code1;

    /**
     * Silver badges are less common than bronze ones.
     * @var integer
     */
    protected $code2;

    /**
     * Broneze badges encourage users to try out new features on the site.
     * @var integer
     */
    protected $code3;

    /**
     *
     * @var integer
     */
    protected $createdAt;

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
     * Method to set the value of field badge
     *
     * @param  string $badge
     * @return $this
     */
    public function setBadge($badge)
    {
        $this->badge = $badge;

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
     * Method to set the value of field code1
     *
     * @param  integer $code1
     * @return $this
     */
    public function setCode1($code1)
    {
        $this->code1 = $code1;

        return $this;
    }

    /**
     * Method to set the value of field code2
     *
     * @param  integer $code2
     * @return $this
     */
    public function setCode2($code2)
    {
        $this->code2 = $code2;

        return $this;
    }
    public function setCode3($code3)
    {
        $this->code3 = $code3;

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
     * Returns the value of field badge
     *
     * @return string
     */
    public function getBadge()
    {
        return $this->badge;
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
     * Returns the value of field code1
     *
     * @return integer
     */
    public function getCode1()
    {
        return $this->code1;
    }

    /**
     * Returns the value of field code2
     *
     * @return integer
     */
    public function getCode2()
    {
        return $this->code2;
    }
    public function getCode3()
    {
        return $this->code3;
    }
    /**
     * Returns the value of field createdAt
     *
     * @return integer
     */
    public function getCreatedat()
    {
        return $this->createdAt;
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->addBehavior(
            new Timestampable(
                [
                'beforeValidationOnCreate' => array(
                    'field' => 'createdAt'
                )
                ]
            )
        );
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'usersBadges';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Usersbadges[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Usersbadges
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
        return array(
            'id' => 'id',
            'usersId' => 'usersId',
            'badge' => 'badge',
            'type' => 'type',
            'code1' => 'code1',
            'code2' => 'code2',
            'code3' => 'code3',
            'createdAt' => 'createdAt'
        );
    }
    public function afterCreate()
    {
        $activity = new ActivityNotifications();
        $activity->setUsersId($this->usersId);
        if ($this->getType() == ActivityNotifications::TYPE_POSTS) {
            $activity->setType(ActivityNotifications::TYPE_O);
            $activity->setPostsId($this->code1);
            $activity->setPostsReplyId(0);
        } else {
            if ($this->getType() == ActivityNotifications::TYPE_COMMENTS) {
                $activity->setType(ActivityNotifications::TYPE_V);
                $activity->setPostsId($this->code2);
                $activity->setPostsReplyId($this->code1);
            } else {
                $activity->setType(ActivityNotifications::TYPE_BADGES);
                $activity->setPostsId(1);
                $activity->setPostsReplyId(1);
            }
        }
        $activity->setExtra($this->badge);
        $activity->setUsersOriginId($this->usersId);
        var_dump($activity->save());
    }
}
