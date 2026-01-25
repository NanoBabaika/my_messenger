<div class="chat-container">
        <!-- Left Sidebar - Current User Profile -->
        <div class="profile-sidebar">
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar current-user-avatar">
                        <?php echo mb_substr($userName, 0, 1, 'UTF-8'); ?>
                        <div class="online-status online"></div>
                    </div>
                    <div class="profile-info">
                        <h3><?php echo $userName;?></h3>
                        <div class="username">
                            <i class="fas fa-at"></i>
                            <span><?php echo $userEmail; ?></span>
                        </div>
                    </div>
                </div>
                <p class="profile-bio">
                    Веб-разработчик, люблю путешествовать и фотографировать. Активно изучаю новые технологии.
                </p>
                
                <div class="profile-stats">
                    <div class="stat-item">
                        <span class="stat-number">247</span>
                        <span class="stat-label">Сообщений</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">42</span>
                        <span class="stat-label">Друзей</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Chat Area -->
        <div class="chat-main">
            <!-- Chat Header -->
            <div class="chat-header">
                <div class="chat-partner-info">
                    <div class="chat-avatar-small" style="background: linear-gradient(135deg, #EC4899, #F472B6);">
                        <?php echo mb_substr($partnerName, 0, 1, 'UTF-8'); ?>
                    </div>
                    <div>
                        <div class="partner-name"><?php echo $partnerName;?></div>
                        <div class="partner-status">

                            <?php if ($partner->isOnline()): ?>
                                <div class="status-dot online"></div>
                                <span>В сети</span>
                            <?php else: ?>
                                <div class="status-dot offline"></div>
                                <span><?php echo $partner->getLastSeenFormatted();?></span>                            
                            <?php endif; ?>
                             
                        </div>
                    </div>
                </div>
                <div class="chat-actions">
                    <button class="chat-action-btn" title="Информация о пользователе">
                        <i class="fas fa-info-circle"></i>
                    </button>
                    <button class="chat-action-btn" title="Настройки чата">
                        <i class="fas fa-cog"></i>
                    </button>
                </div>
            </div>

            <!-- Messages Container -->
            <div class="messages-container" data-last-id="<?= $last_message_id?>" id="messagesContainer">
                <!-- Date Separator -->
                <div class="date-separator">
                    <span>Сегодня</span>
                </div>
 
                <?php foreach ($messages as $message): ?>
                    <?php $message_status = $message->isRead();?>
                    <!-- Входящее сообщение -->
                    <?php if($message->getReceiverId() == $currentUserID): ?>                    
                        <div class="message message-incoming" data-id="<?= $message->getId() ?>">
                            <div class="message-avatar"><?php echo mb_substr($partnerName, 0, 1, 'UTF-8'); ?></div>
                            <div class="message-content">
                                <div class="message-bubble">
                                    <?php echo htmlspecialchars($message->getText()); ?>
                                </div>
                                <div class="message-info">
                                    <span class="message-sender"><?php echo $userName; ?></span>
                                    <span class="message-time"><?php echo $message->getSentAt(); ?></span>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>

                    <!-- Исходящее сообщение -->
                    <?php if($message->getReceiverId() != $currentUserID): ?>                    
                        <div class="message message-outgoing" data-id="<?= $message->getId() ?>">
                            <div class="message-avatar"><?php echo mb_substr($userName, 0, 1, 'UTF-8'); ?></div>
                            <div class="message-content">
                                <div class="message-bubble">
                                    <?php echo htmlspecialchars($message->getText()); ?>
                                </div>
                                <div class="message-info">
                                    <span class="message-time"><?php echo $message->getSentAt(); ?></span>
                                    <?php if($message_status  ===  true): ?>
                                        <span class="message-status"><i class="fas fa-check-double"></i></span>
                                    <?php endif; ?> 
                                </div>
                            </div>
                        </div>
                    <?php endif; ?> 
                <?php endforeach; ?>

 

                <!-- Пример пустого чата (закомментирован) -->
                <?php if(empty($messages)): ?>        
                    <div class="empty-chat">
                        <div class="empty-chat-icon">
                            <i class="fas fa-comments"></i>
                        </div>
                        <div class="empty-chat-text">
                            <?php echo "Начните разговор с  " . $partnerName; ?>
                        </div>
                        <p>Напишите первое сообщение, чтобы начать общение</p>
                    </div>
                <?php endif; ?>
            </div>

            <!-- Message Input -->
            <form method="POST" action="./chat.php?id=<?php echo $partnerId;?>" class="message-input-container">
 

                <div class="input-actions">
                    <button type="button" class="input-action-btn" title="Прикрепить файл" onclick="alert('В будущей версии!');">
                        <i class="fas fa-paperclip"></i>
                    </button>
                    <button type="button" class="input-action-btn" title="Смайлики" onclick="alert('Смайлики будут в следующем обновлении!');">
                        <i class="far fa-smile"></i>
                    </button>
                </div>
                
                <textarea class="message-input" name="text" 
                        placeholder="Напишите сообщение..." 
                        rows="1" 
                        required
                        autofocus><?php echo isset($_POST['message']) ? htmlspecialchars($_POST['message']) : ''; ?></textarea>
                
                <button type="submit" class="send-button" name="send_message" title="Отправить">
                    <i class="fas fa-paper-plane"></i>
                </button>
            </form>
        </div>

        <!-- Right Sidebar - Interlocutor Profile -->
        <div class="profile-sidebar">
            <div class="profile-card">
                <div class="profile-header">
                    <div class="profile-avatar interlocutor-avatar">
                        <?php echo mb_substr($partnerName, 0, 1, 'UTF-8'); ?>
                        
                        <?php if ($partner->isOnline()): ?>
                         <div class="online-status online"></div>
                        <?php else: ?>
                        <div class="online-status offline"></div>
                        <?php endif; ?>
                         
                    </div>
                    <div class="profile-info">
                        <h3><?php echo $partnerName; ?></h3>
                        <div class="username">
                            <i class="fas fa-at"></i>
                            <span><? echo $partnerEmail;?></span>
                        </div>
                    </div>
                </div>
                <p class="profile-bio">
                    UI/UX дизайнер с 5-летним опытом. Специализируюсь на создании удобных интерфейсов для веб и мобильных приложений.
                </p>
                <div class="profile-actions">
                        <button class="add-contact-btn" 
                                data-user-id="<?php echo $partner->getId();?>"
                                data-user-name="<?php echo $partner->getUsername(); ?>"
                                onclick="addToContacts(event, this)"
                                title="Добавить в контакты">
                            <i class="fas fa-user-plus"></i>
                            <span>Добавить в контакты</span>
                        </button>
                </div>


                <div class="profile-stats">
                    <div class="stat-item">
                        <span class="stat-number">512</span>
                        <span class="stat-label">Сообщений</span>
                    </div>
                    <div class="stat-item">
                        <span class="stat-number">67</span>
                        <span class="stat-label">Друзей</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

 <script>
