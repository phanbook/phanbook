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
 * \Phanbook\Models\RolesUsers
 *
 * @property int $userId
 * @property int $roleId
 *
 * @package Phanbook\Models
 */
class RolesUsers extends ModelBase
{
    /**
     * @var integer
     */
    protected $userId;

    /**
     * @var integer
     */
    protected $roleId;

    /**
     * @return int
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @param int $userId
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
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

    public function initialize()
    {
        $this->belongsTo('userId', Users::class, 'id', ['alias' => 'user', 'reusable' => true]);
        $this->belongsTo('roleId', Roles::class, 'id', ['alias' => 'role', 'reusable' => true]);
    }

    /**
     * Independent Column Mapping.
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'users_id' => 'userId',
            'roles_id' => 'roleId',
        ];
    }
}
