<?php

use Phanbook\Common\Library\Providers;

return [
    // Application Service Providers
    Providers\EventManagerServiceProvider::class,
    Providers\ConfigServiceProvider::class,
    Providers\UrlResolverServiceProvider::class,
    Providers\SessionServiceProvider::class,
    Providers\CollectionManagerServiceProvider::class,
    Providers\ModelsManagerServiceProvider::class,
    Providers\AuthServiceProvider::class,
    Providers\ViewCacheServiceProvider::class,
    Providers\VoltTemplateEngineServiceProvider::class,
    Providers\ViewServiceProvider::class,
    Providers\PhpTemplateEngineServiceProvider::class,
    Providers\FlashSessionServiceProvider::class,
    Providers\DatabaseServiceProvider::class,
    Providers\CookiesServiceProvider::class,
    Providers\CryptServiceProvider::class,
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
    Providers\ModulesServiceProvider::class,

    // Third Party Providers
    // ...
];
