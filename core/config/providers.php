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

use Phanbook\Common\Library\Providers;

return [
    // Application Service Providers
    Providers\ConfigServiceProvider::class,
    Providers\UrlResolverServiceProvider::class,
    Providers\SessionServiceProvider::class,
    Providers\CollectionManagerServiceProvider::class,
    Providers\ModelsManagerServiceProvider::class,
    Providers\AuthServiceProvider::class,
    Providers\DataCacheServiceProvider::class,
    Providers\ViewCacheServiceProvider::class,
    Providers\VoltTemplateEngineServiceProvider::class,
    Providers\ViewServiceProvider::class,
    Providers\PhpTemplateEngineServiceProvider::class,
    Providers\FlashSessionServiceProvider::class,
    Providers\DatabaseServiceProvider::class,
    Providers\CookiesServiceProvider::class,
    Providers\CryptServiceProvider::class,
    Providers\TagServiceProvider::class,
    Providers\FilterServiceProvider::class,
    Providers\SecurityServiceProvider::class,
    Providers\ModelsCacheServiceProvider::class,
    Providers\ModelsMetadataServiceProvider::class,
    Providers\NotificationsServiceProvider::class,
    Providers\LoggerServiceProvider::class,
    Providers\MarkdownServiceProvider::class,
    Providers\MailServiceProvider::class,
    Providers\MvcDispatcherServiceProvider::class,
    Providers\TranslationServiceProvider::class,
    Providers\QueueServiceProvider::class,
    Providers\ThemeServiceProvider::class,
    Providers\PhanbookServiceProvider::class,
    Providers\EscaperServiceProvider::class,
    Providers\RequestServiceProvider::class,
    Providers\ResponseServiceProvider::class,
    Providers\RoutingServiceProvider::class,
    Providers\FilesystemServiceProvider::class,
    Providers\RandomServiceProvider::class,
    Providers\AnnotationsServiceProvider::class,
    Providers\AclServiceProvider::class,

    // Third Party Providers
    // ...
];
