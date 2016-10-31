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
 * \Phanbook\Models\Repositories\AccessorObjectIdentifier
 *
 * @package Phanbook\Models\Repositories
 */
final class AccessorObjectIdentifier implements ObjectIdentifier
{
    /**
     * The Identifier Getter
     * @var string
     */
    private $accessor;

    /**
     * AccessorObjectIdentifier constructor.
     *
     * @param $accessor
     */
    public function __construct($accessor)
    {
        $this->accessor = $accessor;
    }

    /**
     * Get Entity Identity.
     *
     * @param  ModelInterface $entity
     * @return mixed
     * @throws RuntimeException
     */
    public function getIdentity(ModelInterface $entity)
    {
        if (!method_exists($entity, $this->accessor)) {
            throw new RuntimeException(
                sprintf(
                    'Object of type %s does not have accessor %s',
                    get_class($entity),
                    $this->accessor
                )
            );
        }

        return $entity->{$this->accessor}();
    }
}
