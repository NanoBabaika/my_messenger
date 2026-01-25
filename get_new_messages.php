<?php
require_once 'init.php';  

// Берем данные строго из массива $_GET
// Используем (int), чтобы обезопасить запрос и избежать null
$partnerId = isset($_GET['partner_id']) ? (int)$_GET['partner_id'] : 0;
$lastId = isset($_GET['last_id']) ? (int)$_GET['last_id'] : 0;

 
// var_dump($currentUser->getId(), $partnerId, $lastId); 

if ($partnerId > 0) {
    $messages = Message::getNewMessages($currentUser->getId(), $partnerId, $lastId);
} else {
    $messages = [];
}

header('Content-Type: application/json');
echo json_encode($messages);
exit();
