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
namespace Phanbook\Models\Repositories\Repository;

use Phanbook\Models\Users as Entity;
use Phanbook\Models\Repositories\Repository;

/**
 * \Phanbook\Models\Repositories\Repository\User
 *
 * @package Phanbook\Models\Repositories\Repository
 */
class User extends Repository
{
    /**
     * @param  int $id The User ID.
     * @return Entity|null
     */
    public function findById($id)
    {
        if (!$id) {
            return null;
        }

        if ($this->has($id)) {
            return $this->get($id);
        }

        if ($entity = Entity::findFirstById((int) $id) ?: null) {
            $this->addEntity($entity);
        }

        return $entity;
    }
}
