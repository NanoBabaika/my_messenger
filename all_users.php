<?php

require_once 'init.php';

$users = User::getAllExcept($currentUser->getId());

require_once './templates/layout/header.tpl';
require_once './templates/pages/all_users.tpl';
require_once './templates/layout/footer.tpl';