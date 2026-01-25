<?php 
abstract class Model {
    protected $id;
    protected $table;
    protected $db;

    public function __construct($id = null) {
        $this->id = $id;
        $this->db = Database::getConnection();
    }

    public function getId() {
        return $this->id;
    }
     
    public static function find(int $id) {
        $db = Database::getConnection();
        $instance = new static(); // Создаем экземпляр, чтобы получить имя таблицы

        $sql = "SELECT * FROM {$instance->table} WHERE id = :id LIMIT 1";
        $stmt = $db->prepare($sql);
        $stmt->execute(['id' => $id]);

        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        if (!$data) return null;

        foreach ($data as $key => $value) {
            if (property_exists($instance, $key)) {
                $instance->$key = $value;
            }
        }
        return $instance;
    }
    
    public function toArray(): array {
        $data = get_object_vars($this);
        unset($data['db'], $data['table']);
        
        foreach ($data as $key => $value) {
            if (is_bool($value)) {
                $data[$key] = (int)$value;
            }
        }
        
        return $data;
    }

    public function save(): bool {
        $data = $this->toArray();
        return empty($this->id) ? $this->insert($data) : $this->update($data);
    }

    protected function insert(array $data): bool {
        $columns = array_keys($data);
        $sql = "INSERT INTO {$this->table} (".implode(', ', $columns).") 
                VALUES (:".implode(', :', $columns).")";

        $stmt = $this->db->prepare($sql);
        $result = $stmt->execute($data);

        if ($result) {
            $this->id = (int)$this->db->lastInsertId();
        }
        return $result;
    }

    protected function update(array $data): bool {
        $updateParts = [];
        foreach ($data as $key => $value) {
            if ($key === 'id') continue;
            $updateParts[] = "{$key} = :{$key}";
        }
        
        $data['id'] = $this->id;
        $sql = "UPDATE {$this->table} SET ".implode(', ', $updateParts)." WHERE id = :id";
        
        return $this->db->prepare($sql)->execute($data);
    }
}
