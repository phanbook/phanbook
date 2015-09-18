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
return new \Phalcon\Config([
    /**
     * The following keys provide meta-data about your theme,
     * and define some of the basic functionality.
     */
    'name' => 'Default',
    /**
     * Code detect theme
     */
    'code' => 'default',
    /**
     * The description is also displayed on the Appearance page.
     */
    'description' => 'Core theme for frontend',
    /**
     * The type key indicates the type of extension,
     * e.g. plugin, theme or profile. For themes this should always be set to "themes".
     */
    'type' => 'themes',

    'homepage' => 'http://phanbook.com',

    'version' =>  '1.0.0',

    'author' => 'Phanbook'
]);
