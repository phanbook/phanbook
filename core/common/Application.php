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
namespace Phanbook\Common;

use Phalcon\Di;
use Dotenv\Dotenv;
use Phalcon\Di\Service;
use Phalcon\DiInterface;
use InvalidArgumentException;
use Phalcon\Di\ServiceInterface;
use Phalcon\Http\ResponseInterface;
use Phalcon\Mvc\Application as MvcApplication;
use Phalcon\Application as AbstractApplication;
use Phanbook\Common\Library\Providers\ModulesServiceProvider;
use Phanbook\Common\Library\Providers\ServiceProviderInterface;
use Phanbook\Common\Library\Providers\EventManagerServiceProvider;

/**
 * \Phanbook\Common\Application
 *
 * @package Phanbook\Common
 */
class Application
{
    /**
     * The Dependency Injector.
     * @var DiInterface
     */
    protected $di;

    /**
     * The Service Providers.
     * @var ServiceProviderInterface[]
     */
    protected $serviceProviders = [];

    /**
     * The Application Services.
     * @var ServiceInterface[]
     */
    protected $services = [];

    /**
     * The Phalcon Application.
     * @var AbstractApplication
     */
    protected $app;

    /**
     * The Application mode
     * @var string
     */
    protected $mode;

    /**
     * Application constructor.
     *
     * @param string $mode The Application mode: either "normal" either "cli" or "api".
     */
    public function __construct($mode = 'normal')
    {
        $dotenv = new Dotenv(realpath(ROOT_DIR));
        $dotenv->load();

        $this->di = new Di();
        $this->app = $this->createInternalApplication($mode);

        $this->di->setShared('dotenv', $dotenv);
        $this->di->setShared('bootstrap', $this);

        Di::setDefault($this->di);
        $this->initializeServiceProvider(new EventManagerServiceProvider($this->di));
        $this->initializeServiceProvider(new ModulesServiceProvider($this->di));

        /** @noinspection PhpIncludeInspection */
        $providers = require config_path('providers.php');
        if (is_array($providers)) {
            $this->initializeServiceProviders($providers);
        }

        $this->app->setEventsManager($this->di->getShared('eventsManager'));
        $this->app->setDI($this->di);

        /** @noinspection PhpIncludeInspection */
        $services = require config_path('services.php');
        if (is_array($services)) {
            $this->initializeServices($services);
        }
    }

    /**
     * Runs the Application.
     *
     * @return string
     */
    public function run()
    {
        return $this->getOutput();
    }

    /**
     * Get current Application instance.
     *
     * @return AbstractApplication|Console|MvcApplication
     */
    public function getApplication()
    {
        return $this->app;
    }

    /**
     * Get Application mode.
     *
     * @return string
     */
    public function getMode()
    {
        return $this->mode;
    }

    /**
     * Get registered service providers.
     *
     * @return ServiceProviderInterface[]
     */
    public function getServiceProviders()
    {
        return $this->serviceProviders;
    }

    /**
     * Get registered services.
     *
     * @return ServiceInterface[]
     */
    public function getServices()
    {
        return $this->services;
    }

    /**
     * Get Application output.
     *
     * @return ResponseInterface|string
     */
    protected function getOutput()
    {
        $response = $this->app->handle();

        if ($this->app instanceof MvcApplication) {
            return $response->getContent();
        } else {
            return $response;
        }
    }

    /**
     * Initialize Services in the Dependency Injector Container.
     *
     * @param  string[] $providers
     * @return $this
     */
    protected function initializeServiceProviders(array $providers)
    {
        foreach ($providers as $name => $class) {
            $this->initializeServiceProvider(new $class($this->di));
        }

        return $this;
    }

    /**
     * Register services in the Dependency Injector Container.
     *
     * This allows to inject dependencies by using abstract classes.
     *
     * <code>
     * $services = [
     *     '\My\Awesome\Logger\Interface' => '\My\Concrete\Logger'
     * ];
     *
     * $application->initializeModelServices($services);
     * </code>
     *
     * @param  string[] $services
     * @return $this
     */
    protected function initializeServices(array $services)
    {
        foreach ($services as $abstract => $concrete) {
            $service = new Service($abstract, $concrete, true);
            $this->di->setRaw($abstract, $service);

            $this->services[$abstract] = $service;
        }

        return $this;
    }

    /**
     * Initialize the Service in the Dependency Injector Container.
     *
     * @param  ServiceProviderInterface $serviceProvider
     * @return $this
     */
    protected function initializeServiceProvider(ServiceProviderInterface $serviceProvider)
    {
        $serviceProvider->register();
        $serviceProvider->boot();

        $this->serviceProviders[$serviceProvider->getName()] = $serviceProvider;

        return $this;
    }

    /**
     * Create internal Application to handle requests.
     *
     * @param  string $mode The Application mode.
     * @return Console|MvcApplication
     *
     * @throws InvalidArgumentException
     */
    protected function createInternalApplication($mode)
    {
        $this->mode = $mode;

        switch ($mode) {
            case 'normal':
                return new MvcApplication($this->di);
            case 'cli':
                return new Console($this->di);
            case 'api':
                throw new InvalidArgumentException(
                    'Not implemented yet.'
                );
            default:
                throw new InvalidArgumentException(
                    sprintf(
                        'Invalid Application mode. Expected either "normal" either "cli" or "api". Got %s',
                        is_scalar($mode) ? $mode : var_export($mode, true)
                    )
                );
        }
    }
}
