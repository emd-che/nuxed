require __DIR__.'/../vendor/autoload.hack';

<<__EntryPoint>>
async function format(): Awaitable<noreturn> {
  Facebook\AutoloadMap\initialize();

  $source = new Nuxed\Io\Folder(__DIR__ . '/../src/App');
  foreach ($source->files(true, true) as $file) {
    if ($file->ext() === 'hack') {
     exec('hackfmt -i '.$file->path());
    }
  }
  $file = new Nuxed\Io\File(__DIR__ . '/../public/main.hack');
  exec('hackfmt -i '. $file->path());

  exit(0);
}
