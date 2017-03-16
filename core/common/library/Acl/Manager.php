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
namespace Phanbook\Common\Library\Acl;

use Phalcon\Acl;
use Phalcon\Config;
use ReflectionClass;
use Phalcon\Mvc\Model;
use DirectoryIterator;
use Phalcon\Di\Injectable;
use Phanbook\Models\Access;
use Phalcon\Acl\AdapterInterface;
use Phanbook\Models\Services\Service;
use Phanbook\Common\Library\Annotations\Adapter\Memory as AnnotationAdapter;

/**
 * \Phanbook\Common\Library\Acl\Manager
 *
 * @property AnnotationAdapter $annotations
 * @package Phanbook\Common\Library\Acl
 */
class Manager extends Injectable
{
    const ADMIN_AREA = 'AdminArea';
    const ADMIN_AREA_DESCRIPTION = 'Admin area';

    /**
     * @var AdapterInterface
     */
    protected $acl;

    /**
     * @var Config
     */
    protected $config;

    /**
     * @var AnnotationAdapter
     */
    protected $reader;

    /**
     * Manager constructor.
     *
     * @param array $config
     */
    public function __construct(array $config)
    {
        $this->config = new Config($config);
    }

    /**
     * Gets access object.
     *
     * @param string $filePath
     *
     * @return null|\stdClass
     */
    public function getObject($filePath)
    {
        if (!$className = $this->annotations->getFullyQualifiedClassName($filePath)) {
            return null;
        }

        if (empty($className) || !class_exists($className)) {
            return null;
        }

        $reflectionClass = new ReflectionClass($className);
        if (!$reflectionClass->isSubclassOf(Model::class)) {
            return null;
        }

        $object = new \stdClass();

        $reflector = $this->annotations->get($className);
        $collection = $reflector->getClassAnnotations();

        if (!$collection || !$collection->has('Acl')) {
            return null;
        }

        $object->name = $reflectionClass->getName();
        $object->shortName = $reflectionClass->getShortName();

        $description = '';
        if ($collection->has('Description')) {
            $description = $collection->get('Description');
        }

        $annotation = $collection->get('Acl');

        if ($actions = $annotation->getNamedArgument('actions')) {
            $actions = explode(',', $actions);
        }

        if ($options = $annotation->getNamedArgument('options')) {
            $options = explode(',', $options);
        }

        $object->description = $description;
        $object->options = $options;
        $object->actions = $actions;
        $object->path = $filePath;

        return $object;
    }

    /**
     * Check whether a role is allowed to access an action from a resource
     *
     * @param mixed $roleName
     * @param mixed $resourceName
     * @param mixed $access
     * @param array $parameters
     * @return bool
     */
    public function isAllowed($roleName, $resourceName, $access, array $parameters = null)
    {
        if (!is_array($roleName)) {
            $roleName = [$roleName];
        }

        $acl = $this->introspect();

        foreach ($roleName as $name) {
            if ($acl->isAllowed($name, $resourceName, $access, $parameters)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Introspect the access objects (, initialize the ACL adapter) and get ACL adapter.
     *
     * @return AdapterInterface
     */
    protected function introspect()
    {
        if (!$this->acl) {
            /** @var \Phalcon\Cache\BackendInterface $cache */
            $cache = $this->getDI()->getDataCache();
            $acl   = $cache->get($this->config->get('cacheKey'));

            if (!$acl || ENV_LOCAL === APPLICATION_ENV) {
                $save = !$acl && ENV_PRODUCTION === APPLICATION_ENV;

                /** @var \Phalcon\Acl\AdapterInterface $acl */
                $adapter = $this->config->get('adapter');
                $acl = new $adapter();
                $acl->setDefaultAction(Acl::DENY);

                /** @var Service\Role $rolesService */
                $rolesService = $this->getDI()->getShared(Service\Role::class);
                $roleNames = [];

                foreach ($rolesService->getList() as $role) {
                    $acl->addRole(new Acl\Role($role->name, $role->description));
                    $roleNames[$role->id] = $role->name;
                }

                $acl->addResource(new Acl\Resource(self::ADMIN_AREA), 'access');
                $acl->allow($rolesService->getOrCreateAdminRole()->getName(), self::ADMIN_AREA, 'access');

                $objects = $this->addResources($acl);

                foreach (Access::find() as $access) {
                    /** @var Access $access */
                    if (!isset($objects[$access->getObject()])) {
                        continue;
                    }

                    $object = $objects[$access->getObject()];
                    $value  = $access->getValue();

                    if (in_array($access->getAction(), $object->actions) && ($value == 'allow' || $value == 'deny')) {
                        $acl->$value($roleNames[$access->getRoleId()], $access->getObject(), $access->getAction());
                    }
                }

                if ($save && !empty($objects)) {
                    $cache->save($this->config->get('cacheKey'), $acl, $this->config->get('lifetime'));
                }
            }

            $this->acl = $acl;
        }

        return $this->acl;
    }

    /**
     * Add resources to ACL.
     *
     * @param  AdapterInterface $acl
     * @return array
     */
    protected function addResources(AdapterInterface $acl)
    {
        $objects = [];
        $modelsDir = $this->getDI()->getShared('config')->get('application')->modelsDir;

        if (file_exists($modelsDir)) {
            $dir = new DirectoryIterator($modelsDir);

            foreach ($dir as $fileInfo) {
                if ($fileInfo->isDir() || $fileInfo->getBasename()[0] == '.' || $fileInfo->getExtension() !== 'php') {
                    continue;
                }

                if (!$object = $this->getObject($fileInfo->getPathname())) {
                    continue;
                }

                $objects[$object->name] = $object;
            }
        }

        $objects[self::ADMIN_AREA] = (object) [
            'name'        => self::ADMIN_AREA,
            'shortName'   => self::ADMIN_AREA,
            'actions'     => ['access'],
            'description' => self::ADMIN_AREA_DESCRIPTION,
            'options'     => [],
            'path'        => null,
        ];

        foreach ($objects as $key => $object) {
            $resource = new Acl\Resource($key, $object->description);

            if (!isset($object->actions) || !is_array($object->actions)) {
                $object->actions = [];
            }

            $acl->addResource($resource, $object->actions);
        }

        return $objects;
    }
}
