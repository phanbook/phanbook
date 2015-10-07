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

use Phalcon\Mvc\Model\Behavior\SoftDelete;

use Phanbook\Models\PostsViews;
use Phanbook\Models\PostsReply;
use Phanbook\Models\Notifications;
use Phanbook\Models\PostsNotifications;

class Posts extends ModelBase
{

    const POST_ALL       = 'all';
    const POST_BLOG      = 'blog';
    const POST_PAGE      = 'pages';
    const POST_QUESTIONS = 'questions';
    const POST_HACKERNEWS= 'hackernews';
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
    protected $type;

    /**
     *
     * @var string
     */
    protected $title;

    protected $link;

    /**
     *
     * @var string
     */
    protected $slug;

    /**
     *
     * @var string
     */
    protected $content;

    /**
     *
     * @var integer
     */
    protected $numberViews;

    /**
     *
     * @var integer
     */
    protected $numberReply;

    /**
     *
     * @var string
     */
    protected $sticked;

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
     * @var string
     */
    protected $status;

    /**
     *
     * @var string
     */
    protected $locked;

    /**
     *
     * @var integer
     */
    protected $deleted;

    /**
     *
     * @var string
     */
    protected $acceptedAnswer;

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
     * Method to set the value of field tagsId
     *
     * @param  integer $tagsId
     * @return $this
     */
    public function setType($type)
    {
        $this->type= $type;

        return $this;
    }

    /**
     * Method to set the value of field title
     *
     * @param  string $title
     * @return $this
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }
    public function setLink($link)
    {
        $this->link = $link;

        return $this;
    }

    /**
     * Method to set the value of field slug
     *
     * @param  string $slug
     * @return $this
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

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
     * Method to set the value of field numberViews
     *
     * @param  integer $numberViews
     * @return $this
     */
    public function setNumberViews($numberViews)
    {
        $this->numberViews = $numberViews;

        return $this;
    }

    /**
     * Method to set the value of field numberReply
     *
     * @param  integer $numberReply
     * @return $this
     */
    public function setNumberReply($numberReply)
    {
        $this->numberReply = $numberReply;

        return $this;
    }

    /**
     * Method to set the value of field sticked
     *
     * @param  string $sticked
     * @return $this
     */
    public function setSticked($sticked)
    {
        $this->sticked = $sticked;

        return $this;
    }

