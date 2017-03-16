<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Models\Services\Service;

use Phanbook\Models\Karma;
use Phanbook\Models\Users;
use Phanbook\Models\Posts;
use Phanbook\Models\PostsViews;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

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
     * @return Posts|null
     */
    public function findFirstById($id)
    {
        return Posts::findFirstById($id) ?: null;
    }

    /**
     * Get Post by ID.
     *
     * @param  int $id The Posts ID.
     * @return Posts
     *
     * @throws EntityNotFoundException
     */
    public function getFirstById($id)
    {
        if (!$post = $this->findFirstById($id)) {
            throw new EntityNotFoundException($id);
        }

        return $post;
    }

    /**
     * Checks whether the Post is published.
     *
     * @param  Posts $post
     * @return bool
     */
    public function isPublished(Posts $post)
    {
        return $post->getStatus() == Posts::PUBLISH_STATUS && !$post->getDeleted();
    }

    /**
     * Checks whether the Post has views by ip address.
     *
     * @param Posts  $post
     * @param string $ipAddress
     *
     * @return bool
     */
    public function hasViewsByIpAddress(Posts $post, $ipAddress = null)
    {
        return $this->countViewsByIpAddress($post, $ipAddress) > 0;
    }

    /**
     * Count views by ip address.
     *
     * @param Posts  $post
     * @param string $ipAddress
     *
     * @return int
     */
    public function countViewsByIpAddress($post, $ipAddress)
    {
        if (!$ipAddress = $this->resolveClientAddress($ipAddress)) {
            return 0;
        }

        return $post->getPostview(['ipaddress = ?0', 'bind' => [$ipAddress]])->count();
    }

    /**
     * Increase number of views.
     *
     * @param  Posts  $post
     * @param  int    $visitorId
     * @param  string $ipAddress
     * @return bool
     */
    public function increaseNumberViews($post, $visitorId, $ipAddress = null)
    {
        $ipAddress = $this->resolveClientAddress($ipAddress);

        if (!$visitorId || !$ipAddress || $this->hasViewsByIpAddress($post, $ipAddress)) {
            return false;
        }

        $view = new PostsViews([
            'postsId'   => $post->getId(),
            'ipaddress' => $ipAddress,
        ]);

        if (!$view->save()) {
            foreach ($post->getMessages() as $message) {
                $this->logger->error($message);
            }
        }

        $post->setNumberViews($post->getNumberViews() + 1);

        $this->increaseAuthorKarmaForVisit($post, $visitorId);

        if (!$post->save()) {
            foreach ($post->getMessages() as $message) {
                $this->logger->error($message);
            }

            return false;
        }

        return true;
    }

    /**
     * Increase author karma.
     *
     * @param  Posts  $post
     * @param  int    $visitorId
     * @return bool
     */
    public function increaseAuthorKarmaForVisit($post, $visitorId)
    {
        if ($this->isAuthorVisitor($post, $visitorId)) {
            return false;
        }

        if ($post->user->getStatus() != Users::STATUS_ACTIVE) {
            return false;
        }

        $post->user->increaseKarma(Karma::VISIT_ON_MY_POST);

        return true;
    }

    /**
     * Checks whether the current visitor is the author of the Post.
     *
     * @param Posts $post
     * @param int   $visitorId
     *
     * @return bool
     */
    public function isAuthorVisitor($post, $visitorId)
    {
        return $post->getUsersId() == $visitorId;
    }
}
