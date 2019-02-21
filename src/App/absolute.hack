namespace App;

use namespace Nuxed\Kernel;
use namespace Nuxed\Container;
use type Nuxed\Contract\Container\ContainerInterface;
use type Nuxed\Http\Server\MiddlewareFactory as Middleware;
use type Nuxed\Contract\Http\Emitter\EmitterInterface as Emitter;
use type Nuxed\Contract\Event\EventDispatcherInterface as Events;
use type Nuxed\Contract\Http\Server\MiddlewarePipeInterface as Pipe;
use type Nuxed\Contract\Http\Router\RouteCollectorInterface as Routes;

async function run(): Awaitable<noreturn> {
  return await kernel(container())->run();
}

function kernel(ContainerInterface $container): Kernel\Kernel {
  $kernel = new Kernel\Kernel(
    $container,
    $container->get(Pipe::class) as Pipe,
    $container->get(Emitter::class) as Emitter,
    $container->get(Events::class) as Events,
    $container->get(Middleware::class) as Middleware,
    $container->get(Routes::class) as Routes,
  );
  $extensions = extensions();
  foreach (extensions() as $extension) {
    $kernel->use($extension);
  }
  return $kernel;
}

function container(): ContainerInterface {
  $container = new Container\Container();
  $container->defaultToShared(true);
  foreach (services() as $provider) {
    $container->addServiceProvider($provider);
  }
  return $container;
}
