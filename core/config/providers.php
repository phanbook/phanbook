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

    // Third Party Providers
    // ...
];
