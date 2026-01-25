<?php
 
class Session {
    private static $started = false;
    
    public static function start() {
        if (!self::$started) {
            if (session_status() === PHP_SESSION_NONE) {
                // Включаем буферизацию, если она еще не включена
                if (ob_get_level() === 0) {
                    ob_start();
                }
                session_start();
            }
            self::$started = true;
        }
    }
    
    public static function set($key, $value) {
        self::start();
        $_SESSION[$key] = $value;
    }
    
    public static function get($key, $default = null) {
        self::start();
        return $_SESSION[$key] ?? $default;
    }
    
    public static function delete($key) {
        self::start();
        unset($_SESSION[$key]);
    }
    
    public static function destroy() {
        if (self::$started) {
            session_destroy();
            $_SESSION = [];
            self::$started = false;
        }
    }
    
    public static function login($user_id, $username) {
        self::set('user_id', $user_id);
        self::set('username', $username);
        self::set('logged_in', true);
    }
    
    public static function logout() {
        self::destroy();
    }
    
    public static function isLoggedIn() {
        return self::get('logged_in', false);
    }
    
    public static function getUserId() {
        return self::get('user_id');
    }
    
    public static function getUsername() {
        return self::get('username');
    }
}