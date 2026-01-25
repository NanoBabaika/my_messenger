<?php

require_once './config/Database.php';
require_once './classes/Model.php';
require_once './classes/User.php';
require_once './classes/Auth.php';

Auth::logout();
header('Location: login.php');
exit();
