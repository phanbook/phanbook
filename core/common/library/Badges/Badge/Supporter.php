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
use Phanbook\Models\Vote;

/**
 * Phanbook\Badges\Badge\Supporter
 *
 * First positive vote to another user
 */
class Supporter extends BadgeBase
{
    protected $name = 'Supporter';

    protected $description = 'First positive vote to another user';

    /**
     * Check whether the user can have the badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function canHave(Users $user)
    {
        $canHave = Vote::count(
            [
            'usersId = ?0 AND positive = 1',
            'bind' => [$user->getId()]
            ]
        ) > 0;
        ;

        return $canHave;
    }
}
