<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Регистрация в Messenger</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="./static/register.css">
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
            
            <h1 class="welcome-text">Присоединяйтесь к нашему мессенджеру!</h1>
            <p class="subtitle">Создайте аккаунт, чтобы начать общаться с друзьями, семьей и коллегами по всему миру.</p>
            
            <ul class="features">
                <li><i class="fas fa-user-plus"></i> Быстрая регистрация за 2 минуты</li>
                <li><i class="fas fa-comment-dots"></i> Неограниченные сообщения и звонки</li>
                <li><i class="fas fa-mobile-alt"></i> Доступ с любого устройства</li>
            </ul>
            

        </div>
        
        <!-- Правая часть с формой -->
        <div class="right-section">
            <h2 class="register-header">Создание аккаунта</h2>
            <p class="register-subheader">Заполните форму ниже, чтобы создать новый аккаунт</p>
            
 
            
            <form  method="POST" action="./register.php">
                
                <div class="form-group">
                    <label for="email">Email <span class="label-hint">(обязательно)</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-envelope"></i>
                        <input type="email" name="email" placeholder="example@mail.com" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="username">Имя пользователя <span class="label-hint">(обязательно)</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-at"></i>
                        <input type="text" name="username" placeholder="alexander2023" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="password">Пароль <span class="label-hint">(минимум 8 символов)</span></label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password"  name="password" placeholder="Создайте надежный пароль" required>
                    </div>
                    <div class="password-strength">
                        <div class="password-strength-fill" id="passwordStrengthFill"></div>
                    </div>
                    <div class="password-strength-text" id="passwordStrengthText">Введите пароль</div>
                </div>
                            
            
                <button name="register" type="submit" class="register-button">
                    <i class="fas fa-user-plus"></i> Создать аккаунт
                </button>
                
         
                <div class="login-link">
                    Уже есть аккаунт? <a href="login.php">Войти в систему</a>
                </div>
            </form>
        </div>
    </div>
 
</body>
</html>