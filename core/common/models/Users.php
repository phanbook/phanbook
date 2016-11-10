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

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;

/**
 * \Phanbook\Models\Users
 *
 * @method static Users|false findFirstById(int $id)
 * @method static Users|false findFirstByUsername(string $name)
 *
 * @package Phanbook\Models
 */
class Users extends ModelBase
{
    const STATUS_ACTIVE   = 1;
    const STATUS_DISABLED = 2;
    const STATUS_PENDING  = 3;
    const STATUS_INACTIVE = 4;

    const GENDER_UNKNOWN = 9;
    const GENDER_MALE    = 1;
    const GENDER_FEMALE  = 2;

    const DIGEST_YES = 'Y';
    const DIGEST_NO  = 'N';

    //Never receive an e-mail notification
    const NOTIFY_N = 'N';
    //Receive e-mail notifications from all new threads and comments
    const NOTIFY_Y = 'Y';
    //When someone replies to a discussion that I started or replied to
    const NOTIFY_P = 'P';

    const TOKEN_TYPE = 'bearer';
    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $username;

    /**
     *
     * @var string
     */
    protected $email;

    /**
     *
     * @var string
     */
    protected $firstname;

    /**
     *
     * @var string
     */
    protected $lastname;

    /**
     *
     * @var string
     */
    protected $tokenType;

    /**
     *
     * @var string
     */
    protected $tokenGithub;

    /**
     * @var string
     */
    protected $tokenGoogle;

    /**
     * @var string
     */
    protected $tokenFacebook;

    /**
     * @var string
     */
    protected $uid;

    /**
     * @var string
     */
    protected $uuidGithub;

    /**
     * @var string
     */
    protected $uuidGoogle;

    /**
     * @var string
     */
    protected $uuidFacebook;
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
    protected $notifications = 'Y';

    /**
     *
     * @var string
     */
    protected $digest = 'Y';

    /**
     *
     * @var string
     */
    protected $timezone = 'UTC';

    /**
     *
     * @var string
     */
    protected $moderator = 'N';

    /**
     *
     * @var string
     */
    protected $admin ='N';

    /**
     *
     * @var integer
     */
    protected $karma;

    /**
     * To check condition for allow comment or vote
     *
     * @var integer
     */
    protected $vote;

    /**
     * It will decrease or increase vote see function @afterValidation
     * @var integer
     */
    protected $votePoint;

    /**
     * 9-unknown,1-male,2-female
     *
     * @var integer
     */
    protected $gender = 9;

    /**
     *
     * @var string
     */
    protected $birthdate;

    /**
     *
     * @var string
     */
    protected $passwd;

    /**
     *
     * @var string
     */
    protected $registerHash;

    /**
     *
     * @var string
     */
    protected $passwdForgotHash;

    /**
     *
     * @var integer
     */
    protected $lastPasswdReset;

    /**
     *
     * @var integer
     */
    protected $status = 3;

    /**
     *
     * @var string
     */
    protected $theme = 'D';

    protected $bio;
    protected $github;
    protected $twitter;
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
     * Method to set the value of field username
     *
     * @param  string $username
     * @return $this
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Method to set the value of field email
     *
     * @param  string $email
     * @return $this
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Method to set the value of field firstname
     *
     * @param  string $firstname
     * @return $this
     */
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;

