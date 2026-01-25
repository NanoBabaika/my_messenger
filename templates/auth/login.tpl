<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход в Messenger</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="./static/login.css">
    <link rel="stylesheet" href="./static/errors.css">

</head>
<body>
    <div class="container">
        <!-- Левая часть с приветствием -->
        <div class="left-section">
            <div class="logo">
                <div class="logo-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <div class="logo-text">Messenger</div>
            </div>
            
            <h1 class="welcome-text">С возвращением в наш мессенджер!</h1>
            <p class="subtitle">Войдите в свой аккаунт, чтобы продолжить общение с друзьями и коллегами.</p>
            
            <ul class="features">
                <li><i class="fas fa-shield-alt"></i> Безопасное шифрование сообщений</li>
                <li><i class="fas fa-bolt"></i> Мгновенная доставка сообщений</li>
                <li><i class="fas fa-cloud"></i> Синхронизация между устройствами</li>
            </ul>
        </div>
        
        <!-- Правая часть с формой -->
        <div class="right-section">
            <h2 class="login-header">Вход в аккаунт</h2>
            <p class="login-subheader">Введите свои данные для входа в систему</p>
            
            <!-- Сообщение об ошибке (скрыто по умолчанию) -->
            <div class="error-message" id="errorMessage">
                <i class="fas fa-exclamation-circle"></i> Неверный email или пароль. Попробуйте снова.
            </div>
            
            <form method="POST"   action="login.php" >
                <div class="form-group">
                    <label for="email">Email</label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email"  name="email" placeholder="example@mail.com" >
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Пароль</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password"  name="password" placeholder="Введите ваш пароль" >
                        <button type="button" class="password-toggle" id="togglePassword">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
                

                <button name="login" type="submit" class="login-button">
                    <i class="fas fa-sign-in-alt"></i> Войти в аккаунт
                </button>
                
                
                <div class="register-link">
                    Ещё нет аккаунта? <a href="register.php">Зарегистрироваться</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Переключение видимости пароля
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const errorMessage = document.getElementById('errorMessage');
        const loginForm = document.getElementById('loginForm');
        
        togglePassword.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            this.innerHTML = type === 'password' ? '<i class="fas fa-eye"></i>' : '<i class="fas fa-eye-slash"></i>';
        });
        
        // // Обработка отправки формы (заглушка для демонстрации)
        // loginForm.addEventListener('submit', function(e) {
        //     e.preventDefault();
            
        //     const email = document.getElementById('email').value;
        //     const password = document.getElementById('password').value;
            
        //     // Здесь будет отправка данных на сервер
        //     // Для демонстрации покажем ошибку, если пароль "wrongpassword"
        //     if (password === 'wrongpassword') {
        //         errorMessage.style.display = 'block';
                
        //         // Скрываем ошибку через 5 секунд
        //         setTimeout(() => {
        //             errorMessage.style.display = 'none';
        //         }, 5000);
                
        //         // Добавляем анимацию ошибки к полям
        //         document.getElementById('email').style.borderColor = 'var(--error)';
        //         document.getElementById('password').style.borderColor = 'var(--error)';
                
        //         setTimeout(() => {
        //             document.getElementById('email').style.borderColor = '';
        //             document.getElementById('password').style.borderColor = '';
        //         }, 2000);
                
        //         // Фокус на поле пароля
        //         document.getElementById('password').focus();
        //     } else {
        //         // В реальном приложении здесь будет отправка формы
        //         console.log('Отправка данных:', { email, password });
        //         errorMessage.style.display = 'none';
                
        //         // Имитация успешного входа
        //         const loginButton = document.querySelector('.login-button');
        //         const originalText = loginButton.innerHTML;
        //         loginButton.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Вход...';
        //         loginButton.disabled = true;
                
        //         setTimeout(() => {
        //             loginButton.innerHTML = '<i class="fas fa-check"></i> Успешный вход!';
        //             loginButton.style.background = 'linear-gradient(135deg, var(--success), #059669)';
                    
        //             // Здесь будет редирект на главную страницу
        //             setTimeout(() => {
        //                 alert('В реальном приложении будет переход на главную страницу');
        //                 loginButton.innerHTML = originalText;
        //                 loginButton.disabled = false;
        //                 loginButton.style.background = '';
        //             }, 1000);
        //         }, 1500);
        //     }
        // });
        
        // // Фокус на поле email при загрузке страницы
        // document.getElementById('email').focus();
    </script>
</body>
</html>