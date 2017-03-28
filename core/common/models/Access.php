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
 * \Phanbook\Models\Access
 *
 * @property int    $id
 * @property string $object
 * @property string $action
 * @property int    $roleId
 * @property string $value
 * @property Roles  $role
 *
 * @method Roles getRole()
 *
 * @package Phanbook\Models
 */
class Access extends ModelBase
{
    /**
     * @var int
     */
    protected $id;

    /**
     * @var string
     */
    protected $object;

    /**
     * @var string
     */
    protected $action;

    /**
     * @var int
     */
    protected $roleId;

    /**
     * @var string
     */
    protected $value;

    public function initialize()
    {
        $this->belongsTo('roleId', Roles::class, 'id', ['alias' => 'role', 'reusable' => true]);
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getObject()
    {
        return $this->object;
    }

    /**
     * @param string $object
     */
    public function setObject($object)
    {
        $this->object = $object;
    }

    /**
     * @return string
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * @param string $action
     */
    public function setAction($action)
    {
        $this->action = $action;
    }

    /**
     * @return int
     */
    public function getRoleId()
    {
        return $this->roleId;
    }

    /**
     * @param int $roleId
     */
    public function setRoleId($roleId)
    {
        $this->roleId = $roleId;
    }

    /**
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * @param string $value
     */
    public function setValue($value)
    {
        $this->value = $value;
    }

    /**
     * Independent Column Mapping.
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'id'      => 'id',
            'object'  => 'object',
            'action'  => 'action',
            'role_id' => 'roleId',
            'value'   => 'value',
        ];
    }
}
