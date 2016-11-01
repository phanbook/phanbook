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
 * \Phanbook\Models\Repositories\InMemoryRepository
 *
 * The collection-oriented Entity repository.
 *
 * @package Phanbook\Models\Repositories
 */
abstract class InMemoryRepository implements RepositoryInterface
{
    /**
     * The identity accessor.
     * @var ObjectIdentifier
     */
    private $identifier;

    /**
     * The Entity collection.
     * @var ModelInterface[]
     */
    private $storage = [];

    /**
     * Repository constructor.
     *
     * @param ObjectIdentifier $identifier The identity accessor.
     */
    public function __construct(ObjectIdentifier $identifier)
    {
        $this->identifier = $identifier;
    }

    /**
     * {@inheritdoc}
     *
     * @param  ModelInterface $entity
     * @return $this
     */
    public function save(ModelInterface $entity)
    {
        $id = $this->stringify($this->getIdentity($entity));
        $this->storage[$id] = $entity;

        return $this;
    }

    /**
     * {@inheritdoc}
     *
     * @param ModelInterface $entity
     * @return $this
     */
    public function remove(ModelInterface $entity)
    {
        $id = $this->stringify($this->getIdentity($entity));
        unset($this->storage[$id]);

        return $this;
    }

    /**
     * @param  mixed $id The Entity ID.
     * @return ModelInterface|null
     */
    public function findById($id)
    {
        $id = $this->stringify($id);

        if (!isset($this->storage[$id])) {
            return null;
        }

        return $this->storage[$id];
    }

    /**
     * {@inheritdoc}
     *
     * @return ModelInterface[]
     */
    public function getAll()
    {
        return array_values($this->storage);
    }

    /**
     * {@inheritdoc}
     *
     * @return $this
     */
    public function clear()
    {
        $this->storage = [];

        return $this;
    }

    private function getIdentity(ModelInterface $entity)
    {
        return $this->identifier->getIdentity($entity);
    }

    private function stringify($id)
    {
        return md5(serialize($id));
    }
}
