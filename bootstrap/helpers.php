<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */

use Phalcon\Di;

if (!function_exists('d')) {
    function d($variable, $kill = true)
    {
        var_export($variable);

        if ($kill) {
            die();
        }
    }
}

/**
 * Translation function call anywhere.
 * Returns the translation string of the given key.
 *
 * @param string $string The string to be translated
 * @param array $placeholders The placeholders
 * @return string
 */
if (!function_exists('t')) {
    function t($string, array $placeholders = null)
    {
        $di = Di::getDefault();
        if ($di && $di->has('translation')) {
            /** @var \Phalcon\Translate\Adapter $translation */
            $translation = $di->getShared('translation');

            return $translation->t($string, $placeholders);
        }

        return $string;
    }
}
