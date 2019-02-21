namespace App\Service;

use namespace App\Handler;
use type Nuxed\Container\Container;
use type Nuxed\Container\ServiceProvider\AbstractServiceProvider;

class AppServiceProvider extends AbstractServiceProvider {
  /**
   * Here, you are should mention all services
   * that this provider registers on the container
   * when `->register()` is called.
   */
  protected vec<string> $provides = vec[
    Handler\HomeHandler::class,
    Handler\WelcomeHandler::class,
  ];

  <<__Override>>
  public function register(Container $container): void {
    $container->share(
      Handler\HomeHandler::class,
      () ==> new Handler\HomeHandler(),
    );
    $container->share(
      Handler\WelcomeHandler::class,
      () ==> new Handler\WelcomeHandler(),
    );
  }
}
