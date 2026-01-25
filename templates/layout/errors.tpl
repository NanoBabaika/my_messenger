<div class="messages-container">
    <?php if (!empty($errors) && is_array($errors)): ?>
        <div class="message message-error">
            <div class="message-icon"></div>
            <div class="message-content">
                <div class="message-title">Обнаружены ошибки</div>
                <div class="message-text">Пожалуйста, исправьте следующие ошибки:</div>
                <ul class="errors-list">
                    <?php foreach ($errors as $error): ?>
                        <li><?php echo htmlspecialchars($error); ?></li>
                    <?php endforeach; ?>
                </ul>
            </div>
            <button class="message-close" onclick="this.parentElement.style.display='none'">
                ×
            </button>
        </div>
    <?php endif; ?>
    
    <?php if (!empty($success) && is_array($success)): ?>
        <?php foreach ($success as $msg): ?>
            <div class="message message-success">
                <div class="message-icon"></div>
                <div class="message-content">
                    <div class="message-title">Успешно!</div>
                    <div class="message-text"><?php echo htmlspecialchars($msg); ?></div>
                </div>
                <button class="message-close" onclick="this.parentElement.style.display='none'">
                    ×
                </button>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
    
    <?php if (!empty($warnings) && is_array($warnings)): ?>
        <?php foreach ($warnings as $warning): ?>
            <div class="message message-warning">
                <div class="message-icon"></div>
                <div class="message-content">
                    <div class="message-title">Внимание</div>
                    <div class="message-text"><?php echo htmlspecialchars($warning); ?></div>
                </div>
                <button class="message-close" onclick="this.parentElement.style.display='none'">
                    ×
                </button>
            </div>
        <?php endforeach; ?>
    <?php endif; ?>
</div>

<script>
    // Автоматическое скрытие сообщений через 10 секунд
    document.addEventListener('DOMContentLoaded', function() {
        const messages = document.querySelectorAll('.message');
        messages.forEach(message => {
            setTimeout(() => {
                message.style.opacity = '0.5';
                setTimeout(() => {
                    if (message.parentElement) {
                        message.style.display = 'none';
                    }
                }, 1000);
            }, 10000);
        });
    });
</script>
