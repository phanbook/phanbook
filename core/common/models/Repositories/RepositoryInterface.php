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
namespace Phanbook\Models\Repositories;

use Phalcon\Mvc\ModelInterface;

/**
 * \Phanbook\Models\Repositories\RepositoryInterface
 *
 * @package Phanbook\Models\Repositories
 */
interface RepositoryInterface
{
    /**
     * Add entity to the collection.
     *
     * @param  ModelInterface $entity
     * @return RepositoryInterface
     */
    public function save(ModelInterface $entity);

    /**
     * Removes Entity.
     *
     * @param  ModelInterface $entity
     * @return mixed
     */
    public function remove(ModelInterface $entity);

    /**
     * Finds Entity by PK.
     *
     * @param  mixed $id Entity Primary Key
     * @return ModelInterface|null
     */
    public function findById($id);

    /**
     * Get all entities.
     *
     * @return ModelInterface[]
     */
    public function getAll();

    /**
     * Clear Entity collection.
     *
     * @return mixed
     */
    public function clear();
}
