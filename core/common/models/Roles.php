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

use Phalcon\Mvc\Model\Resultset\Simple;

/**
 * Phanbook\Models\Roles
 *
 * @property int    $id
 * @property string $name
 * @property string $description
 * @property string $type
 * @property bool   $isSpecial
 * @property bool   $isDefault
 * @property Simple $users
 * @property Access $access
 *
 * @method Access getAccess()
 * @method Simple getUsers($params = null)
 * @method static Roles|false findFirst($params = null)
 * @method static Roles|false findFirstByIsDefault(bool $flag)
 *
 * @package Phanbook\Models
 */
class Roles extends ModelBase
{
    /**
     * @var int
     */
    protected $id;

    /**
     * @var string
     */
    protected $name;

    /**
     * @var string
     */
    protected $description;

    /**
     * @var string
     */
    protected $type;

    /**
     * @var bool
     */
    protected $isSpecial;

    /**
     * @var bool
     */
    protected $isDefault;

    public function initialize()
    {
        $this->hasManyToMany(
            'id',
            RolesUsers::class,
            'roleId',
            'userId',
            Users::class,
            'id',
            ['alias' => 'users']
        );

        $this->hasOne('id', Access::class, 'roleId', ['alias' => 'access', 'reusable' => true]);
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
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param string $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * @return boolean
     */
    public function getIsSpecial()
    {
        return $this->isSpecial;
    }

    /**
     * @param boolean $isSpecial
     */
    public function setIsSpecial($isSpecial)
    {
        $this->isSpecial = $isSpecial;
    }

    /**
     * @return boolean
     */
    public function getIsDefault()
    {
        return $this->isDefault;
    }

    /**
     * @param boolean $isDefault
     */
    public function setIsDefault($isDefault)
    {
        $this->isDefault = $isDefault;
    }

    /**
     * Independent Column Mapping.
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'id'          => 'id',
            'name'        => 'name',
            'description' => 'description',
            'type'        => 'type',
            'is_special'  => 'isSpecial',
            'is_default'  => 'isDefault',
        ];
    }
}
