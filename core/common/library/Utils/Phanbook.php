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
namespace Phanbook\Utils;

use Phanbook\Models\Posts;
use Phanbook\Models\Users;
use Phanbook\Tools\ZFunction;
use Phalcon\Config\Adapter\Php as AdapterPhp;
use Phanbook\Utils\Slug;

/**
 *
 */
class Phanbook
{
    /**
     * Theme name
     *
     * @var string
     */
    protected $theme = 'default';

    /**
     * This is config file get from info.php of theme inside directory content
     *
     * @var array
     */
    protected $config = [];

    public function __construct($config)
    {
        $this->config = $config;
        $this->theme  = $config['code'];
    }
    /**
     * It will use for render url in tag link, script
     *
     * @param  string $item such as css/app.css
     * @return string
     */
    public function assetContent($item)
    {
        return '/content/themes/'. $this->theme .'/' . $item;
    }

    /**
     * Retrieve a page give its title
     *
     * @param  string $title Page title
     *
     * @return object on success or null on failure
     */
    public function getPageByTitle($title)
    {
        $param = [
            'type = "pages" AND title =?0',
            'bind' =>[$title]
        ];
        $post = Posts::findFirst($param);
        if (!$post) {
            return null;
        }
        return $post;
    }
    public function getPostBySlug($slug)
    {
        $post = Posts::findFirstBySlug($slug);
        if (!$post) {
            return null;
        }
        return $post;
    }
    /**
     * Retrieves the directory name of the current theme, without the trailing slash.
     *
     * @return string
     */
    public function getTemplate()
    {
        return themes_path($this->theme);
    }
    /**
     * Retrieves the file name of the current theme with url.
     * /about it will return such as content/themes/default/pages/about.volt
     *
     * @param  string $name
     * @return string
     */
    public function getPageFile($name)
    {
        return themes_path($this->theme . "/pages/{$name}.volt");
    }

    public function saveConfig($arrayConfig)
    {
        $filename = config_path('options/options.php');
        if (!file_exists($filename)) {
            $makeFile = ZFunction::makeFile($filename);
            file_put_contents($filename, "<?php return [];");
        }
        if (file_exists($filename)) {
            $data   = new AdapterPhp($filename);
            $result = array_merge($data->toArray(), $arrayConfig);
            $result ='<?php return ' . var_export($result, true) . ';';

            if (!file_put_contents($filename, $result)) {
                return false;
            }
            return true;
        }
    }

    /**
     * @param $id
     * @return mixed
     */
    public function getUserById($id)
    {
        return Users::findFirstById($id);
    }

    /**
     * @return \Phanbook\Utils\Slug
     */
    public function slug()
    {
        return new Slug();
    }

    /**
     * @return Tag
     */
    public function tag()
    {
        return new Tag();
    }
    /**
     * Check value to find if it was serialized.
     *
     * If $data is not an string, then returned value will always be false.
     * Serialized data is always a string.

     * @param string $data   Value to check to see if was serialized.
     * @param bool   $strict Optional. Whether to be strict about the end of the string. Default true.
     * @return bool False if not serialized and true if it was.
     */
    public function isSerialized($data, $strict = true)
    {
        // if it isn't a string, it isn't serialized.
        if (! is_string($data)) {
            return false;
        }
        $data = trim($data);
        if ('N;' == $data) {
            return true;
        }
        if (strlen($data) < 4) {
            return false;
        }
        if (':' !== $data[1]) {
            return false;
        }
        if ($strict) {
            $lastc = substr($data, -1);
            if (';' !== $lastc && '}' !== $lastc) {
                return false;
            }
        } else {
            $semicolon = strpos($data, ';');
            $brace     = strpos($data, '}');
            // Either ; or } must exist.
            if (false === $semicolon && false === $brace) {
                return false;
            }
            // But neither must be in the first X characters.
            if (false !== $semicolon && $semicolon < 3) {
                return false;
            }
            if (false !== $brace && $brace < 4) {
                return false;
            }
        }
        $token = $data[0];
        switch ($token) {
            case 's':
                if ($strict) {
                    if ('"' !== substr($data, -2, 1)) {
                        return false;
                    }
                } elseif (false === strpos($data, '"')) {
                    return false;
                }
            // or else fall through
            case 'a':
            case 'O':
                return (bool) preg_match("/^{$token}:[0-9]+:/s", $data);
            case 'b':
            case 'i':
            case 'd':
                $end = $strict ? '$' : '';
                return (bool) preg_match("/^{$token}:[0-9.E-]+;$end/", $data);
        }
        return false;
    }
}