        return $this;
    }

    /**
     * Method to set the value of field lastname
     *
     * @param  string $lastname
     * @return $this
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Method to set the value of field tokenType
     *
     * @param  string $tokenType
     * @return $this
     */
    public function setTokenType($tokenType)
    {
        $this->tokenType = $tokenType;

        return $this;
    }
    public function setTokenGoogle($tokenGoogle)
    {
        $this->tokenGoogle = $tokenGoogle;

        return $this;
    }
    public function setTokenFacebook($tokenFacebook)
    {
        $this->tokenFacebook = $tokenFacebook;

        return $this;
    }
    public function setUid($uid)
    {
        $this->uid = $uid;

        return $this;
    }

    /**
     * @param  string $uuidFacebook
     * @return $this
     */
    public function setUuidFacebook($uuidFacebook)
    {
        $this->uuidFacebook = $uuidFacebook;

        return $this;
    }

    /**
     * @param  string $uuidGithub
     * @return $this
     */
    public function setUuidGithub($uuidGithub)
    {
        $this->uuidGithub = $uuidGithub;

        return $this;
    }

    /**
     * @param  string $uuidGoogle
     * @return $this
     */
    public function setUuidGoogle($uuidGoogle)
    {
        $this->uuidGoogle = $uuidGoogle;

        return $this;
    }
    /**
     * Method to set the value of field tokenGithub
     *
     * @param  string $tokenGithub
     * @return $this
     */
    public function setTokenGithub($tokenGithub)
    {
        $this->tokenGithub = $tokenGithub;

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
     * Method to set the value of field notifications
     *
     * @param  string $notifications
     * @return $this
     */
    public function setNotifications($notifications)
    {
        $this->notifications = $notifications;

        return $this;
    }

    /**
     * Method to set the value of field digest
     *
     * @param  string $digest
     * @return $this
     */
    public function setDigest($digest)
    {
        $this->digest = $digest;

        return $this;
    }

    /**
     * Method to set the value of field timezone
     *
     * @param  string $timezone
     * @return $this
     */
    public function setTimezone($timezone)
    {
        $this->timezone = $timezone;

        return $this;
    }

    /**
     * Method to set the value of field moderator
     *
     * @param  string $moderator
     * @return $this
     */
    public function setModerator($moderator)
    {
        $this->moderator = $moderator;

        return $this;
    }

    /**
     * Method to set the value of field admin
     *
     * @param  string $admin
     * @return $this
     */
    public function setAdmin($admin)
    {
        $this->admin = $admin;

        return $this;
    }

    /**
     * Method to set the value of field karma
     *
     * @param  integer $karma
     * @return $this
     */
    public function setKarma($karma)
    {
        $this->karma = $karma;

        return $this;
    }

    /**
     * Method to set the value of field votes
     *
     * @param  integer $vote
     * @return $this
     */
    public function setVote($vote)
    {
        $this->vote = $vote;

        return $this;
    }

    /**
     * Method to set the value of field votesPoints
     *
     * @param  integer $votePoint
     * @return $this
     */
    public function setVotepoint($votePoint)
    {
        $this->votePoint = $votePoint;

        return $this;
    }

    /**
     * Method to set the value of field gender
     *
     * @param  integer $gender
     * @return $this
     */
    public function setGender($gender)
    {
        $this->gender = $gender;

        return $this;
    }

    /**
     * Method to set the value of field birthdate
     *
     * @param  string $birthdate
     * @return $this
     */
    public function setBirthdate($birthdate)
    {
        $this->birthdate = $birthdate;

        return $this;
    }

    /**
     * Method to set the value of field passwd
     *
     * @param  string $passwd
     * @return $this
     */
    public function setPasswd($passwd)
    {
        $this->passwd = $passwd;

        return $this;
    }

    /**
     * Method to set the value of field registerHash
     *
     * @param  string $registerHash
     * @return $this
     */
    public function setRegisterhash($registerHash)
    {
        $this->registerHash = $registerHash;

        return $this;
    }

    /**
     * Method to set the value of field passwdForgotHash
     *
     * @param  string $passwdForgotHash
     * @return $this
     */
    public function setPasswdforgothash($passwdForgotHash)
    {
        $this->passwdForgotHash = $passwdForgotHash;

        return $this;
    }

    /**
     * Method to set the value of field lastPasswdReset
     *
     * @param  integer $lastPasswdReset
     * @return $this
     */
    public function setLastPasswdReset($lastPasswdReset)
    {
        $this->lastPasswdReset = $lastPasswdReset;

        return $this;
    }

    /**
     * Method to set the value of field status
     *
     * @param  integer $status
     * @return $this
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Method to set the value of field theme
     *
     * @param  string $theme
     * @return $this
     */
    public function setTheme($theme)
    {
        $this->theme = $theme;

        return $this;
    }
    /**
     * Method to set the value of field bio
     *
     * @param  string $bio
     * @return $this
     */
    public function setBio($bio)
    {
        $this->bio = $bio;

        return $this;
    }

    public function setTwitter($twitter)
    {
        $this->twitter = $twitter;
        return $this;
    }

    public function setGithub($github)
    {
        $this->github = $github;
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
     * Returns the value of field username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Returns the value of field email
     *
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Returns the value of field firstname
     *
     * @return string
     */
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * Returns the value of field lastname
     *
     * @return string
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Returns the value of field tokenType
     *
     * @return string
     */
    public function getTokenType()
    {
        return $this->tokenType;
    }

    /**
     * Returns the value of field tokenGithub
     *
     * @return string
     */
    public function getTokenGithub()
    {
        return $this->tokenGithub;
    }

    /**
     * @return string
     */
    public function getTokenGoogle()
    {
        return $this->tokenGoogle;
    }

    /**
     * @return string
     */
    public function getTokenFacebook()
    {
        return $this->tokenFacebook;
    }

    /**
     * @return string
     */
    public function getUId()
    {
        return $this->uid;
    }

    /**
     * @return string
     */
    public function getUuidFacebook()
    {
        return $this->uuidFacebook;
    }

    /**
     * @return string
     */
    public function getUuidGithub()
    {
        return $this->uuidGithub;
    }

    /**
     * @return string
     */
    public function getUuidGoogle()
    {
        return $this->uuidGoogle;
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
     * Returns the value of field notifications
     *
     * @return string
     */
    public function getNotifications()
    {
        return $this->notifications;
    }

    /**
     * Returns the value of field digest
     *
     * @return string
     */
    public function getDigest()
    {
        return $this->digest;
    }

    /**
     * Returns the value of field timezone
     *
     * @return string
     */
    public function getTimezone()
    {
        return $this->timezone;
    }

    /**
     * Returns the value of field moderator
     *
     * @return string
     */
    public function getModerator()
    {
        return $this->moderator;
    }

    /**
     * Returns the value of field admin
     *
     * @return string
     */
    public function getAdmin()
    {
        return $this->admin;
    }

    /**
     * Returns the value of field karma
     *
     * @return integer
     */
    public function getKarma()
    {
        return $this->karma;
    }

    /**
     * Returns the value of field votes
     *
     * @return integer
     */
    public function getVote()
    {
        return $this->vote;
    }

    /**
     * Returns the value of field votesPoints
     *
     * @return integer
     */
    public function getVotePoint()
    {
        return $this->votePoint;
    }

    /**
     * Returns the value of field gender
     *
     * @return integer
     */
    public function getGender()
    {
        return $this->gender;
    }

    /**
     * Returns the value of field birthdate
     *
     * @return string
     */
    public function getBirthdate()
    {
        return $this->birthdate;
    }

    /**
     * Returns the value of field passwd
     *
     * @return string
     */
    public function getPasswd()
    {
        return $this->passwd;
    }

    /**
     * Returns the value of field registerHash
     *
     * @return string
     */
    public function getRegisterhash()
    {
        return $this->registerHash;
    }

    /**
     * Returns the value of field passwdForgotHash
     *
     * @return string
     */
    public function getPasswdforgothash()
    {
        return $this->passwdForgotHash;
    }

    /**
     * Returns the value of field lastPasswdReset
     *
     * @return integer
     */
    public function getLastpasswdreset()
    {
        return $this->lastPasswdReset;
    }

    /**
     * Returns the value of field status
     *
     * @return integer
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Returns the value of field theme
     *
     * @return string
     */
    public function getTheme()
    {
        return $this->theme;
    }

    public function getBio()
    {
        return $this->bio;
    }

    public function getTwitter()
    {
        return $this->twitter;
    }

    public function getGithub()
    {
        return $this->github;
    }

    /**
     * Validations and business logic
     */
    public function validation()
    {

        $validator = new Validation();
        $validator->add(
            'email',
            new EmailValidator([
                'model' => $this,
                'message' => 'Please enter a correct email address'
            ])
        );
        $validator->add(
            'email',
            new UniquenessValidator([
                'model' => $this,
                'message' => 'Another user with same email already exists'
            ])
        );

        $validator->add(
            'username',
            new UniquenessValidator([
                'model' => $this,
                'message' => 'Another user with same username already exists'
            ])
        );

        return $this->validate($validator);
    }

    /**
     * @return array
     */
    public static function getStatusesWithLabels()
    {
        return [
            self::STATUS_INACTIVE => t('Inactive'),
            self::STATUS_ACTIVE   => t('Active'),
            self::STATUS_DISABLED => t('Disabled'),
            self::STATUS_PENDING  => t('Pending')
        ];
    }

    /**
     * @return array
     */
    public static function getGendersWithLabels()
    {
        return [
            self::GENDER_UNKNOWN => t('Unknown'),
            self::GENDER_MALE    => t('Male'),
            self::GENDER_FEMALE  => t('Female')
        ];
    }

    /**
     * @param $string
     * @return bool|\Phalcon\Mvc\ModelInterface
     */
    public static function findByEmailOrUsername($string)
    {
        $user = Users::query()
            ->where('email = :string:')
            ->orWhere('username = :string:')
            ->bind(['string' => $string])
            ->limit(1)
            ->execute();

        if ($user->valid()) {
            return $user->getFirst();
        }

        return false;
    }
    /**
     * Before create the user assign a password
     */
    public function beforeValidationOnCreate()
    {
        if (empty($this->passwd)) {
            // Generate a plain temporary password
            $tempPassword = preg_replace('/[^a-zA-Z0-9]/', '', base64_encode(openssl_random_pseudo_bytes(12)));

            // The user must change its password in first login
            $this->mustChangePassword = 'Y';

            // Use this password as default
            $this->passwd = $this->getDI()
                ->getSecurity()
                ->hash($tempPassword);
        }
    }
    /**
    * Create a posts-views logging the ipaddress where the post was created
    * This avoids that the same session counts as post view
    */
    public function beforeCreate()
    {
        if (empty($this->birthdate) || $this->birthdate == '0000-00-00') {
            $this->birthdate = null;
        }

        $this->karma       += Karma::INITIAL_KARMA;
        $this->votePoint   += Karma::INITIAL_KARMA;
        $this->vote         = 0;
        $this->timezone     = 'Europe/London';
        $this->theme        = 'D';
        $this->modifiedAt   = time();
        $this->createdAt    = time();
    }

    public function afterValidation()
    {
        if ($this->votePoint >= 50) {
            $this->vote++;
            $this->votePoint = 0;
        }
    }

    public function afterCreate()
    {
        if ($this->id > 0) {
            $activity           = new Activities();
            $activity->setUsersId($this->id);
            $activity->type     = Activities::NEW_USER;
            $activity->save();
        }
    }

    /**
     * Implement hook beforeUpdate of Model Phalcon
     */
    public function beforeUpdate()
    {
        if (empty($this->birthdate) || $this->birthdate == '0000-00-00') {
            $this->birthdate = null;
        }

        $this->modifiedAt = time();
    }

    public function initialize()
    {
        parent::initialize();
        $this->hasMany(
            'id',
            __NAMESPACE__ . '\UsersBadges',
            'usersId',
            [
                'alias' => 'badges',
                'reusable' => true
            ]
        );

        $this->hasMany(
            'id',
            __NAMESPACE__ . '\Posts',
            'usersId',
            [
                'alias' => 'posts',
                'reusable' => true
            ]
        );

        $this->hasMany(
            'id',
            __NAMESPACE__ . '\PostsReply',
            'usersId',
            [
                'alias' => 'replies',
                'reusable' => true
            ]
        );
        $this->hasMany(
            'id',
            __NAMESPACE__ . '\Vote',
            'usersId',
            [
                'alias' => 'vote',
                'reusable' => true
            ]
        );
    }

    /**
     * @param $karma
     */
    public function increaseKarma($karma)
    {
        $this->karma += $karma;
        $this->votePoint += $karma;
    }

    /**
     * @param $karma
     */
    public function decreaseKarma($karma)
    {
        $this->karma -= $karma;
        $this->votePoint -= $karma;
    }

    /**
     * Get information username
     *
     * @return string
     */
    public function getInforUser()
    {
        if ($this->firstname) {
            return $this->firstname;
        }
        return $this->username;
    }

    /**
     * Get information full name
     *
     * @return string
     */
    public function getFullName()
    {
        if ($this->firstname && $this->lastname) {
            return $this->firstname . " " . $this->lastname;
        } elseif ($this->firstname) {
            return $this->firstname;
        }
        return $this->username;
    }

    /**
     * Get information editor user
     *
     * @return mixed|bool
     */
    public function getUserById($id)
    {
        $user = Users::query()
            ->where('id = :id:')
            ->bind(['id' => $id])
            ->limit(1)
            ->execute();
        if ($user->valid()) {
            return $user->getFirst();
        }

        return false;
    }

    /**
     * @return string
     */
    public function getHumanKarma()
    {
        if ($this->karma >= 1000) {
            return sprintf("%.1f", $this->karma / 1000) . 'k';
        } else {
            return $this->karma;
        }
    }

    /**
     * @param int $limit
     * @return \Phalcon\Mvc\Model\ResultsetInterface
     */
    public static function highestKarma($limit = 4)
    {
        $user = Users::query()
            ->limit($limit)
            ->order('karma DESC')
            ->execute();
        if ($user->valid()) {
            return $user;
        }
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'                => 'id',
            'username'          => 'username',
            'email'             => 'email',
            'firstname'         => 'firstname',
            'lastname'          => 'lastname',
            'tokenType'         => 'tokenType',
            'tokenGithub'       => 'tokenGithub',
            'tokenGoogle'       => 'tokenGoogle',
            'tokenFacebook'     => 'tokenFacebook',
            'uid'               => 'uid',
            'uuidGithub'        => 'uuidGithub',
            'uuidGoogle'        => 'uuidGoogle',
            'uuidFacebook'      => 'uuidFacebook',
            'createdAt'         => 'createdAt',
            'modifiedAt'        => 'modifiedAt',
            'notifications'     => 'notifications',
            'digest'            => 'digest',
            'timezone'          => 'timezone',
            'moderator'         => 'moderator',
            'admin'             => 'admin',
            'karma'             => 'karma',
            'vote'              => 'vote',
            'votePoint'         => 'votePoint',
            'gender'            => 'gender',
            'birthdate'         => 'birthdate',
            'passwd'            => 'passwd',
            'registerHash'      => 'registerHash',
            'passwdForgotHash'  => 'passwdForgotHash',
            'lastPasswdReset'   => 'lastPasswdReset',
            'status'            => 'status',
            'theme'             => 'theme',
            'bio'               => 'bio',
            'twitter'           => 'twitter',
            'github'            => 'github'
        );
    }
}
