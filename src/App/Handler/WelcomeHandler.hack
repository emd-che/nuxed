namespace App\Handler;

use namespace Nuxed\Kernel\Handler;
use type Nuxed\Contract\Http\Message\ServerRequestInterface;
use type Nuxed\Contract\Http\Message\ResponseInterface;

class WelcomeHandler extends Handler\AbstractHandler {
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
    // user has already been here before.
    if ($session->contains('welcome')) {
      return $this->redirect($this->router()->generateUri('home'));
    }

    $session->set('welcome', true);
    return $this->json(dict[
      'status' => 'success',
      'data' => dict[
        'message' => 'welcome',
      ],
    ]);
  }
}
