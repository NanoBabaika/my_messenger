<?php

session_start();

require_once './config/Database.php';
require_once './classes/Model.php';
require_once './classes/User.php';
require_once './classes/Auth.php';
require_once './classes/Message.php';
require_once './classes/Validator.php';


require_once './helpers.php';
// ... НОВЫЕ КЛАССЫ ОБЯЗАТЕЛЬНО ДОБАВЛЯЕМ СЮДА


if(!Auth::isLoggedIn()) {
    header('Location: login.php');
    exit();
} 


//глобальня переменная пользователя
$currentUser = Auth::user();

if ($currentUser) {
    $currentUser->updateLastSeen();
}

$currentUserID = $currentUser-> getId();
$userName = $currentUser->getUsername();
$userEmail = $currentUser->getEmail(); 

 