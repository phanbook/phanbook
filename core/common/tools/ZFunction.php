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
namespace Phanbook\Tools;

use Phalcon\Di\Injectable;

/**
 * PHP Functions in Volt
 */
class ZFunction extends Injectable
{
    /**
     * Get either a Gravatar URL or complete image tag for a specified email address.
     *
     * @param  string $email The email address
     * @param  string $s     Size in pixels, defaults to 80px [ 1 - 2048 ]
     * @param  string $d     Default imageset to use [ 404 | mm | identicon | monsterid | wavatar ]
     * @param  string $r     Maximum rating (inclusive) [ g | pg | r | x ]
     * @return String containing either just a URL or a complete image tag
     */
    public static function getUrlAvatar($email, $s = 32, $d = 'identicon', $r = 'pg')
    {

        $url = 'https://www.gravatar.com/avatar/';
        $url .= md5(strtolower(trim($email)));
        $url .= "?s={$s}&d={$d}&r={$r}";
        return $url;
    }
    /**
     * Retrieve an image to represent an attachment.
     *
     * @todo Use Apache (Nginx) instead of this (PHP)
     * @param  string $name A name images you want to get
     * @return string
     */
    public static function getImageSrc($name = 'logo.png')
    {
        if (file_exists(content_path("uploads/$name"))) {
            return "/content/uploads/$name";
        }

        return "/core/assets/images/$name";
    }
    /**
     * Display date to human easy  understand
     *
     * @param int $date unixtime
     *
     * @return string
     */
    public static function getHumanDate($date)
    {
        $diff = time() - $date;
        if ($diff > (86400 * 30)) {
            return date('M j/y \a\t h:i', $date);
        } else {
            if ($diff > 86400) {
                return ((int)($diff / 86400)) . 'd ago';
            } else {
                if ($diff > 3600) {
                    return ((int)($diff / 3600)) . 'h ago';
                } else {
                    return ((int)($diff / 60)) . 'm ago';
                }
            }
        }
    }

    /**
     * Create a file in your project
     *
     * @param  string $file This full path file you want to created
     * @return mixed|bool
     */
    public static function makeFile($file)
    {
        if (!file_exists($file)) {
            if (!touch($file)) {
                $message = "<p>You need to set permission for it, just add chmod
                or chown in directory config, Also you can create file {$file} for that</p>";
                $message .= "<code> chown -R nginx:nginx -R common/config</code>";
                $message .= "or#<code> chown -R apache:apache -R common/config</code>";

                throw new \Exception($message, 1);
            }
            return false;
        }
        return true;
    }

    /**
     * Updated core Phanbook via git
     *
     * @return string
     */
    public static function gitUpdate()
    {
        // The commands
        $commands = array(
            'echo $PWD',
            'whoami',
            'git update-index --skip-worktree common/config/options.php',
            'git reset --hard HEAD',
            'git pull origin master',
            'git status',
            'git submodule sync',
            'git submodule update',
            'git submodule status',
        );
        // Run the commands for output
        $output = '';
        foreach ($commands as $command) {
            // Run it
            $tmp = shell_exec($command);
            // Output
            $output .= "<span style=\"color: #6BE234;\">\$</span> <span style=\"color: #729FCF;\">{$command}\n</span>";
            $output .= htmlentities(trim($tmp)) . "\n";
        }
        return $output;
    }
    /**
     * Helper - Safely add assets to your theme
     *
     * @deprecated
     * @param  string
     * @return string
     */
    public static function assets($path)
    {
        $di = new self;
        $theme =  $di->getDI()->getConfig()->theme;

        return '/content/themes/' . $theme . '/assets/' . $path;
    }
}
