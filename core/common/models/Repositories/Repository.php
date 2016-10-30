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
use Phanbook\Models\Repositories\Exceptions;

use Phanbook\Models\Repositories\Repository\RepositoryInterface;

/**
 * \Phanbook\Models\Repositories\Repository
 *
 * @method static Repository\Post getPost()
 * @method static Repository\PostViews getPostViews()
 * @method static Repository\User getUser()
 *
 * @package Phanbook\Models\Repositories
 */
abstract class Repository implements RepositoryInterface
{
    /**
     * The Posts collection.
     * @var ModelInterface[]
     */
    protected $data = [];

    /**
     * {@inheritdoc}
     *
     * @param  mixed $id
     * @return bool
     */
    public function has($id)
    {
        return isset($this->data[$id]);
    }

    /**
     * {@inheritdoc}
     *
     * @return int
     */
    public function count()
    {
        return count($this->data);
    }

    /**
     * {@inheritdoc}
     *
     * @param  mixed          $id
     * @param  ModelInterface $entity
     * @return $this
     *
     * @throws Exceptions\LogicException
     */
    public function addEntity($id, ModelInterface $entity)
    {
        if (!$this->has($id)) {
            throw new Exceptions\LogicException(
                sprintf(
                    'An entity with id "%s" already exists.',
                    is_scalar($id) ? $id : json_encode($id)
                )
            );
        }

        $this->data[$id] = $entity;

        return $this;
    }

    /**
     * {@inheritdoc}
     *
     * @param  ModelInterface[] $entities
     * @return RepositoryInterface
     */
    public function addEntities(array $entities)
    {
        foreach ($entities as $id => $entity) {
            $this->addEntity($id, $entity);
        }

        return $this;
    }

    /**
     * Get Entity from the collection.
     *
     * @param  mixed $id
     * @return mixed
     *
     * @throws Exceptions\EntityNotFoundException
     */
    public function get($id)
    {
        if (!$this->has($id)) {
            throw new Exceptions\EntityNotFoundException(
                sprintf(
                    'No entity found for ID %d',
                    is_scalar($id) ? $id : json_encode($id)
                )
            );
        }

        return $this->data[$id];
    }

    /**
     * {@inheritdoc}
     *
     * @return ModelInterface[]
     */
    public function getAll()
    {
        return $this->data;
    }

    /**
     * Get concrete Entity repository.
     *
     * @param  string $name The repository class name.
     * @return RepositoryInterface
     *
     * @throws Exceptions\InvalidRepositoryException
     */
    public static function getRepository($name)
    {
        $className = "\\Phanbook\\Models\\Repositories\\Repository\\{$name}";
        if (!class_exists($className)) {
            throw new Exceptions\InvalidRepositoryException(
                "Repository class '{$className}' doesn't exists."
            );
        }

        $repository = new $className();

        if (!$repository instanceof RepositoryInterface) {
            throw new Exceptions\InvalidRepositoryException(
                "Repository {$className} must implement " . RepositoryInterface::class . '.'
            );
        }

        return $repository;
    }

    /**
     * Handle dynamic static method calls into the Repository::getRepository method.
     *
     * @param  string $method
     * @param  array  $parameters
     * @return RepositoryInterface
     *
     * @throws Exceptions\InvalidRepositoryException
     */
    public static function __callStatic($method, $parameters)
    {
        return self::getRepository(substr($method, 3));
    }
}
