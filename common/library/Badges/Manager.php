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

/**
 * Phanbook\Badges\Manager
 */
class Manager
{
    /**
     * Returns instances of all available badges
     *
     * @return array
     */
    public function getBadges()
    {
        $badges = array();
        $directory = new \RecursiveDirectoryIterator(__DIR__ . '/Badge');
        foreach ($directory as $item) {
            if (!$item->isDir()) {
                $path = $item->getPathname();
                $baseClassName = str_replace('.php', '', basename($path));
                $className = 'Phanbook\Badges\Badge\\' . $baseClassName;

                $badges[] = new $className();
            }
        }

        return $badges;
    }

    /**
     *
     */
    public function process()
    {
        $badges = $this->getBadges();
        foreach (Users::find() as $user) {
            $this->processUserBadges($user, $badges);
        }
    }

    /**
     * @param Users $user
     * @param array $badges
     */
    public function processUserBadges(Users $user, $badges)
    {
        foreach ($badges as $badge) {
            if (!$badge->has($user)) {
                $extra = $badge->canHave($user);
                if ($extra) {
                    $badge->add($user, $extra);
                }
            }
        }
    }
}
