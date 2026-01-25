<?php

require_once './classes/User.php';

class Auth {

    // Проверка: залогинен ли пользователь прямо сейчас?
    public static function isLoggedIn(): bool {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        return isset($_SESSION['user_id']);
    }

    public static function login($email, $password) {
        // 1. Используем метод из класса User (который мы уже писали!)
        $user = User::findByEmail($email);

        // 2. Если пользователь найден и пароль совпал
        if ($user && $user->verifyPassword($password)) {
            if (session_status() === PHP_SESSION_NONE) {
                session_start();
            }
            // 3. Записываем ID в сессию — это и есть наш "статус"
            $_SESSION['user_id'] = $user->getId();
            $_SESSION['user_name'] = $user->getUsername();
            return true;
        }

        return false;
    }

    public static function user() {
        if (self::isLoggedIn()) {
            return User::find($_SESSION['user_id']);
        }
        return null;
    }

    public static function logout() {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
        // Очищаем данные
        session_destroy();
        unset($_SESSION['user_id']);
    }

}