// 1. Инициализация данных из PHP
let partnerId = <?= (int)$partnerId ?>;
let currentUserId = <?= (int)$currentUserID ?>;
let lastMessageId = parseInt(document.getElementById('messagesContainer').dataset.lastId) || 0;

const messagesContainer = document.getElementById('messagesContainer');
const partnerName = "<?= htmlspecialchars($partnerName) ?>";
const userName = "<?= htmlspecialchars($userName) ?>";

// 2. Функция для создания HTML сообщения "на лету"
function renderMessage(msg) {
    const isIncoming = msg.receiver_id == currentUserId;
    const sideClass = isIncoming ? 'message-incoming' : 'message-outgoing';
    const senderName = isIncoming ? partnerName : userName;
    const avatarLetter = senderName.charAt(0);

    // Собираем ту же верстку, что у тебя в PHP
    return `
        <div class="message ${sideClass}" data-id="${msg.id}">
            <div class="message-avatar">${avatarLetter}</div>
            <div class="message-content">
                <div class="message-bubble">
                    ${escapeHtml(msg.text)}
                </div>
                <div class="message-info">
                    <span class="message-sender">${senderName}</span>
                    <span class="message-time">${msg.sent_at}</span>
                </div>
            </div>
        </div>
    `;
}


// Функция запроса новых сообщений
async function fetchNewMessages() {
    try {
        const response = await fetch(`get_new_messages.php?partner_id=${partnerId}&last_id=${lastMessageId}`);
        const newMessages = await response.json();

        if (newMessages.length > 0) {
            newMessages.forEach(msg => {
                // Вставляем новое сообщение в конец контейнера
                messagesContainer.insertAdjacentHTML('beforeend', renderMessage(msg));
                // Обновляем ID последнего сообщения
                lastMessageId = msg.id;
            });
            
            // Прокручиваем чат вниз к новому сообщению
            messagesContainer.scrollTop = messagesContainer.scrollHeight;
        }
    } catch (error) {
        console.error("Ошибка обновления чата:", error);
    }
}

// Вспомогательная функция для защиты от XSS (аналог htmlspecialchars)
function escapeHtml(text) {
    let div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

// 4. Запускаем цикл опроса (раз в 3 секунды)
setInterval(fetchNewMessages, 3000);

// Прокрутка вниз при первой загрузке
messagesContainer.scrollTop = messagesContainer.scrollHeight;
</script>

 
</body>
</html>