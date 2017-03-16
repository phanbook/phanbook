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
 * Phanbook\Badges\Badge\Veteran
 *
 * More than one year in the forum and more than 1000 of karma
 */
class Veteran extends BadgeBase
{
    protected $name = 'Veteran';

    protected $description = 'More than one year in the forum and more than 1000 of karma';

    /**
     * Check whether the user can have the badge
     *
     * @param  Users $user
     * @return boolean
     */
    public function canHave(Users $user)
    {
        $date = new \DateTime();
        $date->modify('-1 year');
        return $user->getKarma() >= 1000 && $user->getCreatedAt() < $date->getTimestamp();
    }
}
