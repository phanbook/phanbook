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

use Phalcon\Mvc\Model;
use Phanbook\Tools\ZFunction;
use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;
use Phanbook\Models\Behavior\Blameable as ModelBlameable;

/**
 * Class ModelBase
 * It is common model basics for Mysql
 *
 * @package Phanbook\Models
 */
class ModelBase extends Model
{
    const OBJECT_POSTS = 'posts';
    const OBJECT_COMMENTS = 'comments';
    const OBJECT_POSTS_REPLIES = 'postsReplies';

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     * Toggle object status. 0 or 1
     *
     * @param $id - id of object to toggle
     * @param string  $column - column name for toggling - status by default
     */
    public function toggleObject($id, $column = 'status')
    {
    }

    public static function getBuilder()
    {
        $di = FactoryDefault::getDefault();

        return $di->get('modelsManager')->createBuilder();
    }

    public static function getConnection()
    {
        $di = FactoryDefault::getDefault();

        return $di->get('db');
    }

    /**
     * Generic method for deleting one or more rows based on primary key id and classname
     *
     * @param array|int $ids with object id
     * @param null  $model full class name. if null get classname automatically
     *
     * @return bool|void
     */
    public function deleteObject($ids, $model = null)
    {
    }

    /**
     * @param int $objectId
     * @param string $object
     *
     * @return mixed
     */
    public function getVotes($objectId, $object)
    {
        $sql = [
            'SELECT COALESCE(SUM(positive),0) AS positive, ',
            'COALESCE(SUM(negative),0) AS negative ',
            'FROM ' . Vote::class,
            'WHERE objectId = :objectId: AND object = :object:',
        ];

        return $this
            ->getModelsManager()
            ->executeQuery(implode('', $sql), ['objectId' => $objectId, 'object' => $object])
            ->getFirst()
            ->toArray();
    }

    public function getPostsWithVotes($postId = false)
    {
        $sql = 'SELECT p.*, pr.usersId as editorId, u.email,
            (SELECT COALESCE(SUM(v.positive),0) FROM  vote v  WHERE p.id = v.objectId AND v.object = ?) AS positive,
            (SELECT COALESCE(SUM(v.negative),0) FROM  vote v  WHERE p.id = v.objectId AND v.object = ?) AS negative
            FROM postsReply p
            LEFT JOIN postsReplyHistory pr ON p.id = pr.postsReplyId
            LEFT JOIN users u ON u.id = p.usersId
            WHERE p.postsId= ? AND p.deleted = 0
            GROUP BY p.id
            ORDER BY p.id DESC';

        $postsReply = new PostsReply();
        $params = [Vote::OBJECT_POSTS_REPLIES, Vote::OBJECT_POSTS_REPLIES, ($postId ? $postId : $this->getId())];
        $pdoResult  = $postsReply->getReadConnection()->query($sql, $params);
        return (new Resultset(null, $postsReply, $pdoResult));
    }

    /**
     * @param $objectId
     * @param $object
     *
     * @return mixed
     */
    public function getComments($objectId, $object)
    {
        $resultset = $this->getBuilder()
            ->from(array('c' => 'Phanbook\Models\Comment'))
            ->join('Phanbook\Models\Users', "u.id= c.userId", 'u')
            ->columns(['c.id, c.content, c.userId, c.createdAt, u.username, u.firstname'])
            ->where('objectId = :objectId:')
            ->andWhere('object = :object:')
            ->getQuery()
            ->execute(['object' => $object, 'objectId' => $objectId])->toArray();

        return $resultset;
    }

    /**
     * Set Notify users that always want notifications via Queueing jobs
     *
     * @param integer $userId      user want notification
     * @param integer $postId      [description]
     * @param integer $postReplyId [description]
     * @param string  $type        Such as Comment, reply...
     *
     * @return int|bool
     */
    public function setNotification($userId, $postId, $postReplyId, $type)
    {
        $notification = new Notifications();
        $notification->setUsersId($userId);
        $notification->setPostsId($postId);
        $notification->setPostsReplyId($postReplyId);
        $notification->setType($type);

        if (!$notification->save()) {
            $messages = $notification->getMessages();
            error_log('setNotification error' . __LINE__. $messages[0]);
            return false;
        }
        return $notification->getId();
    }

