require __DIR__.'/../vendor/autoload.hack';

<<__EntryPoint>>
async function main(): Awaitable<noreturn> {
  /**
   * Initialize the autoloader.
   */
  Facebook\AutoloadMap\initialize();

  /**
   * Run the application.
   */
  return await App\run();
}
