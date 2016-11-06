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
use Phanbook\Models\Vote as VoteEntity;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Models\Services\Service\Vote
 *
 * @package Phanbook\Models\Services\Service
 */
class Vote extends Service
{
    /**
     * Finds Vote by ID.
     *
     * @param  int $id The Posts ID.
     * @return VoteEntity|null
     */
    public function findFirstById($id)
    {
        return VoteEntity::findFirstById($id) ?: null;
    }

    /**
     * Get Vote by ID.
     *
     * @param  int $id The Posts ID.
     * @return VoteEntity
     *
     * @throws EntityNotFoundException
     */
    public function getFirstById($id)
    {
        if (!$post = $this->findFirstById($id)) {
            throw new EntityNotFoundException($id);
        }

        return $post;
    }

    /**
     * Get votes for entity.
     *
     * @param int    $id
     * @param string $object
     *
     * @return mixed
     */
    public function getVotes($id, $object)
    {
        $modelsManager = $this->getDI()->getShared('modelsManager');

        return $modelsManager->createBuilder()
            ->columns(['COALESCE(SUM(positive), 0) AS positive', 'COALESCE(SUM(negative), 0) AS negative'])
            ->from(VoteEntity::class)
            ->where('objectId = :objectId:')
            ->andWhere('object = :object:')
            ->getQuery()
            ->execute(['objectId' => $id, 'object' => $object])
            ->getFirst()
            ->toArray();
    }
}
