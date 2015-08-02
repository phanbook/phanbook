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
 * Phanbook\Badges\Badge\Commentator
 *
 * More than 10 replies
 */
class Commentator extends BadgeBase
{
    protected $name = 'Commentator';

    protected $description = 'More than 10 replies on different threads';

    /**
     * Check whether the user can have the badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function canHave(Users $user)
    {
        return $user->countReplies() >= 10;
    }
}
