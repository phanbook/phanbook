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

$uri = urldecode(
    parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH)
);

if ($uri !== '/' && file_exists(__DIR__ . $uri)) {
    return false;
}

if ($uri !== '/' && file_exists(__DIR__ . '/public' . $uri)) {
    header('Location: /public' . $_SERVER['REQUEST_URI'], true, 303);
    exit;
}

if (preg_match('#(?:^/core/(?:assets|themes|uploads)(?:$|/|[?]))#', $uri)) {
    return false;
}

if (preg_match('#^/core/modules/[^/]+/assets/#', $uri)) {
    return false;
}

if(preg_match('#^/([^/]+)/assets/(.+)#', $uri, $m)) {
    header('Location: /core/modules/' . $m[1]. '/assets/'. $m[2], true, 303);
    exit;
}

$_GET['_url'] = $_SERVER['REQUEST_URI'];
require_once __DIR__ . '/public/index.php';
