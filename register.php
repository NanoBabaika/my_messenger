<?php

require_once './config/Database.php';
require_once './classes/Model.php';
require_once './classes/User.php';
require_once './classes/Auth.php';
require_once './classes/Validator.php';

require_once './helpers.php';

session_start();

 

if (isset($_POST['register'])) {
    $v = new Validator();
    $rules = [
        'username' => 'required|min:3',
        'email'    => 'required|email',
        'email'    => 'required|email|unique:users,email', 
        'password' => 'required|min:6'
    ];

    if ($v->validate($_POST, $rules)) {
        // Если всё ОК — регистрируем
        $user = User::register($_POST['username'], $_POST['email'], $_POST['password']);
        
        if ($user) {
            // Если регистрация прошла, логиним
            Auth::login($_POST['email'], $_POST['password']);
            header('Location: index.php');
            exit();
        }
    } else {
        // Если есть ошибки — получаем их
        $errors = $v->getErrors(); 
    }
}
 

require_once './templates/auth/register.tpl';
require_once './templates/layout/errors.tpl';
