// Функция для добавления в избранное
function addToFavorites(event, button) {
    event.preventDefault();
    event.stopPropagation();
    
    const userId = button.dataset.userId;
    const userName = button.dataset.userName;
    
    if (confirm(`Отправить пользователю ${userName} приглашение в друзья?`)) {
        // Показываем состояние загрузки
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';
        button.disabled = true;
        
        // Отправляем запрос на сервер
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'add_to_favorites.php';
        form.style.display = 'none';
        
        const userIdInput = document.createElement('input');
        userIdInput.type = 'hidden';
        userIdInput.name = 'user_id';
        userIdInput.value = userId;
        
        const csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = 'csrf_token';
        csrfInput.value = '<?php echo $_SESSION['csrf_token']; ?>';
        
        form.appendChild(userIdInput);
        form.appendChild(csrfInput);
        document.body.appendChild(form);
        
        // Имитация отправки (в реальном проекте удалить setTimeout)
        setTimeout(() => {
            // В реальном проекте: form.submit();
            
            // Для демонстрации:
            button.classList.add('favorited');
            button.innerHTML = '<i class="fas fa-star"></i>';
            button.disabled = false;
            
            // Показываем уведомление
            showNotification('success', `Приглашение отправлено пользователю ${userName}!`);
            
            // Убираем форму
            form.remove();
        }, 1500);
    }
}

// Функция для добавления в контакты
function addToContacts(event, button) {
    event.preventDefault();
    
    const userId = button.dataset.userId;
    const userName = button.dataset.userName;
    
    if (confirm(`Добавить пользователя ${userName} в контакты?`)) {
        // Показываем состояние загрузки
        const originalHTML = button.innerHTML;
        button.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Добавление...';
        button.disabled = true;
        
        // Отправляем запрос на сервер
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'add_to_contacts.php';
        form.style.display = 'none';
        
        const userIdInput = document.createElement('input');
        userIdInput.type = 'hidden';
        userIdInput.name = 'user_id';
        userIdInput.value = userId;
        
        const csrfInput = document.createElement('input');
        csrfInput.type = 'hidden';
        csrfInput.name = 'csrf_token';
        csrfInput.value = '<?php echo $_SESSION['csrf_token']; ?>';
        
        form.appendChild(userIdInput);
        form.appendChild(csrfInput);
        document.body.appendChild(form);
        
        // Имитация отправки
        setTimeout(() => {
            // В реальном проекте: form.submit();
            
            // Для демонстрации:
            button.classList.add('added');
            button.innerHTML = '<i class="fas fa-check"></i> В контактах';
            button.disabled = false;
            
            // Показываем уведомление
            showNotification('success', `${userName} добавлен в контакты!`);
            
            // Убираем форму
            form.remove();
        }, 1500);
    }
}

// Функция для показа уведомлений
function showNotification(type, message) {
    // Создаем элемент уведомления
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <i class="fas fa-${type === 'success' ? 'check-circle' : 'exclamation-circle'}"></i>
        <span>${message}</span>
        <button class="notification-close">&times;</button>
    `;
    
    // Добавляем в документ
    document.body.appendChild(notification);
    
    // Показываем с анимацией
    setTimeout(() => notification.classList.add('show'), 10);
    
    // Автоматическое скрытие через 5 секунд
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => notification.remove(), 300);
    }, 5000);
    
    // Кнопка закрытия
    notification.querySelector('.notification-close').addEventListener('click', () => {
        notification.classList.remove('show');
        setTimeout(() => notification.remove(), 300);
    });
}

// CSS для уведомлений
const style = document.createElement('style');
style.textContent = `
    .notification {
        position: fixed;
        top: 20px;
        right: 20px;
        padding: 16px 24px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        gap: 12px;
        max-width: 400px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        z-index: 9999;
        transform: translateX(100%);
        opacity: 0;
        transition: all 0.3s ease;
    }
    
    .notification.show {
        transform: translateX(0);
        opacity: 1;
    }
    
    .notification-success {
        background-color: #ECFDF5;
        border: 2px solid #A7F3D0;
        color: #059669;
    }
    
    .notification-error {
        background-color: #FEF2F2;
        border: 2px solid #FECACA;
        color: #DC2626;
    }
    
    .notification i {
        font-size: 20px;
    }
    
    .notification span {
        flex: 1;
        font-weight: 500;
    }
    
    .notification-close {
        background: none;
        border: none;
        color: inherit;
        font-size: 20px;
        cursor: pointer;
        opacity: 0.7;
        padding: 0;
        width: 24px;
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .notification-close:hover {
        opacity: 1;
    }
`;
document.head.appendChild(style);
