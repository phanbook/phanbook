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

class PostsTags extends ModelBase
{

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
    protected $tagsId;

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
     * Method to set the value of field tagsId
     *
     * @param  integer $tagsId
     * @return $this
     */
    public function setTagsId($tagsId)
    {
        $this->tagsId = $tagsId;

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
     * Returns the value of field tagsId
     *
     * @return integer
     */
    public function getTagsId()
    {
        return $this->tagsId;
    }

    /**
     * Initialize method for model.
     */
    public function getSource()
    {
        return 'postsTags';
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'postsId' => 'postsId',
            'tagsId' => 'tagsId'
        );
    }
    public function initialize()
    {
        $this->belongsTo('postsId', __NAMESPACE__ .'/Posts', 'id', ['alias' => 'post']);
        $this->belongsTo('tagsId', __NAMESPACE__ .'/Tags', 'id', ['alias' => 'tag']);
    }
}
