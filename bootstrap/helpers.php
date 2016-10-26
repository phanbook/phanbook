<?php

if (!function_exists('d')) {
    function d($variable, $kill = true)
    {
        var_export($variable);

        if ($kill) {
            die();
        }
    }
}
