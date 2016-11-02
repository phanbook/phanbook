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

    // Third Party Providers
    // ...
];