    /**
     * Set Notify users that always want notifications just display notification on website
     * @param integer $userId       user want notification
     * @param integer $postId       [description]
     * @param integer $postReplyId  [description]
     * @param string  $type         such as Comment, reply...
     * @param integer $userOriginId the user id post question
     */
    public function setActivityNotifications($userId, $postId, $postReplyId, $userOriginId, $type)
    {
        $activity = new ActivityNotifications();
        $activity->setUsersId($userId);
        $activity->setPostsId($postId);
        ;
        $activity->setPostsReplyId($postReplyId);
        $activity->setUsersOriginId($userOriginId);
        $activity->setType($type);
        $activity->save();
    }

    /**
     * The function sending log for nginx or apache, it will to analytic later
     *
     * @param $e
     */
    public function saveLoger($e)
    {
        $logger = $this->getDI()->getLogger();
        if (is_object($e)) {
            $logger->error($e[0]->getMessage());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                $logger->error($message->getMessage());
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }
    }

    /**
     * Get data via method Query Builder Phalcon
     * {code}
     * $sql =[
     *  'model' => 'Phanbook\Models\Posts'
     *  'columns' => ['a.id', 'a.title']
     *  'joins' => [
     *      [
     *          'type' => 'join'
     *          'model' => 'Phanbook\Models\PostsReply'
     *          'on' => 'a.id = pr.postsId'
     *          'alias' => 'pr'
     *      ]
     *      [
     *          //like above
     *      ]
     *   ],
     *   'where' => ''
     * ];
     * {/code}
     *
     * {code}
     * $sql = [
     *      'model' => 'Phanbook\Models\Tags',
     *      'joins' => []
     *
     *  ];
     * {/code}
     *
     * @param  array
     * @return \Phalcon\Mvc\Model\Query\BuilderInterface
     */
    public static function modelQuery($query)
    {
        $builder = self::getBuilder();
        $modelNamespace = __NAMESPACE__ . '\\' ;
        if (!empty($query['model'])) {
            $builder->from(['a' => $modelNamespace . $query['model']]);
        }

        if (!empty($query['columns'])) {
            $builder->columns($query['columns']);
        }
        foreach ($query['joins'] as $join) {
            $type = (string) $join['type'];
            if (in_array($type, ['innerJoin', 'leftJoin', 'rightJoin', 'join'])) {
                $builder->$type($modelNamespace . $join['model'], $join['on'], $join['alias']);
            }
        }
        if (!empty($query['groupBy'])) {
            $builder->groupBy($query['groupBy']);
        }
        if (!empty($query['orderBy'])) {
            $builder->orderBy($query['orderBy']);
        }
        if (!empty($query['where'])) {
            $builder->where($query['where']);
        }
        return $builder;
    }

    /**
     * This method prepares the queries to be executed in each list of posts
     * The returned builders are used as base in the search, tagged list and index lists.
     *
     * <code>
     * use 'Phanbook\Models\PostsReply;
     *
     * $join = [
     *   'type'  => 'join',
     *   'model' => PostsReply::class',
     *   'on'    => 'r.postsId = p.id',
     *   'alias' => 'r'
     * ];
     * </code>
     *
     * @param array $join  The Model need to join
     * @param string $where The condition you want to get.
     * @param int    $limit The option limit post in a page.
     *
     * @return array It return two object
     */
    public static function prepareQueriesPosts($join, $where, $limit = 15)
    {
        $modelNamespace = __NAMESPACE__ . '\\' ;

        /**
         *
         * @var \Phalcon\Mvc\Model\Query\BuilderInterface $itemBuilder
         */
        $itemBuilder = self::getBuilder()
            ->from(['p' => Posts::class])
            ->orderBy('p.sticked DESC, p.createdAt DESC');

        if (isset($join) && is_array($join)) {
            $type = (string) $join['type'];
            $itemBuilder->$type($modelNamespace . $join['model'], $join['on'], $join['alias']);
        }
        if (isset($where)) {
            $itemBuilder->where($where);
        }

        $totalBuilder = clone $itemBuilder;

        $itemBuilder
            ->columns(array('p.*'))
            ->limit($limit);

        $totalBuilder
            ->columns('COUNT(*) AS count');

        return array($itemBuilder, $totalBuilder);
    }

    /**
     * Hook Phalcon PHP
     */
    public function initialize()
    {
        $this->addBehavior(new ModelBlameable());
        $this->keepSnapshots(true);
    }

    /**
     * @return bool|string
     */
    public function getHumanCreatedAt()
    {
        return ZFunction::getHumanDate($this->createdAt);
    }

    /**
     * @return array
     */
    public static function getObjectsWithLabels()
    {
        return [
            self::OBJECT_POSTS => t('Posts'),
            self::OBJECT_COMMENTS => t('Comments'),
            self::OBJECT_POSTS_REPLIES => t('Posts Replies')
        ];
    }
}
