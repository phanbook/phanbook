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

use Phanbook\Models\PostsViews as Entity;
use Phanbook\Models\Repositories\Repository;

/**
 * \Phanbook\Models\Repositories\Repository\PostViews
 *
 * @package Phanbook\Models\Repositories\Repository
 */
class PostViews extends Repository
{
    /**
     * @param  int $id The PostViews ID.
     * @return Entity|null
     */
    public function findFirstById($id)
    {
        if ($this->has($id)) {
            return $this->get($id);
        }

        if ($entity = Entity::findFirstById((int) $id) ?: null) {
            $this->add($id, $entity);
        }

        return $entity;
    }

    /**
     * {@inheritdoc}
     *
     * @param  array  $data The Entity fields.
     * @return Entity
     */
    public function create(array $data = [])
    {
        return new Entity($data);
    }
}
