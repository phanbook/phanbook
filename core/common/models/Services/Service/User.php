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

use Phanbook\Models\Karma;
use Phanbook\Models\Users as Entity;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Repositories\Repository;
use Phanbook\Models\Repositories\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Models\Services\Service\User
 *
 * @package Phanbook\Models\Services\Service
 */
class User extends Service
{
    /**
     * Finds User by ID.
     *
     * @param  int $id The User ID.
     * @return Entity|null
     */
    public function findById($id)
    {
        return Repository::getUser()->findById($id);
    }

    /**
     * Get User by ID.
     *
     * @param  int $id The User ID.
     * @return Entity
     *
     * @throws EntityNotFoundException
     */
    public function getById($id)
    {
        return Repository::getPost()->get($id);
    }

    /**
     * Checks whether the User is moderator.
     *
     * @param  int $id The User ID.
     * @return bool
     */
    public function isModerator($id)
    {
        $user = $this->getById($id);

        return $user->getModerator() == 'Y';
    }

    /**
     * Increase User karma.
     *
     * @param  int $id The User ID.
     * @return $this
     */
    public function increaseAuthorKarmaByVisit($id)
    {
        $user = $this->getById($id);

        if ($this->isModerator($id)) {
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
