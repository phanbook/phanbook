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
namespace Phanbook\Badges\Badge;

use Phanbook\Models\Users;
use Phanbook\Models\UsersBadges;
use Phanbook\Badges\BadgeBase;

/**
 * Phanbook\Badges\Badge\Virtuoso
 * @todo  later
 * More than 5 accepted answers in specific categories
 */
class Virtuoso extends BadgeBase
{
    protected $name = 'Virtuoso';

    protected $description = 'More than 5 accepted answers in specific categories';

    protected $query;

    public function getExpertQuery(Users $user)
    {

    }

    /**
     * Check whether the user already have this badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function has(Users $user)
    {

    }

    /**
     * Check whether the user can have the badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function canHave(Users $user)
    {

    }

    /**
     * Add the badge to ther user
     *
     * @param Users $user
     * @param array $extra
     */
    public function add(Users $user, $extra = null)
    {

    }
}
