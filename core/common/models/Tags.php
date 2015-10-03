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

class Tags extends ModelBase
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $name;

    /**
     *
     * @var string
     */
    protected $description;

    /**
     *
     * @var string
     */
    protected $slug;

    /**
     *
     * @var integer
     */
    protected $numberPosts;

    /**
     *
     * @var string
     */
    protected $noBounty;

    /**
     *
     * @var string
     */
    protected $noDigest;

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
     * Method to set the value of field name
     *
     * @param  string $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Method to set the value of field description
     *
     * @param  string $description
     * @return $this
     */
    public function setDescription($description)
    {
        $this->description = $description;

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
     * Method to set the value of field numberPosts
     *
     * @param  integer $numberPosts
     * @return $this
     */
    public function setNumberposts($numberPosts)
    {
        $this->numberPosts = $numberPosts;

        return $this;
    }

    /**
     * Method to set the value of field noBounty
     *
     * @param  string $noBounty
     * @return $this
     */
    public function setNobounty($noBounty)
    {
        $this->noBounty = $noBounty;

        return $this;
    }

    /**
     * Method to set the value of field noDigest
     *
     * @param  string $noDigest
     * @return $this
     */
    public function setNodigest($noDigest)
    {
        $this->noDigest = $noDigest;

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
     * Returns the value of field name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Returns the value of field description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
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
     * Returns the value of field numberPosts
     *
     * @return integer
     */
    public function getNumberposts()
    {
        return $this->numberPosts;
    }

    /**
     * Returns the value of field noBounty
     *
     * @return string
     */
    public function getNobounty()
    {
        return $this->noBounty;
    }

    /**
     * Returns the value of field noDigest
     *
     * @return string
     */
    public function getNodigest()
    {
        return $this->noDigest;
    }
    /**
     * Get random tags
     *
     * @return array
     */
    public static function getTagsRandom()
    {
        $tags = Tags::query()
            ->orderBy('RAND()')
            ->limit(10)
            ->execute();
        if ($tags->valid()) {
            return $tags;
        }
        return false;
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'name' => 'name',
            'description' => 'description',
            'slug' => 'slug',
            'numberPosts' => 'numberPosts',
            'noBounty' => 'noBounty',
            'noDigest' => 'noDigest'
        );
    }
    public function initialize()
    {
        $this->useDynamicUpdate(true);
        $this->hasManyToMany(
            'id',
            __NAMESPACE__ . '\PostsTags',
            'PostsId',
            'TagsId',
            __NAMESPACE__ . '\Posts',
            'id',
            array('alias' => 'post')
        );
    }
}
