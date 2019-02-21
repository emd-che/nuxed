namespace App\Extension;

use namespace App\Handler;
use type Nuxed\Kernel\Extension\AbstractExtension;
use type Nuxed\Contract\Event\EventDispatcherInterface;
use type Nuxed\Contract\Http\Server\MiddlewarePipeInterface;
use type Nuxed\Contract\Http\Router\RouteCollectorInterface;
use type Nuxed\Http\Server\MiddlewareFactory;

class AppExtension extends AbstractExtension {
  /*
   * Subscribe to the event dispatcher.
   */
  <<__Override>>
  public function subscribe(EventDispatcherInterface $_events): void {}

  /*
   * Register application routes.
   *
   * In case you want to add a middleware to a specific route,
   * you can create a sub-middleware pipe for the route
   * like this :
   * <code>
   *   $router->get('/api', $middleware->prepare(Vector {
   *     MyAwesomeMiddleware::class,
   *     MyOtherMiddleware::class,
   *     ApiHandler::class
   *   }));
   * </code>
   */
  <<__Override>>
  public function route(
    RouteCollectorInterface $router,
    MiddlewareFactory $middleware,
  ): void {
    $router->get('/', $middleware->prepare(Handler\HomeHandler::class), 'home');
    $router->get(
      '/welcome',
      $middleware->prepare(Handler\WelcomeHandler::class),
      'welcome',
    );
  }

  /*
   * Pipe middleware to the middleware pipe
   */
  <<__Override>>
  public function pipe(
    MiddlewarePipeInterface $_pipe,
    MiddlewareFactory $_middlewares,
  ): void {}
}
