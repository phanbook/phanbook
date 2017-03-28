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
namespace Phanbook\Models;

/**
 * \Phanbook\Models\FailedLogins
 *
 * @package Phanbook\Models
 */
class FailedLogins extends ModelBase
{
    /**
     * The Entity ID.
     * @var integer
     */
    protected $id;

    /**
     * The User ID.
     * @var integer
     */
    protected $usersId;

    /**
     * The used IP address.
     * @var integer
     */
    protected $ipAddress;

    /**
     * The attempted date.
     * @var integer
     */
    protected $attempted;

    /**
     * Initialize FailedLogins model.
     */
    public function initialize()
    {
        $this->belongsTo('usersId', Users::class, 'id', ['alias' => 'user', 'reusable' => true]);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'failedLogins';
    }

    /**
     * Method to set the value of field id.
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
     * Method to set the value of field usersId.
     *
     * @param  integer $usersId
     * @return $this
     */
    public function setUsersId($usersId)
    {
        $this->usersId = $usersId;

        return $this;
    }

    /**
     * Method to set the value of field ipAddress.
     *
     * @param  integer $ipAddress
     * @return $this
     */
    public function setIpaddress($ipAddress)
    {
        $this->ipAddress = $ipAddress;

        return $this;
    }

    /**
     * Method to set the value of field attempted.
     *
     * @param  integer $attempted
     * @return $this
     */
    public function setAttempted($attempted)
    {
        $this->attempted = $attempted;

        return $this;
    }

    /**
     * Returns the value of field id.
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field usersId.
     *
     * @return integer
     */
    public function getUsersId()
    {
        return $this->usersId;
    }

    /**
     * Returns the value of field ipAddress.
     *
     * @return integer
     */
    public function getIpaddress()
    {
        return $this->ipAddress;
    }

    /**
     * Returns the value of field attempted.
     *
     * @return integer
     */
    public function getAttempted()
    {
        return $this->attempted;
    }

    /**
     * Allows to query a set of records that match the specified conditions.
     *
     * @param  mixed $parameters
     * @return \Phalcon\Mvc\Model\ResultsetInterface|FailedLogins[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions.
     *
     * @param  mixed $parameters
     * @return FailedLogins
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
}
