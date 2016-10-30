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
 * \Phanbook\Models\Repositories\ObjectIdentifier
 *
 * @package Phanbook\Models\Repositories
 */
interface ObjectIdentifier
{
    /**
     * Get Entity identity.
     *
     * @param  ModelInterface $entity
     * @return mixed
     */
    public function getIdentity(ModelInterface $entity);
}
