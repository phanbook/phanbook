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

use Phalcon\DiInterface;
use Phalcon\Mvc\ModelInterface;
use Phanbook\Models\Repositories\Exceptions;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;
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
abstract class Repository implements RepositoryInterface, ObjectIdentifier
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * @var RepositoryInterface[]
     */
    private static $repositories = [];

    /**
     * Repository constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
    }

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
     * @param  ModelInterface $entity
     * @return $this
     */
    public function saveEntity(ModelInterface $entity)
    {
        $id = $this->getIdentity($entity);

        $this->data[$id] = $entity;

        return $this;
    }

    /**
     * {@inheritdoc}
     *
     * @param  ModelInterface[] $entities
     * @return RepositoryInterface
     */
    public function saveEntities(array $entities)
    {
        foreach ($entities as $entity) {
            $this->saveEntity($entity);
        }

        return $this;
    }

    /**
     * {@inheritdoc}
     *
     * @param ModelInterface $entity
     * @return $this
     */
    public function removeEntity(ModelInterface $entity)
    {
        $id = $this->getIdentity($entity);
        unset($this->data[$id]);

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
     * {@inheritdoc}
     *
     * @return $this
     */
    public function clear()
    {
        $this->data = [];

        return $this;
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

        if (!empty(self::$repositories[$className])) {
            return self::$repositories[$className];
        }

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

        self::$repositories[$className] = $repository;

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

    /**
     * Get Entity Identity.
     *
     * @param  ModelInterface $entity
     * @return mixed
     */
    public function getIdentity(ModelInterface $entity)
    {
        if (property_exists($entity, 'id')) {
            return $entity->id;
        }

        if (method_exists($entity, 'getId')) {
            return $entity->getId();
        }

        if (!$this->getDI()->has('modelsMetadata')) {
            $modelsMetadata = $this->getDI()->getShared('modelsMetadata');
        } else {
            $modelsMetadata = $entity->getModelsMetaData();
        }

        $primaryKeys = $modelsMetadata->getPrimaryKeyAttributes($entity);

        switch (count($primaryKeys)) {
            case 0:
                return null;
            case 1:
                return $entity->{$primaryKeys[0]};
            default:
                return array_intersect_key(get_object_vars($entity), array_flip($primaryKeys));
        }
    }
}
