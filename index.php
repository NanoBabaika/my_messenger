<?php

define('ROOT_PATH', __DIR__);

require_once 'init.php';
 
 
if(!Auth::isLoggedIn()) {
    header('Location: login.php');
    exit();
}


 
require_once './templates/layout/header.tpl';
require_once './templates/layout/index.tpl';
require_once './templates/layout/footer.tpl';

