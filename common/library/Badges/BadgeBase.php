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
namespace Phanbook\Badges;

use Phanbook\Models\Users;
use Phanbook\Models\UsersBadges;
use Phanbook\Models\Tags;

/**
 * Phanbook\Badges\Manager
 */
class BadgeBase
{
    protected $noBountyTags;

    protected $fullNoBountyTags;

    /**
     * Check whether the user already have this badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function has(Users $user)
    {
        return UsersBadges::count(
            [
            'usersId = ?0 AND badge = ?1',
            'bind' => array($user->getId(), $this->getName())
            ]
        ) > 0;
    }

    /**
     * Returns the name of the badge
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Returns the description of the badge
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Add the badge to ther user
     *
     * @param Users $user
     * @param array $extra
     */
    public function add(Users $user, $extra = null)
    {
        $userBadge = new UsersBadges();
        $userBadge->setUsersId($user->getId());
        $userBadge->setBadge($this->getName());
        /**
         * Default it will set Bronze badges.
         * In each class extend it will overwrite
         */
        $userBadge->setCode3(UsersBadges::CODE);
        var_dump($userBadge->save());
    }

    /**
     * Returns those tags id that don't have bounties
     *
     * @return array
     */
    public function getNoBountyTags()
    {
        if (!$this->noBountyTags) {
            $tags = [];
            foreach (Tags::find('noBounty = "Y"') as $tag) {
                $tags[] = $tag->getId();
            }
            $this->noBountyTags = $tags;
        }
        return $this->noBountyTags;
    }

    /**
     * Returns those tags that don't have bounties
     *
     * @return array
     */
    public function getFullNoBountyTags()
    {
        if (!$this->fullNoBountyTags) {
            $this->fullNoBountyTags = Tags::find('noBounty = "Y"')->toArray();
        }
        return $this->fullNoBountyTags;
    }
}
