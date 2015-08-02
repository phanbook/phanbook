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
use Phalcon\Mvc\Model\Behavior\SoftDelete;

use Phanbook\Models\User;
use Phanbook\Models\PostsSubscribers;
use Phanbook\Models\PostsNotifications;
use Phanbook\Models\ActivityNotifications;
use Phanbook\Models\Activities;

/**
 * Class PostsReplies
 *
 * @property Phanbook\Models\Posts        post
 * @property Phanbook\Models\Users        user
 *
 * @method static PostsReplies findFirstById
 * @method static PostsReplies findFirst($parameters = null)
 * @method static PostsReplies[] find($parameters = null)
 */
class PostsReply extends ModelBase
{

    /**
 * Maybe to add const like posts, but for now we don't need it
*/
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
     * @var string
     */
    protected $content;

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
     * @var integer
     */
    protected $editedAt;
    /**
     *
     * @var integer
     */
    protected $deleted;
    /**
     *
     * @var string
     */
    protected $accepted;

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
     * Method to set the value of field deleted
     *
     * @param  integer $deleted
     * @return $this
     */
    public function setDeleted($deleted)
    {
        $this->deleted = $deleted;

        return $this;
    }
    /**
     * Method to set the value of field accepted
     *
     * @param  string $accepted
     * @return $this
     */
    public function setAccepted($accepted)
    {
        $this->accepted = $accepted;

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
     * Returns the value of field modifiedAt
     *
     * @return integer
     */
    public function getModifiedAt()
    {
        return $this->modifiedAt;
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

    /**
     * Returns the value of field deleted
     *
     * @return string
     */
    public function getDeleted()
    {
        return $this->deleted;
    }
    /**
     * Returns the value of field accepted
     *
     * @return string
     */
    public function getAccepted()
    {
        return $this->accepted;
    }

    /**
     * @return Postsreply[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Postsreply
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    public function getSource()
    {
        return 'postsReply';
    }
    /**
     * To checking isset class
     * @return boolean
     */
    public function isReply()
    {
        return true;
    }
    public function initialize()
    {
        $this->belongsTo('postsId', __NAMESPACE__ . '\Posts', 'id', ['alias' => 'post', 'reusable' => true]);
        $this->belongsTo('usersId', __NAMESPACE__ . '\Users', 'id', ['alias' => 'user', 'reusable' => true]);
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
        //SoftDelete api Phalcon
        $this->addBehavior(
            new SoftDelete(
                [
                'field' => 'deleted',
                'value' => time()
                ]
            )
        );
    }
    /**
     * Implement hook beforeUpdate of Model Phalcon
     */
    public function beforeCreate()
    {
        $this->accepted = 'N';
    }
    public function afterCreate()
    {
        if ($this->id > 0) {
            $activity = new Activities();
            $activity->setUsersId($this->usersId);
            $activity->setPostsId($this->postsId);
            $activity->setType(Activities::NEW_REPLY);
            $activity->save();

            $toNotify = [];

            /**
             * Notify users that always want notifications
             */
            foreach (Users::find(['notifications = "Y"', 'columns' => 'id'])->toArray() as $user) {
                if ($this->usersId != $user['id']) {
                    $notificationId = $this->setNotification(
                        $user['id'],
                        $this->postsId,
                        $this->id,
                        Notifications::TYPE_REPLY
                    );

                    $this->setActivityNotifications(
                        $user['id'],
                        $this->postsId,
                        $this->id,
                        $this->usersId,
                        ActivityNotifications::TYPE_REPLY
                    );

                    $toNotify[$user['id']] = $notificationId;
                }
            }
            /**
             * Notify users that always want notifications for comment
             */

            /**
             * Register users subscribed to the post
             */
            foreach (PostsSubscribers::findByPostsId($this->postsId) as $subscriber) {
                if (!isset($toNotify[$subscriber->getUsersId()])) {
                    $notificationId = $this->setNotification(
                        $subscriber->getUsersId(),
                        $this->postsId,
                        $this->id,
                        Notifications::TYPE_REPLY
                    );

                    $this->setActivityNotifications(
                        $subscriber->getUsersId(),
                        $this->postsId,
                        $this->id,
                        $this->usersId,
                        ActivityNotifications::TYPE_REPLY
                    );
                    $toNotify[$subscriber->getUsersId()] = $notificationId;
                }
            }

            /**
             * Register the user in the post's notifications
             */
            if (!isset($toNotify[$this->usersId])) {
                $parameters       = [
                    'usersId = ?0 AND postsId = ?1',
                    'bind' => array($this->usersId, $this->postsId)
                ];
                $hasNotifications = PostsNotifications::count($parameters);

                if (!$hasNotifications) {
                    $notification = new PostsNotifications();
                    $notification->setUsersId($this->usersId);
                    $notification->setPostsId($this->postsId);
                    $notification->save();
                }
            }

            /**
             * Queue notifications to be sent
             */
            $this->getDI()->getQueue()->put($toNotify);
        }
    }
    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'        => 'id',
            'postsId'   => 'postsId',
            'usersId'   => 'usersId',
            'content'   => 'content',
            'createdAt' => 'createdAt',
            'modifiedAt'=> 'modifiedAt',
            'editedAt'  => 'editedAt',
            'deleted'   => 'deleted',
            'accepted'  => 'accepted'
        );
    }
}
