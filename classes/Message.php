<?php

class Message extends Model { 
    protected $id;
    protected $sender_id;
    protected $receiver_id;
    protected $text;
    protected $sent_at;
    protected $is_read;
    protected $table = 'messages';


    // Конструктор с правильным порядком и значениями по умолчанию
    public function __construct($sender_id, $receiver_id, $text, $id = null, $sent_at = null, $is_read = false) {
        parent::__construct($id);  

        $this->sender_id = $sender_id;
        $this->receiver_id = $receiver_id;
        $this->text = $text;
        $this->sent_at = $sent_at ?: date('Y-m-d H:i:s');
        $this->is_read = (bool)$is_read;
        // $this->is_read = $is_read ? 1 : 0; 
    }
    

    // Геттеры
    public function getId() { return $this->id; }
    public function getSenderId() { return $this->sender_id; }
    public function getReceiverId() { return $this->receiver_id; }
    public function getText() { return $this->text; }
    public function getSentAt() { return $this->sent_at; }
    public function isRead() { return $this->is_read; }


        // Получение переписки между двумя пользователями
    public static function getConversation($user1_id, $user2_id) {
        $db = Database::getConnection();
        
        $sql = "SELECT * FROM messages 
                WHERE (sender_id = :user1_id AND receiver_id = :user2_id)
                   OR (sender_id = :user2_id AND receiver_id = :user1_id)
                ORDER BY sent_at ASC";
        
        $stmt = $db->prepare($sql);
        $stmt->execute([
            'user1_id' => $user1_id,
            'user2_id' => $user2_id
        ]);
        
        $messages = [];
        while ($data = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $message = new self(
                $data['sender_id'],
                $data['receiver_id'],
                $data['text'],
                (int)$data['id'],
                $data['sent_at'],
                (bool)$data['is_read']
            );
            $messages[] = $message;
        }
        
        return $messages;
    }

    public function markAsRead() {
        if ($this->id === null) return false;
        
        $this->is_read = true;
        return $this->save(); 
    }
    
    // Статический метод для отправки нового сообщения
    // думаю тут нужно переписать метод сообщение нужно отправлять но сохранять нужно через родительский метод
    public static function send($sender_id, $receiver_id, $text) {
        // Просто создаем объект
        $message = new self($sender_id, $receiver_id, $text);
        // И вызываем унаследованный метод save() из Model
        // Он сам поймет, что это INSERT, так как ID еще нет
        return $message->save(); 
    }

    public static function markAsReadFromContact($contactId, $currentUserId) {
        $db = Database::getConnection();
        
        $sql = "UPDATE messages 
                SET is_read = 1 
                WHERE sender_id = :contact_id 
                AND receiver_id = :user_id 
                AND is_read = 0";
                
        $stmt = $db->prepare($sql);
        return $stmt->execute([
            'contact_id' => $contactId,
            'user_id'    => $currentUserId
        ]);
    }

    public static function getNewMessages($currentUserId, $partnerId, $lastId) {
        $db = Database::getConnection();
        $sql = "SELECT * FROM messages 
                WHERE id > :last_id 
                AND ((sender_id = :user_id AND receiver_id = :partner_id) 
                OR (sender_id = :partner_id AND receiver_id = :user_id))
                ORDER BY id ASC";
        
        $stmt = $db->prepare($sql);
        $stmt->execute([
            'last_id' => $lastId,
            'user_id' => $currentUserId,
            'partner_id' => $partnerId
        ]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC); 
    }


}