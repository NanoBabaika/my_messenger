<?php
class Template {
    private $templatePath;
    private $data = [];
    
    public function __construct($templatePath) {
        $this->templatePath = 'templates/' . $templatePath . '.php';
    }
    
    public function set($key, $value) {
        $this->data[$key] = $value;
        return $this; // Для цепочки вызовов
    }
    
    public function render() {
        if (!file_exists($this->templatePath)) {
            throw new Exception("Шаблон не найден: " . $this->templatePath);
        }
        
        // Извлекаем переменные из массива $data в локальные переменные
        extract($this->data);
        
        // Включаем буферизацию вывода
        ob_start();
        include $this->templatePath;
        return ob_get_clean();
    }
    
    public function display() {
        echo $this->render();
    }
    
    // Статический метод для быстрого рендеринга
    public static function make($templatePath, $data = []) {
        $template = new self($templatePath);
        foreach ($data as $key => $value) {
            $template->set($key, $value);
        }
        return $template->render();
    }
}
