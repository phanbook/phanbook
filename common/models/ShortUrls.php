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

class Shorturls extends ModelBase
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
    protected $longUrl;

    /**
     *
     * @var string
     */
    protected $shortCode;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     *
     * @var integer
     */
    protected $counter;

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
     * Method to set the value of field longUrl
     *
     * @param  string $longUrl
     * @return $this
     */
    public function setLongurl($longUrl)
    {
        $this->longUrl = $longUrl;

        return $this;
    }

    /**
     * Method to set the value of field shortCode
     *
     * @param  string $shortCode
     * @return $this
     */
    public function setShortcode($shortCode)
    {
        $this->shortCode = $shortCode;

        return $this;
    }

    /**
     * Method to set the value of field createdAt
     *
     * @param  integer $createdAt
     * @return $this
     */
    public function setCreatedat($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Method to set the value of field counter
     *
     * @param  integer $counter
     * @return $this
     */
    public function setCounter($counter)
    {
        $this->counter = $counter;

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
     * Returns the value of field longUrl
     *
     * @return string
     */
    public function getLongurl()
    {
        return $this->longUrl;
    }

    /**
     * Returns the value of field shortCode
     *
     * @return string
     */
    public function getShortcode()
    {
        return $this->shortCode;
    }

    /**
     * Returns the value of field createdAt
     *
     * @return integer
     */
    public function getCreatedat()
    {
        return $this->createdAt;
    }

    /**
     * Returns the value of field counter
     *
     * @return integer
     */
    public function getCounter()
    {
        return $this->counter;
    }

    /**
     * Initialize method for model.
     */
    public function getSource()
    {
        return 'shortUrls';
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'        => 'id',
            'longUrl'   => 'longUrl',
            'shortCode' => 'shortCode',
            'createdAt' => 'createdAt',
            'counter'   => 'counter'
        );
    }
}
