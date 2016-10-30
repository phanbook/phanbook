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
namespace Phanbook\Models\Services\Service;

use Phalcon\Mvc\ModelInterface;
use Phanbook\Models\Repositories\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Models\Services\Service\ServiceInterface
 *
 * @package Phanbook\Models\Services\Service
 */
interface ServiceInterface
{
    /**
     * Finds Entity by ID.
     *
     * @param  int $id The User ID.
     * @return ModelInterface|null
     */
    public function findById($id);

    /**
     * Get Entity by ID.
     *
     * @param  int $id The Entity ID.
     * @return ModelInterface
     *
     * @throws EntityNotFoundException
     */
    public function getById($id);
}
