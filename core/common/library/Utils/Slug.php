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

/**
 * Slug
 * @todo remove because it for now in core Phalcon
 * Transforms a string or part thereof using an ICU transliterator.
 */
class Slug
{
    /**
     * Creates a slug to be used for pretty URLs.
     *
     * @link   http://cubiq.org/the-perfect-php-clean-url-generator
     * @param  $string
     * @param  array  $replace
     * @param  string $delimiter
     * @return mixed
     * @throws \Phalcon\Exception
     */
    public static function generate($string, $replace = array(), $delimiter = '-')
    {
        if (!extension_loaded('iconv')) {
            throw new \Phalcon\Exception('iconv module not loaded');
        }

        // Save the old locale and set the new locale to UTF-8
        $oldLocale = setlocale(LC_ALL, '0');
        setlocale(LC_ALL, 'en_US.UTF-8');

        // Better to replace given $replace array as index => value
        // Example $replace['ı' => 'i', 'İ' => 'i'];
        if (!empty($replace) && is_array($replace)) {
            $string = str_replace(array_keys($replace), array_values($replace), $string);
        }

        // replace non letter or non digits by -
        $string = preg_replace("#[^\\pL\d]+#u", '-', $string);

        // Trim trailing -
        $string = trim($string, '-');

        $clean = iconv('UTF-8', 'ASCII//TRANSLIT', $string);

        $clean = preg_replace("/[^a-zA-Z0-9\/_|+ -]/", '', $clean);
        $clean = strtolower($clean);
        $clean = preg_replace("/[\/_|+ -]+/", $delimiter, $clean);
        $clean = trim($clean, $delimiter);

        // Revert back to the old locale
        setlocale(LC_ALL, $oldLocale);

        return $clean;
    }
}
