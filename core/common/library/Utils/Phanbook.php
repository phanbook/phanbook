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
use Phanbook\Models\Posts;

/**
 *
 */
class Phanbook
{
    /**
     * Themeing name
     *
     * @var string
     */
    protected $theme = 'default';

    /**
     * This is config file get from info.php of theme inside directory content
     *
     * @var array
     */
    protected $config = [];

    public function __construct($config)
    {
        $this->config = $config;
        $this->theme  = $config['code'];
    }
    /**
     * It will use for render url in tag link, script
     *
     * @param  string $item such as css/app.css
     * @return string
     */
    public function assetContent($item)
    {
        return '/content/themes/'. $this->theme .'/' . $item;
    }
    /**
     * It will return string when error to occur and to array to success
     *
     * @param  $tag is string it should slug
     * @return string|array
     */
    public function isTags($tag)
    {
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
     * @todo Update the total of posts related to a tags
     *
     * @return bool
     */
    public function saveTagsInPosts($_tag, $object)
    {
        $tags = $this->isTags($_tag);
        if (is_array($tags)) {
            //
            $postsTags = PostsTags::find(
                [
                    'postsId = ?0',
                    'bind' => [$object->getId()]
                ]
            );
            if (isset($postsTags)) {
                $postsTags->delete();
            }
            foreach ($tags as $tagsId) {
                $postsTags = new PostsTags();
                $postsTags->setTagsId($tagsId);
                $postsTags->setPostsId($object->getId());

                if (!$postsTags->save()) {
                    return false;
                }
                //Update the total of posts related to a tags
                if ($object->getOperationMade() == \Phalcon\Mvc\Model::OP_CREATE) {
                    $tag = Tags::findFirstById($tagsId);
                    $number = $tag->getNumberposts();
                    $tag->setNumberPosts($number + 1);
                    if (!$tag->save()) {
                        return false;
                    }
                }
            }
            return true;
        }
        return false;
    }
    /**
     * Retrieve a page give its title
     *
     * @param  string       $page_title Page title
     * @return object on success or empty  on failure
     */
    public function getPageByTitle($title)
    {
        $param = [
            'type = "pages" AND title =?0',
            'bind' =>[$title]
        ];
        if (Posts::findFirst($param)) {
            return Posts::findFirst($param);
        }
        return false;
    }
}
