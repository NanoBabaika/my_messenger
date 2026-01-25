<?php

require_once 'init.php';
  
if(!Auth::isLoggedIn()) {
    header('Location: login.php');
    exit();
}
 
// Ищем партнера по id
$partnerId = $_GET['id'];

$partner = User::find($partnerId);

Message::markAsReadFromContact($partnerId, $currentUserID);

// Находим все его параметры
$partnerName = $partner->getUsername();

$partnerEmail = $partner->getEmail(); 

$messages = Message::getConversation($currentUser->getId(), $partnerId);

// $last_message_id = $last_message->getId();
$last_message_id = !empty($messages) ? end($messages)->getId() : 0;
$partner->getLastSeenFormatted();

if(isset($_POST['send_message'])) {
    $message = new Message($currentUserID, $partnerId, $_POST['text']);
    
    if ($message->save()) {
        
        redirect("chat.php?id=$partnerId");
        exit();
    }
}

require_once './templates/layout/header.tpl';
require_once './templates/pages/chat.tpl';
?>

<script>
        const message_container = document.getElementById('messagesContainer');
        console.log(message_container);

        console.log('Скрипт по запросу новых сообщений запущен!');
        // Передаем данные из PHP в JavaScript переменные
        const partnerId = <?= (int)$partnerId ?>;
        let lastMessageId = <?= (int)$last_message_id ?>;
        
        // Функция, которая будет стучаться в API
        async function checkNewMessages() {
            try {
                // Формируем запрос с параметрами
                const response = await fetch(`get_new_messages.php?partner_id=${partnerId}&last_id=${lastMessageId}`);
                const newMessages = await response.json();

                if (newMessages.length > 0) {
                    // 1. Отрисовываем сообщения (здесь нужен будет JS-код добавления в DOM)
                    console.log("Новые сообщения:", newMessages);
                    
                    // 2. Обновляем ID последнего сообщения, чтобы в следующий раз просить только еще более новые
                    lastMessageId = newMessages[newMessages.length - 1].id;
                }
            } catch (error) {
                console.error("Ошибка при получении сообщений:", error);
            }
        }

        // Запускаем проверку каждые 3 секунды
        setInterval(checkNewMessages, 3000);
</script>

<?php
require_once './templates/layout/footer.tpl';

 