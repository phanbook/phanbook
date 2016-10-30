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

use Phalcon\Mvc\ModelInterface;

/**
 * \Phanbook\Models\Repositories\Repository\RepositoryInterface
 *
 * @package Phanbook\Models\Repositories\Repository
 */
interface RepositoryInterface
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
}
