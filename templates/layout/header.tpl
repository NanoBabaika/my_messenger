<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messenger - Главная</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="./static/index.css">
    <link rel="stylesheet" href="./static/errors.css">
    <link rel="stylesheet" href="./static/all_users.css">
    <link rel="stylesheet" href="./static/chat.css">
    <link rel="stylesheet" href="./static/contacts.css">

</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="header-container">
            <a href="index.php" class="logo">
                <div class="logo-icon">
                    <i class="fas fa-comments"></i>
                </div>
                <div class="logo-text">Messenger</div>
            </a>

            <button class="mobile-menu-toggle" id="mobileMenuToggle">
                <i class="fas fa-bars"></i>
            </button>

            <nav class="nav-menu" id="navMenu">
                <a href="all_users.php" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Все пользователи</span>
                </a>
                <a href="contacts.php" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Контакты</span>
                </a>
                <a href="profile.php" class="nav-link">
                    <i class="fas fa-user-cog"></i>
                    <span>Профиль</span>
                </a>
                <a href="settings.php" class="nav-link">
                    <i class="fas fa-cog"></i>
                    <span>Настройки</span>
                </a>
            </nav>

            <div class="user-menu">
                <div class="user-avatar" id="userAvatar">
                    <? echo mb_substr($userName, 0, 1, 'UTF-8');?>
                </div>
                <a href="logout.php" class="auth-button" id="authButton">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Выход</span>
                </a>
            </div>
        </div>
    </header>