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

use Phanbook\Models\Services\Service;
use Phanbook\Models\PostsViews as Entity;
use Phanbook\Models\Repositories\Repository;
use Phanbook\Models\Repositories\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Models\Services\Service\PostViews
 *
 * @package Phanbook\Models\Services\Service
 */
class PostViews extends Service
{
    /**
     * Finds PostsViews by ID.
     *
     * @param  int $id The PostViews ID.
     * @return Entity|null
     */
    public function findById($id)
    {
        return Repository::getPostViews()->findById($id);
    }

    /**
     * Get PostsViews by ID.
     *
     * @param  int $id The PostsViews ID.
     * @return Entity
     *
     * @throws EntityNotFoundException
     */
    public function getById($id)
    {
        return Repository::getPost()->get($id);
    }
}