    /**
     * Method to set the value of field createdAt
     *
     * @param  integer $createdAt
     * @return $this
     */
    public function setCreatedaAt($createdAt)
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
     * Method to set the value of field status
     *
     * @param  string $status
     * @return $this
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Method to set the value of field locked
     *
     * @param  string $locked
     * @return $this
     */
    public function setLocked($locked)
    {
        $this->locked = $locked;

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
     * Method to set the value of field acceptedAnswer
     *
     * @param  string $acceptedAnswer
     * @return $this
     */
    public function setAcceptedAnswer($acceptedAnswer)
    {
        $this->acceptedAnswer = $acceptedAnswer;

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

    public function getType()
    {
        return $this->type;
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
    public function getLink()
    {
        return $this->link;
    }

    /**
     * Returns the value of field slug
     *
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
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
     * Returns the value of field numberViews
     *
     * @return integer
     */
    public function getNumberViews()
    {
        return $this->numberViews;
    }

    /**
     * Returns the value of field numberReply
     *
     * @return integer
     */
    public function getNumberReply()
    {
        return $this->numberReply;
    }

    /**
     * Returns the value of field sticked
     *
     * @return string
     */
    public function getSticked()
    {
        return $this->sticked;
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
     * Returns the value of field status
     *
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Returns the value of field locked
     *
     * @return string
     */
    public function getLocked()
    {
        return $this->locked;
    }

    /**
     * Returns the value of field deleted
     *
     * @return integer
     */
    public function getDeleted()
    {
        return $this->deleted;
    }

    /**
     * Returns the value of field acceptedAnswer
     *
     * @return string
     */
    public function getAcceptedAnswer()
    {
        return $this->acceptedAnswer;
    }

    /**
     * @return Posts[]
     */
    public static function find($parameters = array())
    {
        return parent::find($parameters);
    }

    /**
     * @return Posts
     */
    public static function findFirst($parameters = array())
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'usersId' => 'usersId',
            'type'  => 'type',
            'title' => 'title',
            'link'  => 'link',
            'slug' => 'slug',
            'content' => 'content',
            'numberViews' => 'numberViews',
            'numberReply' => 'numberReply',
            'sticked' => 'sticked',
            'createdAt' => 'createdAt',
            'modifiedAt' => 'modifiedAt',
            'editedAt' => 'editedAt',
            'status' => 'status',
            'locked' => 'locked',
            'deleted' => 'deleted',
            'acceptedAnswer' => 'acceptedAnswer'
        );
    }

    /**
     * Implement hook beforeValidationOnCreate
     */
    public function beforeValidationOnCreate()
    {
        $this->sticked     = 'N';
        $this->locked      = 'N';
        $this->status      = 'A';
        $this->deleted     = 0;
        $this->numberViews = 0;
        $this->numberReply = 0;
        $this->acceptedAnswer = 'N';


    }

    /**
     * Implement hook beforeCreate
     *
     * Create a posts-views logging the ipaddress where the post was created
     * This avoids that the same session counts as post view
     */
    public function beforeCreate()
    {
        $postView            = new PostsViews();
        $postView->setIpaddress($this->getDI()->getRequest()->getClientAddress());
        $this->postview      = $postView;

        $this->createdAt  = time();
        $this->modifiedAt = time();
    }
    /**
     * Implement hook beforeUpdate of Model Phalcon
     */
    public function beforeUpdate()
    {
        $this->modifiedAt = time();
    }
    /**
     * This method aids in setting up the model with a custom behavior i.e. a different table.
     * Is only called once during the request.
     */
    public function initialize()
    {
        $this->useDynamicUpdate(true);
        $this->belongsTo('id', __NAMESPACE__ . '\PostsHistory', 'postsId', ['alias' => 'postHistory']);
        $this->belongsTo('usersId', __NAMESPACE__ . '\Users', 'id', ['alias' => 'user', 'reusable' => true]);
        $this->hasMany('id', __NAMESPACE__ . '\Comment', 'objectId', ['alias' => 'comment']);
        $this->hasMany('id', __NAMESPACE__ . '\PostsViews', 'postsId', ['alias' => 'postview']);
        $this->hasMany('id', __NAMESPACE__ . '\PostsReply', 'postsId', ['alias' => 'replies']);
        $this->hasMany('id', __NAMESPACE__ . '\PostsSubscribers', 'postsId', ['alias' => 'postSubscriber']);


        $this->hasManyToMany(
            'id',
            __NAMESPACE__ . '\PostsTags',
            'postsId',
            'tagsId',
            __NAMESPACE__ . '\Tags',
            'id',
            ['alias' => 'tag']
        );
        //SoftDelete api Phalcon
        $this->addBehavior(
            new SoftDelete(
                array(
                'field' => 'deleted',
                'value' => time()
                )
            )
        );
    }
    /**
     * Implement hook beforeUpdate of Model Phalcon
     *
     * @return mixed
     */
    public function afterCreate()
    {
        if ($this->id > 0) {
            /**
             * Register the activity
             */
            $activity = new Activities();
            $activity->setUsersId($this->usersId);
            $activity->setPostsId($this->id);
            $activity->setType(Activities::NEW_POSTS);
            $activity->save();

            /**
             * Register the user in the post's notifications
             */
            $notification = new PostsNotifications();
            $notification->setUsersId($this->usersId);
            $notification->setPostsId($this->id);
            $notification->save();

            $toNotify = [];

            /**
             * Notify users that always want notifications
             */
            foreach (Users::find(['notifications = "Y"', 'columns' => 'id'])->toArray() as $user) {
                if ($this->usersId != $user['id']) {
                    $notificationId = $this->setNotification(
                        $user['id'],
                        $this->id,
                        null,
                        Notifications::TYPE_POSTS
                    );
                    $toNotify[$user['id']] = $notificationId;
                }
            }

            /**
             * Queue notifications to be sent
             */
            $this->getDI()->getQueue()->put($toNotify);
        }
    }
    /**
     * @return string
     */
    public function getHumanNumberViews()
    {
        $number = $this->numberViews;
        if ($number > 1000) {
            return round($number / 1000, 1) . 'k';
        } else {
            return $number;
        }
    }

    /**
     * @return bool|string
     */
    public function getHumanCreatedAt()
    {
        $diff = time() - $this->createdAt;
        if ($diff > (86400 * 30)) {
            return date('M \'y', $this->createdAt);
        } else {
            if ($diff > 86400) {
                return ((int)($diff / 86400)) . 'd ago';
            } else {
                if ($diff > 3600) {
                    return ((int)($diff / 3600)) . 'h ago';
                } else {
                    return ((int)($diff / 60)) . 'm ago';
                }
            }
        }
    }

    /**
     * @return bool|string
     */
    public function getHumanEditedAt()
    {
        $diff = time() - $this->editedAt;
        if ($diff > (86400 * 30)) {
            return date('M \'y', $this->editedAt);
        } else {
            if ($diff > 86400) {
                return ((int)($diff / 86400)) . 'd ago';
            } else {
                if ($diff > 3600) {
                    return ((int)($diff / 3600)) . 'h ago';
                } else {
                    return ((int)($diff / 60)) . 'm ago';
                }
            }
        }
    }

    /**
     * @return bool|string
     */
    public function getHumanModifiedAt()
    {
        if ($this->modifiedAt != $this->createdAt) {
            $diff = time() - $this->modifiedAt;
            if ($diff > (86400 * 30)) {
                return date('M \'y', $this->modifiedAt);
            } else {
                if ($diff > 86400) {
                    return ((int)($diff / 86400)) . 'd ago';
                } else {
                    if ($diff > 3600) {
                        return ((int)($diff / 3600)) . 'h ago';
                    } else {
                        return ((int)($diff / 60)) . 'm ago';
                    }
                }
            }
        }
        return false;
    }
    public static function getHotPosts()
    {
        $posts = Posts::query()
            ->where('deleted = 0')
            ->orderBy('numberReply DESC, modifiedAt DESC')
            ->limit(7)
            ->execute();
        if ($posts->valid()) {
            return $posts;
        }
        return false;
    }
    public static function getHotQuestion()
    {
        $posts = Posts::query()
            ->where('deleted = 0 AND type = "questions"')
            ->orderBy('numberReply DESC, modifiedAt DESC')
            ->limit(7)
            ->execute();
        if ($posts->valid()) {
            return $posts;
        }
        return false;
    }
    public static function getHotArticle()
    {
        $posts = Posts::query()
            ->where('deleted = 0 AND type = "blog"')
            ->orderBy('numberReply DESC, modifiedAt DESC')
            ->limit(7)
            ->execute();
        if ($posts->valid()) {
            return $posts;
        }
        return false;
    }
    /**
     * Checks if the post can have a bounty
     *
     * @return boolean
     */
    public function canHaveBounty()
    {
        $canHave = $this->acceptedAnswer != "Y"
            && $this->sticked != 'Y'
            && $this->numberReply == 0
            && $this->type != self::POST_HACKERNEWS;
            //&& $this->tagsId != 15;
            //@todo late for condition vote
            //(vote) >= 0;
        if ($canHave) {
            $diff = time() - $this->createdAt;
            if ($diff > 86400) {
                if ($diff < (86400 * 30)) {
                    return true;
                }
            } else {
                if ($diff < 3600) {
                    return true;
                }
            }
            return false;
        }
    }
    /**
     * Calculates a bounty for the post
     *
     * @return array|bool
     */
    public function getBounty()
    {
        $diff = time() - $this->createdAt;
        if ($diff > 86400) {
            if ($diff < (86400 * 30)) {
                //@sory this hardcode :)
                return ['type' => 'old', 'value' => 150 + intval($diff / 86400 * 3)];
            }
        } else {
            if ($diff < 3600) {
                return ['type' => 'fast-reply', 'value' => 100];
            }
        }
        return false;
    }
    /**
     * To checking isset class, the symbol _ maybe it will avoid method default Phalcon
     *
     * @return boolean
     */
    public function _isPost()
    {
        return true;
    }

    /**
     * @return array
     */
    public function getRecentUsers()
    {
        $users  = [$this->user->getId() => [$this->user->getUsername(), $this->user->getEmail()]];
        foreach ($this->getReplies(['order' => 'createdAt DESC', 'limit' => 3]) as $reply) {
            if (!isset($users[$reply->user->getId()])) {
                $users[$reply->user->getId()] = [$reply->user->getUsername(), $reply->user->getEmail()];
            }
        }
        return $users;
    }
}
