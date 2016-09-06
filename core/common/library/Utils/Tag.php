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
namespace Phanbook\Utils;

use Phanbook\Models\Tags;
use Phanbook\Models\PostsTags;

class Tag
{
    /**
     * It will return string when error to occur and to array to success
     *
     * @param  $tag is string it should slug
     * @return string|array
     */
    public function getTagsId($tag)
    {
        if (is_array($tag)) {
            return $tag;
        }
        if (!is_string($tag) || empty($tag)) {
            return 'You need to add tags for your posts';
        }
        $tags = explode(',', $tag);
        if (count($tags) == 0) {
            return 'This tag does not exist';
        }
        if (count($tags) >= 5) {
            return 'The tags maximum allow is 5';
        }
        $results = [];
        foreach ($tags as $tag) {
            $object= Tags::findFirstBySlug(trim($tag));
            if (!is_object($object)) {
                return 'This tag does not exist';
            }
            $results[] = $object->getId();
        }

        return $results;
    }

    /**
     * @param $tag is string
     * @param $object is model Posts
     * @return bool
     */
    public function saveTagsInPosts($tag, $object)
    {
        $tagsId    = [];
        $postId    = $object->getId();
        $getTagsId = $this->getTagsId($tag);
        if (!is_array($getTagsId)) {
            return false;
        }

        $postsTags = PostsTags::find(
            [
                'postsId = ?0',
                'bind' => [$postId]
            ]
        );

        foreach ($postsTags as $value) {
            $tagsId[] = $value->tagsId;
        }

        //Deleted tags
        $rows2 = array_diff($tagsId, $getTagsId);
        $this->deletedTag($postId, $rows2);

        $rows = array_diff($getTagsId, $tagsId);
        foreach ($rows as $tagId) {
            $postsTags = new PostsTags();
            $postsTags->setTagsId($tagId);
            $postsTags->setPostsId($postId);

            if (!$postsTags->save()) {
                return false;
            }
            //Update the total of posts related to a tags
            if ($object->getOperationMade() == \Phalcon\Mvc\Model::OP_CREATE) {

                $tags    = Tags::findFirstById($tagId);
                $number  = $tags->getNumberposts();
                $tags->setNumberPosts($number + 1);
                $tags->save();
            }
        }

        return true;
    }

    /**
     * @param $postId
     * @param $tagIds
     */
    public function deletedTag($postId, $tagIds)
    {
        foreach ($tagIds as $id) {
            $object = PostsTags::find(
                [
                    'postsId = ?0 AND tagsId =?1',
                    'bind' => [$postId, $id]
                ]
            );

            if ($object) {
                $object->delete();
            }
        }
    }
}
