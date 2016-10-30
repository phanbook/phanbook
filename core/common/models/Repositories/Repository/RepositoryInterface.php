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

use Countable;
use Phalcon\Mvc\ModelInterface;

/**
 * \Phanbook\Models\Repositories\Repository\RepositoryInterface
 *
 * @package Phanbook\Models\Repositories\Repository
 */
interface RepositoryInterface extends Countable
{
    /**
     * Finds Entity by PK.
     *
     * @param  int $id Entity Primary Key
     * @return ModelInterface|null
     */
    public function findFirstById($id);

    /**
     * Creates new Entity.
     *
     * @param  array  $data The Entity fields.
     * @return ModelInterface
     */
    public function create(array $data = []);

    /**
     * Find Entity in the collection.
     *
     * @param  mixed $id
     * @return bool
     */
    public function has($id);

    /**
     * Count elements of entity collection.
     *
     * @return int
     */
    public function count();

    /**
     * Add entity to the collection.
     *
     * @param mixed          $id
     * @param ModelInterface $entity
     *
     * @return RepositoryInterface
     */
    public function add($id, ModelInterface $entity);

    /**
     * Get Entity from the collection.
     *
     * @param  mixed $id
     * @return ModelInterface
     */
    public function get($id);
}
