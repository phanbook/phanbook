<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Badges\Badge;

use Phanbook\Models\Users;
use Phanbook\Badges\BadgeBase;

/**
 * Phanbook\Badges\Badge\Moderator
 *
 * To users that are moderators
 */
class Moderator extends BadgeBase
{
    protected $name = 'Moderator';

    protected $description = 'User is a moderator';

    /**
     * Check whether the user can have the badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function canHave(Users $user)
    {
        return $user->getModerator() == 'Y';
    }
}
