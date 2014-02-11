<?php
/*
 * emyi
 *
 * @link http://github.com/douggr/emyi for the canonical source repository
 * @license http://opensource.org/licenses/MIT MIT License
 */

ini_set('display_errors', true);

// this is the application web root
define('EAPP_ROOT', __DIR__);
// this is the application root
define('EAPP_PATH', __DIR__ . '/../application/');

if (!file_exists('../vendor/autoload.php')) {
    // set as development envoirement
    define('EMYI_DEV', 1);
    // emyi library
    define('EMYI_ROOT', realpath('../../emyi/library'));

    // define our spl autoloader
    function __autoload($class) {
        if ('Emyi' === substr($class, 0, 4)) {
            $file = EMYI_ROOT . DIRECTORY_SEPARATOR . $class;
        } else {
            $file = EAPP_PATH . DIRECTORY_SEPARATOR . $class;
        }
    
        require_once str_replace('\\', DIRECTORY_SEPARATOR, $file) . '.php';
    };

    // let it roll!
    require_once EMYI_ROOT . '/exceptions.php';
    require_once EMYI_ROOT . '/bootstrap.php';
} else {
    require_once '../vendor/autoload.php';
}

Emyi\Util\Router::dispatch(Emyi\Http\Request::fromServer());
