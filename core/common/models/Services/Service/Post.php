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
namespace Phanbook\Models\Services\Service;

use Phanbook\Models\Karma;
use Phanbook\Models\Posts as Entity;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Users as UsersEntity;
use Phanbook\Models\Repositories\Repository;
use Phanbook\Models\PostsViews as PostsViewsEntity;

/**
 * \Phanbook\Models\Services\Service\Post
 *
 * @package Phanbook\Models\Services\Service
 */
class Post extends Service
{
    /**
     * Finds Post by ID.
     *
     * @param  int $id The Posts ID.
     * @return Entity|null
     */
    public function findById($id)
    {
        return Repository::getPost()->findById($id);
    }

    /**
     * Get Post by ID.
     *
     * @param  int $id The Posts ID.
     * @return Entity|null
     */
    public function getById($id)
    {
        return Repository::getPost()->get($id);
    }

    /**
     * Checks whether the Post is published.
     *
     * @param  int $id The Posts ID.
     * @return bool
     */
    public function isPublished($id)
    {
        $post = $this->findById($id);

        if (!$post) {
            return false;
        }

        return $post->getStatus() == Entity::PUBLISH_STATUS && !$post->getDeleted();
    }

    /**
     * Checks whether the Post has views by ip address.
     *
     * @param int    $id        The Posts ID.
     * @param string $ipAddress The ip address [Optional].
     *
     * @return int
     */
    public function hasViewsByIpAddress($id, $ipAddress = null)
    {
        if (!$ipAddress && $this->getDI()->has('request')) {
            $ipAddress = $this->getDI()->getShared('request')->getClientAddress();
        }

        return $this->countViewsByIpAddress($id, $this->resolveClientAddress($ipAddress)) > 0;
    }

    /**
     * Count views by ip address.
     *
     * @param int    $id        The Posts ID.
     * @param string $ipAddress The ip address.
     *
     * @return int
     */
    public function countViewsByIpAddress($id, $ipAddress)
    {
        $post = $this->getById($id);

        if (!$ipAddress) {
            return 0;
        }

        return $post->getPostview(['ipaddress = ?0', 'bind' => [$ipAddress]])->count();
    }

    /**
     * Increase number of views.
     *
     * @param  int    $id        The Posts ID.
     * @param  int    $visitorId The Visitor ID [Optional].
     * @param  string $ipAddress The ip address [Optional].
     * @return $this
     */
    public function increaseNumberViews($id, $visitorId = null, $ipAddress = null)
    {
        $visitorId = $this->resolveVisitorId($visitorId);

        if (!$visitorId) {
            return $this;
        }

        if ($this->hasViewsByIpAddress($id, $visitorId)) {
            return $this;
        }

        $post = $this->getById($id);

        $view = new PostsViewsEntity([
            'postsId'   => $post->getId(),
            'ipaddress' => $this->resolveClientAddress($ipAddress),
        ]);

        if ($view->save()) {
            Repository::getPostViews()->saveEntity($view);
        } else {
            foreach ($post->getMessages() as $message) {
                $this->logError($message);
            }
        }

        $post->setNumberViews($post->getNumberViews() + 1);

        $this->increaseAuthorKarmaByVisit($id, $visitorId);

        if ($post->save()) {
            Repository::getPost()->saveEntity($post);
        } else {
            foreach ($post->getMessages() as $message) {
                $this->logError($message);
            }
        }

        return $this;
    }

    /**
     * Increase author karma.
     *
     * @param  int    $id        The Posts ID.
     * @param  int    $visitorId The Visitor ID [Optional].
     * @return $this
     */
    public function increaseAuthorKarmaByVisit($id, $visitorId = null)
    {
        if ($this->isAuthorVisitor($id, $visitorId)) {
            return $this;
        }

        $post = $this->getById($id);

        if ($post->user->getStatus() != UsersEntity::STATUS_ACTIVE) {
            return $this;
        }

        $post->user->increaseKarma(Karma::VISIT_ON_MY_POST);

        return $this;
    }

    /**
     * Checks whether the current visitor is the author of the Post.
     *
     * @param int    $id        The Posts ID.
     * @param int    $visitorId The Visitor ID [Optional].
     *
     * @return bool
     */
    public function isAuthorVisitor($id, $visitorId = null)
    {
        $post = $this->getById($id);

        $visitorId = $this->resolveVisitorId($visitorId);

        return $visitorId && $post->getUsersId() == $visitorId;
    }
}
