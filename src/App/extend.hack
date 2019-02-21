namespace App;

use namespace Nuxed\Kernel;
use type Generator;
use type Nuxed\Kernel\Extension\ExtensionInterface;
use type Nuxed\Container\ServiceProvider\ServiceProviderInterface;

/**
 * Extend your application by registering more services to it.
 */
function services(): Generator<int, ServiceProviderInterface, void> {
  /**
   * Essential service providers.
   */
  yield new Kernel\ServiceProvider\HttpServiceProvider();
  yield new Kernel\ServiceProvider\EventServiceProvider();
  yield new Kernel\ServiceProvider\ErrorServiceProvider();
  /**
   * HTTP Session service provider.
   */
  yield new Kernel\ServiceProvider\SessionServiceProvider();
  /**
   * Application service provider.
   */
  yield new Service\AppServiceProvider();
}

/**
 * Extend your application by using more extension here.
 */
function extensions(): Generator<int, ExtensionInterface, void> {
  /**
   * Essentail HTTP extension.
   */
  yield new Kernel\Extension\HttpExtension();
  /**
   * HTTP Session extension.
   */
  yield new Kernel\Extension\SessionExtension();
  /**
   * Application extension.
   */
  yield new Extension\AppExtension();
}
