<?php

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
