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
use Phanbook\Common\Library\Behavior\Di as DiBehavior;
use Phanbook\Models\Repositories\Repository\RepositoryInterface;
use Phanbook\Models\Repositories\Exceptions\InvalidRepositoryException;

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
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

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
     * Get concrete Entity repository.
     *
     * @param string $name The repository class name.
     *
     * @return RepositoryInterface
     * @throws InvalidRepositoryException
     */
    public static function getRepository($name)
    {
        $className = "\\Phanbook\\Models\\Repositories\\Repository\\{$name}";
        if (!class_exists($className)) {
            throw new InvalidRepositoryException(
                "Repository class '{$className}' doesn't exists."
            );
        }

        $repository = new $className();

        if (!$repository instanceof RepositoryInterface) {
            throw new InvalidRepositoryException(
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
     * @throws InvalidRepositoryException
     */
    public static function __callStatic($method, $parameters)
    {
        return self::getRepository(substr($method, 3));
    }

    protected function logError($message)
    {
        if (!$this->getDI()->has('logger')) {
            return;
        }

        $this->getDI()->getShared('logger')->error((string) $message);
    }
}
