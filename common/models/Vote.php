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

use Phalcon\Mvc\Model\Validator\Email as Email;
use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Validator\InclusionIn;

class Vote extends ModelBase
{

    const OBJECT_POSTS       = 'posts';
    const OBJECT_COMMENTS    = 'comments';
    const OBJECT_POSTS_REPLY = 'postsReply';

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
    protected $objectId;

    /**
     *
     * @var string
     */
    protected $object;

    /**
     *
     * @var integer
     */
    protected $positive;

    /**
     *
     * @var integer
     */
    protected $negative;

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
     * Method to set the value of field objectId
     *
     * @param  integer $objectId
     * @return $this
     */
    public function setObjectId($objectId)
    {
        $this->objectId = $objectId;

        return $this;
    }

    /**
     * Method to set the value of field object
     *
     * @param  string $object
     * @return $this
     */
    public function setObject($object)
    {
        $this->object = $object;

        return $this;
    }

    /**
     * Method to set the value of field positive
     *
     * @param  integer $positive
     * @return $this
     */
    public function setPositive($positive)
    {
        $this->positive = $positive;

        return $this;
    }

    /**
     * Method to set the value of field negative
     *
     * @param  integer $negative
     * @return $this
     */
    public function setNegative($negative)
    {
        $this->negative = $negative;

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
     * Returns the value of field userId
     *
     * @return integer
     */
    public function getUsersId()
    {
        return $this->usersId;
    }

    /**
     * Returns the value of field objectId
     *
     * @return integer
     */
    public function getObjectId()
    {
        return $this->objectId;
    }

    /**
     * Returns the value of field object
     *
     * @return string
     */
    public function getObject()
    {
        return $this->object;
    }

    /**
     * Returns the value of field positive
     *
     * @return integer
     */
    public function getPositive()
    {
        return $this->positive;
    }

    /**
     * Returns the value of field negative
     *
     * @return integer
     */
    public function getNegative()
    {
        return $this->negative;
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
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return [
            'id'        => 'id',
            'usersId'   => 'usersId',
            'objectId'  => 'objectId',
            'object'    => 'object',
            'positive'  => 'positive',
            'negative'  => 'negative',
            'createdAt' => 'createdAt'
        ];
    }

    public function initialize()
    {
        $this->useDynamicUpdate(true);
        $this->hasOne('objectId', __NAMESPACE__ . '\Posts', 'id', ['alias' => 'post']);
    }

    public function validation()
    {
        $this->validate(
            new Uniqueness(
                [
                    "field"   => ['usersId', 'objectId', 'object'],
                    "message" => t("You already voted.")
                ]
            )
        );

        $this->validate(
            new InclusionIn(
                [
                    'field'   => 'object',
                    'message' => t('Invalid object type.'),
                    'domain'  => array_flip(self::getObjectsWithLabels())
                ]
            )
        );

        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    public static function getObjectsWithLabels()
    {
        return [
            self::OBJECT_POSTS      => t('Posts'),
            self::OBJECT_COMMENTS    => t('Comments'),
            self::OBJECT_POSTS_REPLY => t('Posts Reply')
        ];
    }

    /**
     * hook beforeValidationOnCreate
     */
    public function beforeValidationOnCreate()
    {
        $auth = \Phalcon\DI::getDefault()->getAuth();
        $this->createdAt = time();
        $this->usersId = $auth->getAuth()['id'];
    }

    /**
     * Implements hook beforeValidationOnUpdate
     *
     * Sets the timestamp before update the confirmation
     */
    public function beforeValidationOnUpdate()
    {
        $this->createdAt = time();
    }
    /**
     * Add Vote up or down for the post
     *
     * @param  integer $objectId this is id of posts
     * @param  string  $object   there are some object comments, posts, postsReplay see constant the above
     * @param  string  $way      positive or negative
     * @return boolen|array
     */
    public static function vote($objectId, $object, $way)
    {
        $auth = \Phalcon\DI::getDefault()->getAuth();
        $conditions = [
            'usersId = :usersId: AND objectId = :objectId: AND object = :object:',
            'bind' => ['usersId' => $auth->getAuth()['id'], 'objectId' => $objectId, 'object' => $object]
        ];

        if (!$vote = Vote::findFirst($conditions)) {
            $vote = new self;
        }
        // When the posts have vote then user is existing
        if ($vote->getUsersId()) {
            switch ($object) {
                case Vote::OBJECT_POSTS:
                    return ['type'    => 'error', 'content' => t('You have already voted this post')];
                    break;
                default:
                    return ['type'    => 'error', 'content' => t('You have already voted this post reply')];
                    break;
            }
        }
        if ($way == 'positive') {
            $vote->voteUp($objectId, $object);
        }
        if ($way == 'negative') {
            $vote->voteDown($objectId, $object);
        }

        if (!$vote->save()) {
            foreach ($vote->getMessages() as $m) {
                error_log($m->getMessage());
                //return ['type' => 'error','content' => $m->getMessage()];
            }

            return false;
        }

        return true;
    }

    private function voteUp($objectId, $object)
    {
        if ((int)$this->getId() > 0) {
            if ($this->getNegative()) {
                $this->setNegative(0);
                $this->setPositive(1);
            } elseif ($this->getPositive()) {
                return $this->delete();
            }
        } else {
            $this->setPositive(1);
            $this->setNegative(0);
        }
        $this->setObjectId($objectId);
        $this->setObject($object);

        return true;
    }

    private function voteDown($objectId, $object)
    {
        if ((int)$this->getId() > 0) {
            if ($this->getPositive()) {
                $this->setPositive(0);
                $this->setNegative(1);
            } elseif ($this->getNegative()) {
                return $this->delete();
            }
        } else {
            $this->setNegative(1);
            $this->setPositive(0);
        }

        $this->setObjectId($objectId);
        $this->setObject($object);

        return true;
    }
}
