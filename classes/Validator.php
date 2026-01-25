<?php

require_once './classes/Auth.php';

class Validator {

    private array $errors = [];

    // Главный метод: принимает данные ($_POST) и правила
    public function validate(array $data, array $rules): bool {
        foreach ($rules as $field => $rulesString) {
            // Разбиваем правила "required|min:6" в массив
            $ruleSet = explode('|', $rulesString);
            $value = $data[$field] ?? '';

            foreach ($ruleSet as $rule) {
                $this->applyRule($field, $value, $rule);
            }
        }
        return empty($this->errors);
    }

    // Логика конкретных проверок
    private function applyRule($field, $value, $rule) {
        // Проверка на обязательность
        if ($rule === 'required' && empty(trim($value))) {
            $this->addError($field, "Заполните пожалуйста все поля для входа в систему.");
        }
        
        // Проверка на корректный Email
        if ($rule === 'email' && !filter_var($value, FILTER_VALIDATE_EMAIL)) {
            $this->addError($field, "Введите корректный email");
        }

        if (str_starts_with($rule, 'unique:')) {
            // 1. Разбираем строку: получаем таблицу (users) и колонку (email)
            // Убираем "unique:" и разбиваем по запятой
            $params = explode(',', str_replace('unique:', '', $rule));
            $table = $params[0];
            $column = $params[1];

            $db = Database::getConnection();
            
            // 2. Готовим универсальный запрос
            $sql = "SELECT COUNT(*) FROM {$table} WHERE {$column} = :val";
            $stmt = $db->prepare($sql);
            $stmt->execute(['val' => $value]);
            
            // 3. Получаем количество найденных записей
            $count = $stmt->fetchColumn();

            if ($count > 0) {
                $this->addError($field, "Такой $field уже занят");
            }
        }

        // Проверка на минимальную длину (например, min:6)
        if (str_starts_with($rule, 'min:')) {
            $min = (int) explode(':', $rule)[1];
            if (strlen($value) < $min) {
                $this->addError($field, "Минимум символов: $min");
            }
        }

        if($rule === 'passrod_check') {

        }

    }

    private function addError($field, $message) {
        // Чтобы не дублировать ошибки для одного поля
        if (!isset($this->errors[$field])) {
            $this->errors[$field] = $message;
        }
    }

    public function getErrors(): array {
        return $this->errors;
    }
}

