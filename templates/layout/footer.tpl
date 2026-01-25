    <footer class="footer">
        <div class="footer-container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>Messenger</h3>
                    <p>Современный мессенджер для общения с близкими и коллегами. Безопасно, быстро и удобно.</p>
                </div>

                <div class="footer-section">
                    <h3>Навигация</h3>
                    <ul class="footer-links">
                        <li><a href="index.php"><i class="fas fa-home"></i>Главная</a></li>
                         <li><a href="all_users.php"><i class="fas fa-home"></i>Все пользователи</a></li>
                        <li><a href="contacts.php"><i class="fas fa-users"></i>Контакты</a></li>
                        <li><a href="profile.php"><i class="fas fa-user-cog"></i>Профиль</a></li>
                        <li><a href="settings.php"><i class="fas fa-cog"></i>Настройки</a></li>
                    </ul>
                </div>


                <div class="footer-section">
                    <h3>Контакты</h3>
                    <ul class="footer-links">
                        <li><a href="mailto:support@messenger.com"><i class="fas fa-envelope"></i>support@messenger.com</a></li>
                        <li><a href="tel:+78001234567"><i class="fas fa-phone"></i>8 (800) 123-45-67</a></li>
                        <li><a href="#"><i class="fas fa-map-marker-alt"></i>Краснодар, ул. Карасунская, 60</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <p>&copy; 2023 Messenger. Все права очень защищены.</p>
                <p>Сделано с <i class="fas fa-heart" style="color: #EC4899;"></i> для удобного общения</p>
            </div>
        </div>
    </footer>

    <script>
        // // Mobile menu toggle
        // const mobileMenuToggle = document.getElementById('mobileMenuToggle');
        // const navMenu = document.getElementById('navMenu');
        
        // mobileMenuToggle.addEventListener('click', () => {
        //     navMenu.classList.toggle('active');
        //     const icon = mobileMenuToggle.querySelector('i');
        //     if (navMenu.classList.contains('active')) {
        //         icon.classList.remove('fa-bars');
        //         icon.classList.add('fa-times');
        //     } else {
        //         icon.classList.remove('fa-times');
        //         icon.classList.add('fa-bars');
        //     }
        // });
        
        // // Close mobile menu when clicking outside
        // document.addEventListener('click', (e) => {
        //     if (!navMenu.contains(e.target) && !mobileMenuToggle.contains(e.target)) {
        //         navMenu.classList.remove('active');
        //         const icon = mobileMenuToggle.querySelector('i');
        //         icon.classList.remove('fa-times');
        //         icon.classList.add('fa-bars');
        //     }
        // });
        
        // // Auth button toggle (для демонстрации)
        // const authButton = document.getElementById('authButton');
        // const userAvatar = document.getElementById('userAvatar');
        
        // // Проверяем, авторизован ли пользователь (в реальном проекте это будет на сервере)
        // let isLoggedIn = true; // Измените на false для состояния "не авторизован"
        
        // function updateAuthUI() {
        //     if (isLoggedIn) {
        //         authButton.innerHTML = '<i class="fas fa-sign-out-alt"></i><span>Выход</span>';
        //         userAvatar.style.display = 'flex';
        //     } else {
        //         authButton.innerHTML = '<i class="fas fa-sign-in-alt"></i><span>Вход</span>';
        //         userAvatar.style.display = 'none';
        //     }
        // }
        
        // authButton.addEventListener('click', () => {
        //     if (isLoggedIn) {
        //         // Выход из системы
        //         if (confirm('Вы уверены, что хотите выйти?')) {
        //             isLoggedIn = false;
        //             updateAuthUI();
        //             alert('Вы вышли из системы. В реальном приложении будет редирект на страницу логина.');
        //         }
        //     } else {
        //         // Вход в систему
        //         isLoggedIn = true;
        //         updateAuthUI();
        //         alert('В реальном приложении будет переход на страницу логина.');
        //     }
        // });
        
        // // Анимированные счетчики статистики
        // function animateCounter(elementId, targetValue, duration = 2000) {
        //     const element = document.getElementById(elementId);
        //     const startValue = 0;
        //     const increment = targetValue / (duration / 16); // 60fps
        //     let currentValue = startValue;
            
        //     const timer = setInterval(() => {
        //         currentValue += increment;
        //         if (currentValue >= targetValue) {
        //             currentValue = targetValue;
        //             clearInterval(timer);
        //         }
        //         element.textContent = Math.floor(currentValue).toLocaleString();
        //     }, 16);
        // }
        
        // // Инициализация счетчиков при загрузке страницы
        // document.addEventListener('DOMContentLoaded', () => {
        //     // Устанавливаем начальное состояние UI
        //     updateAuthUI();
            
        //     // Запускаем анимацию счетчиков
        //     setTimeout(() => {
        //         animateCounter('onlineUsers', 1247);
        //         animateCounter('totalMessages', 24891);
        //         animateCounter('activeChats', 5632);
        //         animateCounter('countries', 89);
        //     }, 500);
            
        //     // Обновляем счетчики каждые 30 секунд (для демонстрации)
        //     setInterval(() => {
        //         const onlineUsers = document.getElementById('onlineUsers');
        //         const currentValue = parseInt(onlineUsers.textContent.replace(/,/g, ''));
        //         const randomChange = Math.floor(Math.random() * 100) - 50; // -50 до +50
        //         const newValue = Math.max(1000, currentValue + randomChange);
        //         animateCounter('onlineUsers', newValue, 1000);
        //     }, 30000);
        // });
        
        // // Highlight active navigation link
        // const currentPage = window.location.pathname.split('/').pop();
        // const navLinks = document.querySelectorAll('.nav-link');
        
        // navLinks.forEach(link => {
        //     const linkPage = link.getAttribute('href');
        //     if (linkPage === currentPage) {
        //         link.classList.add('active');
        //     }
            
        //     // Для главной страницы
        //     if (currentPage === 'index.php' && linkPage === 'index.php') {
        //         link.classList.add('active');
        //     }
        // });
    </script>
    <script src="./static/src/farites.js"></script>
</body>
</html>