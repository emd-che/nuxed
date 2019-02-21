namespace App\Handler;

use namespace Nuxed\Kernel\Handler;
use type Nuxed\Contract\Http\Message\ServerRequestInterface;
use type Nuxed\Contract\Http\Message\ResponseInterface;

class HomeHandler extends Handler\AbstractHandler {
  use Handler\ResponseFactoryTrait;
  use Handler\ServicesTrait;

  /**
   * Handle the request and return a response.
   */
  <<__Override>>
  public async function handle(
    ServerRequestInterface $request,
  ): Awaitable<ResponseInterface> {
    $session = $this->session($request);
    // user didn't visit the welcome page.
    if (!$session->contains('welcome')) {
      return $this->redirect($this->router()->generateUri('welcome'));
    }

    $counter = $session->get('counter', 0) as int;
    $session->set('counter', $counter + 1);
    return $this->json(dict[
      'status' => 'success',
      'data' => dict[
        'counter' => $counter,
        'request' => dict[
          'server' => $request->getServerParams(),
          'headers' => $request->getHeaders(),
          'cookies' => $request->getCookieParams(),
          'session' => $session->items(),
        ],
      ],
    ]);
  }
}
