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
namespace Phanbook\Models\Repositories\Repository;

use Phanbook\Models\Karma;
use Phanbook\Models\Posts as Entity;
use Phanbook\Models\Users as UsersEntity;
use Phanbook\Models\Repositories\Repository;

/**
 * \Phanbook\Models\Repositories\Repository\Post
 *
 * @package Phanbook\Models\Repositories\Repository
 */
class Post extends Repository
{
    /**
     * @param  int $id The Post ID.
     * @return Entity|null
     */
    public function findFirstById($id)
    {
        if ($this->has($id)) {
            return $this->get($id);
        }

        if ($entity = Entity::findFirstById((int) $id) ?: null) {
            $this->add($id, $entity);
        }

        return $entity;
    }

    /**
     * Checks whether the Post is published.
     *
     * @param  Entity $post The Post.
     * @return bool
     */
    public function isPublished(Entity $post)
    {
        return $post->getStatus() == Entity::PUBLISH_STATUS && !$post->getDeleted();
    }

    /**
     * Count views by ip address.
     *
     * @param Entity $post      The Post.
     * @param string $ipAddress The ip address.
     *
     * @return int
     */
    public function countViewsByIpAddress(Entity $post, $ipAddress)
    {
        if (!$ipAddress) {
            return 0;
        }

        return $post->getPostview(['ipaddress = ?0', 'bind' => [$ipAddress]])->count();
    }

    /**
     * Checks whether the Post has views by ip address.
     *
     * @param Entity $post      The Post.
     * @param string $ipAddress The ip address [Optional].
     *
     * @return int
     */
    public function hasViewsByIpAddress(Entity $post, $ipAddress = null)
    {
        if (!$ipAddress && $this->getDI()->has('request')) {
            $ipAddress = $this->getDI()->getShared('request')->getClientAddress();
        }

        return $this->countViewsByIpAddress($post, $this->resolveClientAddress($ipAddress)) > 0;
    }

    /**
     * Increase number of views.
     *
     * @param  Entity $post      The Post.
     * @param  int    $visitorId The Visitor ID [Optional].
     * @param  string $ipAddress The ip address [Optional].
     * @return $this
     */
    public function increaseNumberViews(Entity $post, $visitorId = null, $ipAddress = null)
    {
        $visitorId = $this->resolveVisitorId($visitorId);

        if ($this->hasViewsByIpAddress($post)) {
            return $this;
        }

        if (!$visitorId) {
            return $this;
        }

        $view = Repository::getRepository('PostViews')->create([
            'postsId'   => $post->getId(),
            'ipaddress' => $this->resolveClientAddress($ipAddress),
        ]);

        if (!$view->save()) {
            foreach ($post->getMessages() as $message) {
                $this->logError($message);
            }
        }

        $post->setNumberViews($post->getNumberViews() + 1);

        $this->increaseAuthorKarmaByVisit($post, $visitorId);

        if (!$post->save()) {
            foreach ($post->getMessages() as $message) {
                $this->logError($message);
            }
        }

        return $this;
    }

    /**
     * Increase author karma.
     *
     * @param  Entity $post      The Post.
     * @param  int    $visitorId The Visitor ID [Optional].
     * @return $this
     */
    public function increaseAuthorKarmaByVisit(Entity $post, $visitorId = null)
    {
        if ($this->isAuthorVisitor($post, $visitorId)) {
            return $this;
        }

        if ($post->user->getStatus() != UsersEntity::STATUS_ACTIVE) {
            return $this;
        }

        $post->user->increaseKarma(Karma::VISIT_ON_MY_POST);

        return $this;
    }

    /**
     * {@inheritdoc}
     *
     * @param  array  $data The Entity fields.
     * @return Entity
     */
    public function create(array $data = [])
    {
        return new Entity($data);
    }

    /**
     * Checks whether the current visitor is the author of the Post.
     *
     * @param Entity $post      The Post.
     * @param int    $visitorId The Visitor ID [Optional].
     *
     * @return bool
     */
    public function isAuthorVisitor(Entity $post, $visitorId = null)
    {
        $visitorId = $this->resolveVisitorId($visitorId);

        return $visitorId && $post->getUsersId() == $visitorId;
    }

    protected function resolveVisitorId($visitorId)
    {
        if (!$visitorId && $this->getDI()->has('auth')) {
            $visitorId = $this->getDI()->getShared('auth')->getUserId();
        }

        return $visitorId;
    }

    protected function resolveClientAddress($ipAddress = null)
    {
        if (!$ipAddress && $this->getDI()->has('request')) {
            $ipAddress = $this->getDI()->getShared('request')->getClientAddress();
        }

        return $ipAddress;
    }
}
