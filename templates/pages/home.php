<?php
// Этот файл просто собирает страницу из компонентов
$template = new Template('layout/header');
$template->set('title', 'Добро пожаловать в мессенджер');
$template->display();
?>

<div class="hero">
    <h1>Добро пожаловать в наш мессенджер!</h1>
    <p>Простое и удобное общение</p>
    
    <?php if (!Session::isLoggedIn()): ?>
        <div class="auth-buttons">
            <a href="/login.php" class="btn btn-primary">Войти</a>
            <a href="/register.php" class="btn btn-secondary">Зарегистрироваться</a>
        </div>
    <?php else: ?>
        <div class="chat-redirect">
            <a href="/chat.php" class="btn btn-success">Перейти к чату</a>
        </div>
    <?php endif; ?>
</div>

<?php
$footer = new Template('layout/footer');
$footer->display();