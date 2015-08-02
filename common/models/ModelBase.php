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

use Phalcon\DI\FactoryDefault;
use Phalcon\Mvc\Model;
use Phalcon\Logger\Adapter\File as Logger;
use Phalcon\Mvc\Model\Resultset\Simple as Resultset;

use Phanbook\Models\PostsReply;
use Phanbook\Models\Vote;

/**
 * Class ModelBase
 * It is common model basics for Mysql
 *
 * @package Phanbook\Models
 */
class ModelBase extends Model
{

    /**
     * Toggle object status. 0 or 1
     *
     * @param $id     - id of object to toggle
     * @param string                          $method - column name for toggleing - status by default
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

        return $di->get('mysql');
    }

    /**
     * Generic method for deleting one or more rows based on primary key id and classname
     *
     * @param $ids   - array|int with object id
     * @param null                             $model - full class name. if null get classname automaticaly
     *
     * @return bool|void
     */
    public function deleteObject($ids, $model = null)
    {

    }
    /**
     * @param $objectId
     * @param $object
     *
     * @return mixed
     */
    public function getVotes($objectId, $object)
    {
        return $this->getModelsManager()->executeQuery(
            'SELECT SUM(positive) AS positive, SUM(negative) AS negative FROM ' . __NAMESPACE__ . '\Vote WHERE objectId = :objectId: AND object = :object:',
            ['objectId' => $objectId, 'object' => $object]
        )->getFirst()->toArray();

    }

    public function getPostsWithVotes($postId = false)
    {
        $sql = 'SELECT p.*, pr.usersId as editorId,
            (SELECT SUM(v.positive) FROM  vote v  WHERE p.id = v.objectId AND v.object = ?) AS positive,
            (SELECT SUM(v.negative) FROM  vote v  WHERE p.id = v.objectId AND v.object = ?) AS negative
            FROM postsReply p
            LEFT JOIN postsReplyHistory pr ON p.id = pr.postsReplyId
            WHERE p.postsId= ? AND p.deleted = 0
            GROUP BY p.id
            ORDER BY p.id DESC';

        $postsReply = new PostsReply();
        $params = [Vote::OBJECT_POSTS_REPLY, Vote::OBJECT_POSTS_REPLY, ($postId ? $postId : $this->getId())];
        $pdoResult  = $postsReply->getReadConnection()->query($sql, $params);
        return (new Resultset(null, $postsReply, $pdoResult))->toArray();
    }
    /**
     * @param $obJectid
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
     * @return integet|bool
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
     * @param integer $userOriginId the usesr id post question
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
     * @return mixed
     */
    public function saveLoger($e)
    {
        //error_log($e);
        $logger = new Logger(ROOT_DIR . 'apps/logs/error.log');
        if (is_object($e)) {
            $logger->error($e->getMessage());
            $logger->error($e->getTraceAsString());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                d($e);
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }

        //return $this->indexRedirect();
    }
}
