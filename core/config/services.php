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
