<?php

require_once './classes/Model.php';
require_once './helpers.php';


class User extends Model {
    // Названия свойств должны СОВПАДАТЬ с названиями колонок в БД
    protected $id; 
    protected $username;
    protected $email;
    protected $password_hash;
    protected $last_seen;
    
    // Обязательно указываем таблицу для родителя
    protected $table = 'users';

    // Конструктор теперь вызывает родительский конструктор
    public function __construct($id = null) {
        parent::__construct($id); // Там подлкючится база
    }

    // Геттеры
    public function getId() { return $this->id; }
    public function getUsername() { return $this->username; }
    public function getEmail() { return $this->email; }
    
    // Валидация и установка username
    public function setUsername($username) {
        if (strlen($username) < 3) {
            throw new Exception("Имя пользователя должно быть не короче 3 символов");
        }
        $this->username = $username;
        return $this; // Возвращаем $this для цепочки вызовов
    }
    
    // Валидация и установка email
    public function setEmail($email) {
        if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Введите корректный Email");
        }
        $this->email = $email;
        return $this;
    }
    
    // Установка пароля (принимает чистый пароль, хранит хэш)
    public function setPassword($password) {
        if (strlen($password) < 6) {
            throw new Exception("Пароль должен быть не короче 6 символов");
        }
        $this->password_hash = password_hash($password, PASSWORD_DEFAULT);
        return $this;
    }

    public static function findByEmail($email) {
        $db = Database::getConnection();
        $stmt = $db->prepare("SELECT * FROM users WHERE email = :email LIMIT 1");
        $stmt->execute(['email' => $email]);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if (!$data) return null;

        // Используем магию: создаем объект и наполняем его
        $user = new self();
        foreach ($data as $key => $value) {
            if (property_exists($user, $key)) {
                $user->$key = $value;
            }
        }
        return $user;
    }

    public function verifyPassword($password) {
        if (!$this->password_hash) {
            return false;
        }
        return password_verify($password, $this->password_hash);
    }

    
    public static function register($username, $email, $password) {
        
        $user = new self();
        $user->setUsername($username)
             ->setEmail($email)
             ->setPassword($password);
        
        // save() вызовется из класса Model
        if ($user->save()) {
            return $user;
        }
        return false;
    }

    // получение всех пользователей
    public static function getAllExcept(int $currentUserId): array {
        $db = Database::getConnection();
        // Используем оператор != (не равно)
        $sql = "SELECT * FROM users WHERE id != :id ORDER BY username ASC";
        $stmt = $db->prepare($sql);
        $stmt->execute(['id' => $currentUserId]);
        
        $users = [];
        while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $user = new self();
            foreach ($data as $key => $value) {
                if (property_exists($user, $key)) {
                    $user->$key = $value;
                }
            }
            $users[] = $user;
        }
        return $users;
    }

    // Получаем статус пользователя в сети или он
    public function updateLastSeen() {
        $db = Database::getConnection();

        // Мы берем $this->id прямо из свойств текущего объекта
        $sql = "UPDATE users SET last_seen = NOW() WHERE id = :id";
        $stmt = $db->prepare($sql);
        
        return $stmt->execute(['id' => $this->id]);
    }

    // Проверка онлайн ли пользователь
    public function isOnline(): bool {
        // Если поле в базе пустое (например, новый юзер еще никуда не заходил)
        if (!$this->last_seen) {
            return false;
        }

        try {
            $now = new DateTime(); // Текущее время
            $lastSeen = new DateTime($this->last_seen); // Время из базы

            // Сравниваем разницу в секундах
            // getTimestamp() переводит дату в число (секунды с 1970 года)
            $delay = $now->getTimestamp() - $lastSeen->getTimestamp();

            // Если разница меньше или равна 180 секундам
            return $delay <= 120;
            
        } catch (Exception $e) {
            // Если формат даты в базе вдруг сломался
            return false;
        }
    }



    public function getLastSeenFormatted(): string {
        if (!$this->last_seen) return "Никогда не был";

        $now = new DateTime();
        $lastSeen = new DateTime($this->last_seen);
        $diff = $now->diff($lastSeen);

        // Если прошло больше суток
        if ($diff->d > 0) {
            return "Был(а) в сети " . $lastSeen->format('d.m.Y');
        }

        // Часы
        if ($diff->h > 0) {
            $word = pluralForm($diff->h, ['час', 'часа', 'часов']);
            return "Был(а) в сети $diff->h $word назад";
        }

        // Минуты
        if ($diff->i > 0) {
            $word = pluralForm($diff->i, ['минуту', 'минуты', 'минут']);
            return "Был(а) в сети $diff->i $word назад";
        }

        return "В сети";
    }

    // Общий счетчик сообщений пользователя
    public function getTotalMessagesCount() {
        $id = $this->id;
        $db = Database::getConnection();
        $sql = "SELECT COUNT(*) FROM messages WHERE sender_id = :id OR receiver_id = :id";
        $stmt = $db->prepare($sql);
        $stmt->execute(['id' => $id]);
        return (int)$stmt->fetchColumn();
    }

    // счетчик непрочитанных сообщений пользователя
    public function getUnreadCount() {
        $id = $this->id;
        $db = Database::getConnection();

        $sql = "SELECT COUNT(*) FROM messages WHERE receiver_id = :id AND is_read = 0";
        $stmt = $db->prepare($sql);
        $stmt->execute(['id' => $id]);
        return (int)$stmt->fetchColumn();
    }    

}

