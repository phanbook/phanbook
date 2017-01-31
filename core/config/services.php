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

return [
    // Model Services
    Phanbook\Models\Services\Service\Post::class         => Phanbook\Models\Services\Service\Post::class,
    Phanbook\Models\Services\Service\Settings::class     => Phanbook\Models\Services\Service\Settings::class,
    Phanbook\Models\Services\Service\User::class         => Phanbook\Models\Services\Service\User::class,
    Phanbook\Models\Services\Service\Vote::class         => Phanbook\Models\Services\Service\Vote::class,
    Phanbook\Models\Services\Service\FailedLogin::class  => Phanbook\Models\Services\Service\FailedLogin::class,
    Phanbook\Models\Services\Service\SuccessLogin::class => Phanbook\Models\Services\Service\SuccessLogin::class,

    // Other Services
];
