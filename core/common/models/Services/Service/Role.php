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

use Phalcon\Text;
use Phanbook\Models\Roles;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions;

/**
 * \Phanbook\Models\Services\Service\Role
 *
 * @package Phanbook\Models\Services\Service
 */
class Role extends Service
{
    const ADMINS_SYSTEM_ROLE = 'Admins';
    const USERS_SYSTEM_ROLE = 'Users';
    const ANONYMOUS_SYSTEM_ROLE = 'Anonymous';
    const MODERATORS_SYSTEM_ROLE = 'Moderators';

    /**
     * @var Roles
     */
    private $defaultRole;

    /**
     * @var Roles
     */
    private $adminRole;

    /**
     * Finds first default role.
     *
     * @return Roles|null
     */
    public function findFirstDefault()
    {
        $role = Roles::query()
            ->where('isDefault = :default:', ['default' => true])
            ->cache(['key' => $this->getCacheKey('default')])
            ->limit(1)
            ->execute();

        return $role->valid() ? $role->getFirst() : null;
    }

    /**
     * Gets (or creates) first default role.
     *
     * @return Roles
     */
    public function getOrCreateFirstDefaultRole()
    {
        if ($this->defaultRole) {
            return $this->defaultRole;
        }

        if (!$entity = $this->findFirstDefault()) {
            $entity = $this->restoreSystemRole([
                'name'        => self::USERS_SYSTEM_ROLE,
                'description' => 'Member privileges, granted after account confirmation.',
                'type'        => 'user',
            ]);
        }

        $this->defaultRole = $entity;

        return $entity;
    }

    /**
     * Finds first admin role.
     *
     * @return Roles|null
     */
    public function findFirstAdmin()
    {
        $role = Roles::query()
            ->where('type = :type:', ['type' => 'admin'])
            ->cache(['key' => $this->getCacheKey('admin')])
            ->limit(1)
            ->execute();

        return $role->valid() ? $role->getFirst() : null;
    }

    /**
     * Gets (or creates) first admin role.
     *
     * @return Roles
     */
    public function getOrCreateAdminRole()
    {
        if ($this->adminRole) {
            return $this->adminRole;
        }

        if (!$entity = $this->findFirstAdmin()) {
            $entity = $this->restoreSystemRole(
                [
                    'name'        => self::ADMINS_SYSTEM_ROLE,
                    'description' => 'Administrative user, has access to everything.',
                    'type'        => 'admin',
                ],
                false
            );
        }

        $this->adminRole = $entity;

        return $entity;
    }

    /**
     * Gets roles list.
     *
     * @return \stdClass[]
     */
    public function getList()
    {
        $entities = Roles::find(['columns' => ['id', 'name', 'description']]);
        $result = $entities->toArray();

        if (empty($result)) {
            $entity = $this->getOrCreateFirstDefaultRole();

            $result[0] = [
                'id'          => $entity->getId(),
                'name'        => $entity->getName(),
                'description' => $entity->getDescription(),
            ];
        }

        $result = array_map(function ($role) {
            $role['id'] = (int) $role['id'];

            return (object) $role;
        }, $result);

        return $result;
    }

    /**
     * Restore system role.
     *
     * @param  array $attributes
     * @param  bool  $isDefault
     * @return Roles
     *
     * @throws Exceptions\EntityException
     */
    protected function restoreSystemRole(array $attributes, $isDefault = true)
    {
        $attributes['isSpecial'] = true;
        $attributes['isDefault'] = (bool) $isDefault;

        $entity = new Roles($attributes);
        if (!$entity->save()) {
            throw new Exceptions\EntityException($entity, 'Unable to restore user role.');
        }

        return $entity;
    }

    protected function getCacheKey($suffix)
    {
        return Text::underscore(str_replace('\\', ' ', trim(Roles::class, '\\'))) . '_' . ucfirst($suffix);
    }
}
