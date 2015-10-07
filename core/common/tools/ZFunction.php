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
namespace Phanbook\Tools;

/**
 * PHP Functions in Volt
 */
class ZFunction
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

        $url = 'http://www.gravatar.com/avatar/';
        $url .= md5(strtolower(trim($email)));
        $url .= "?s={$s}&d={$d}&r={$r}";
        return $url;
    }
    /**
     * Retrieve an image to represent an attachment.
     *
     * @param string  A name images you want to get
     *
     * @return string
     */
    public static function getImageSrc($name = 'logo.png')
    {
        $path = '/content/uploads/' . $name;
        if (file_exists(ROOT_DIR . $path)) {
            return $path;
        }
        return '/core/assets/images/' . $name;
    }
    /**
     * Display date to hume easy  understand
     *
     * @param int $date unixtime
     *
     * @return string
     */
    public static function getHumanDate($date)
    {
        $diff = time() - $date;
        if ($diff > (86400 * 30)) {
            return date('M \'y', $date);
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
     * truncate method.
     *
     * @access public
     * @static
     * @param  mixed  $str
     *
     * @param int    $maxLen (default: 35)
     *
     * @param  string $suffix (default: '...')
     * @return void
     */
    public static function truncate($str, $maxLen = 35, $suffix = '...')
    {
        if (self::strlen($str) <= $maxLen) {
            return $str;
        }

        $str = utf8_decode($str);
        return (utf8_encode(substr($str, 0, $maxLen - self::strlen($suffix)).$suffix));
    }

    /**
     * strlen method.
     *
     * @access public
     * @static
     * @param  mixed  $str
     *
     * @param  string $encoding (default: 'UTF-8')
     * @return void
     */
    public static function strlen($str, $encoding = 'UTF-8')
    {
        if (is_array($str)) {
            return false;
        }
        $str = html_entity_decode($str, ENT_COMPAT, 'UTF-8');
        if (function_exists('mb_strlen')) {
            return mb_strlen($str, $encoding);
        }
        return strlen($str);
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
}
