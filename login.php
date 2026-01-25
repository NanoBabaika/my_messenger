<?php
// подключаем одиночными файлами, потом реализуем подключение через пространство имен. 

require_once './config/Database.php';
require_once './classes/Model.php';
require_once './classes/User.php';
require_once './classes/Auth.php';
require_once './classes/Validator.php';

require_once './helpers.php';

 
// Стартуем сессию
session_start();

// отправляем массив $_POST и ищем нужную запись
if(isset($_POST['login'])) {
    $v = new Validator();
    $rules = [
        'email'    => 'required|email',
        'password' => 'required'
    ];

    // Сначала проверяем, заполнил ли пользователь поля вообще
    if ($v->validate($_POST, $rules)) {
        
        // Если поля заполнены верно, пробуем авторизовать
        if (Auth::login($_POST['email'], $_POST['password'])) {
            header('Location: index.php');
            exit();
        } else {
            // Если Auth вернул false — пароль или email не подошли
            // Добавляем общую ошибку
            $loginError = "Неверный логин или пароль";
            $errors[] = $loginError;
        }
        
    } else {
        $errors = $v->getErrors();
    }
}

// тут вся верстка страницы
 require_once './templates/auth/login.tpl';
require_once './templates/layout/errors.tpl';
