<?php
/*
 * emyi
 *
 * @link http://github.com/douggr/emyi for the canonical source repository
 * @license http://opensource.org/licenses/MIT MIT License
 */

namespace Controllers;

use Emyi\Mvc\Controller;

/**
 *
 */
class Index extends Controller
{
    public function get()
    {
        $this->createView()
            ->loadTemplate('index.tpl');
    }
}
