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

use Phanbook\Models\Karma;
use Phanbook\Models\Users as Entity;
use Phanbook\Models\Repositories\Repository;

/**
 * \Phanbook\Models\Repositories\Repository\User
 *
 * @package Phanbook\Models\Repositories\Repository
 */
class User extends Repository
{
    /**
     * @param  int $id User ID
     * @return Entity|null
     */
    public function findFirstById($id)
    {
        return Entity::findFirstById($id) ?: null;
    }

    /**
     * Checks whether the User is moderator.
     *
     * @param  Entity $user The User.
     * @return bool
     */
    public function isModerator(Entity $user)
    {
        return $user->getModerator() == 'Y';
    }

    /**
     * {@inheritdoc}
     *
     * @param  array  $data The Entity fields.
     * @return Entity
     */
    public function create(array $data = [])
    {
        return new Entity($data);
    }

    /**
     * Increase User karma.
     *
     * @param  Entity $user he User Entity.
     * @return $this
     */
    public function increaseAuthorKarmaByVisit(Entity $user)
    {
        if ($this->isModerator($user)) {
            $user->increaseKarma(Karma::MODERATE_VISIT_POST);
        } else {
            $user->increaseKarma(Karma::VISIT_POST);
        }

        if (!$user->save()) {
            foreach ($user->getMessages() as $message) {
                $this->logError($message);
            }
        }

        return $this;
    }
}
