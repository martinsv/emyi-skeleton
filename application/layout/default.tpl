<?php
/*
 * emyi-hello-world
 *
 * @link http://github.com/douggr/emyi-hello-world for the canonical source repository
 * @license http://opensource.org/licenses/MIT MIT License
 *
 * Default callbacks:
 *  ->a      - Create a link
 *  ->e      - Create a new Element and returns it
 *  ->i      - Create an icon based on config::view/nsicon namespace
 *  ->escape - escape string text (useful for javascript strings)
 *  ->config - output the given config entry
 *  ->import - import any template file into the current view
 */

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?=$this->config('application/description')?>">
    <meta name="author" content="<?=$this->config('application/author')?>">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/<?=$this->config('local-libs/bootstrap')?>/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/<?=$this->config('local-libs/fontawesome')?>/css/font-awesome.min.css">
<?php foreach (glob(EAPP_ROOT . '/assets/css/*.css') as $css):?>
    <?=$this->e('link')
      ->rel('stylesheet')
      ->href('assets/css/' . basename($css))?>
<?php endforeach?>

    <title><?=$this->config('application/name')?></title>
  </head>

  <body class="container env-<?=$this->config('application/environment')?>">
    <header class="navbar navbar-main navbar-default navbar-fixed-top">
      <a class="navbar-brand" href="<?=$baseHref?>">Emyi Skeleton
        <small>v<?=$this->config('application/version')?></small>
      </a>
    </header>

    <main role="main" id="main">
      <?=$content?>

    </main>

    <footer class="es-footer">
      <?=$this->config('application/name')?> @
      <a href="https://github.com/douggr/emyi">Emyi</a> v<?=EMYI_VERSION_ID?>
    </footer>

    <script src="//code.jquery.com/jquery-<?=$this->config('local-libs/jquery')?>.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/<?=$this->config('local-libs/bootstrap')?>/js/bootstrap.js"></script>
    <script>
      var basehref  = '<?=$this->escape($baseHref)?>',
        uri         = '<?=$this->escape($requestUri)?>',
        controller  = '<?=$this->escape($controller)?>',
        action      = '<?=$this->escape($action)?>';
    </script>
<?php foreach (glob(EAPP_ROOT . '/assets/js/*.js') as $js):?>
    <?=$this->e('script')
      ->defer()
      ->src('assets/js/' . basename($js))?>
<?php endforeach?>
