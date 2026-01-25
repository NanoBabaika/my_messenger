<main class="main-container">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-users"></i>
                Все пользователи
            </h1>
            <p class="page-subtitle">
                Найдите друзей, коллег и новых собеседников. Начните общение прямо сейчас!
            </p>
        </div>

        <!-- Online Users Counter -->
        <div class="online-counter">
            <span class="online-dot"></span>
            <span id="onlineCount">247</span> пользователей онлайн
        </div>

        <!-- Search and Filters -->
        <div class="search-container">
            <div class="search-box">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Поиск по имени или имени пользователя...">
            </div>
            <select class="filter-select">
                <option value="all">Все пользователи</option>
                <option value="online">Только онлайн</option>
                <option value="offline">Только оффлайн</option>
                <option value="newest">Сначала новые</option>
                <option value="oldest">Сначала старые</option>
            </select>
        </div>

        <!-- Users Grid -->
        <div class="users-grid" id="usersGrid">
            <!-- Пример карточки пользователя 1 -->
            <!-- <div class="user-card">
                <div class="card-header">
                    <div class="user-avatar">
                        <div class="avatar-placeholder">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="user-status status-online"></div>
                    </div>
                </div>
                <div class="card-body">
                    <h3 class="user-name">Александр Иванов</h3>
                    <div class="user-username">
                        <i class="fas fa-at"></i>
                        <span>@alexander2023</span>
                    </div>
                    <p class="user-bio">
                        Веб-разработчик, любитель путешествий и фотографии. Всегда рад новым знакомствам!
                    </p>
                    <div class="user-stats">
                        <div class="stat-item">
                            <span class="stat-number">247</span>
                            <span class="stat-label">Сообщений</span>
                        </div>
                        <div class="stat-item">
                            <span class="stat-number">42</span>
                            <span class="stat-label">Друзей</span>
                        </div>
                    </div>
                    <a href="chat.php?id=1" class="message-button">
                        <i class="fas fa-comment"></i>
                        Написать сообщение
                    </a>
                </div>
            </div> -->
            <?php foreach ($users as $user): ?>
                <div class="user-card">
                    <div class="card-header">
                        <div class="user-avatar">
                            <div class="avatar-placeholder">
                                <i class="fas fa-user"></i>
                            </div>
                            <?php if ($user->isOnline()): ?>
                            <div class="user-status status-online"></div>
                            <?php else: ?>
                            <div class="user-status status-offline"></div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <div class="card-body">
                        <h3 class="user-name"><?= htmlspecialchars($user->getUsername()) ?></h3>
                        <div class="user-username">
                            <i class="fas fa-at"></i>
                            <span><?= htmlspecialchars($user->getEmail()) ?></span>
                        </div>
                        <p class="user-bio">
                            Веб-разработчик, любитель путешествий и фотографии. Всегда рад новым знакомствам!
                        </p>
                        <div class="user-stats">
                            <div class="stat-item">
                                <span class="stat-number"><?php echo $user->getTotalMessagesCount(); ?></span>
                                <span class="stat-label">Всего сообщений</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number"><?php echo $user->getUnreadCount(); ?></span>
                            <span class="stat-label">Непрочитанных сообщений</span>
                            </div>
                            <div class="stat-item">
                                <span class="stat-number">42</span>
                                <span class="stat-label">Друзей</span>
                            </div>
                        </div>
                        <a href="chat.php?id=<?= $user->getId()?>" class="message-button">
                            <i class="fas fa-comment"></i>
                            Написать сообщение
                        </a>
                    </div>

                    <!-- кнопка добавить в контакты -->
                    <button class="favorite-btn" 
                            data-user-id="<?php echo $user->getId(); ?>"
                            data-user-name="<?php echo $user->getUsername(); ?>"
                            onclick="addToFavorites(event, this)"
                            title="Добавить в контакты">
                        <i class="fas fa-star"></i>
                    </button>

                </div>
            <?php endforeach; ?>

            
            <!-- Пример когда нет пользователей -->
             <?php if(empty($users)): ?>
                <div class="no-users">
                    <div class="no-users-icon">
                        <i class="fas fa-user-slash"></i>
                    </div>
                    <h3 class="no-users-text">Пользователи не найдены</h3>
                    <p>Попробуйте изменить параметры поиска</p>
                </div>
             <?php endif; ?> 
        </div>

        <!-- Pagination -->
        <div class="pagination">
            <button class="page-btn disabled">
                <i class="fas fa-chevron-left"></i>
            </button>
            <button class="page-btn active">1</button>
            <button class="page-btn">2</button>
            <button class="page-btn">3</button>
            <button class="page-btn">4</button>
            <button class="page-btn">5</button>
            <button class="page-btn">
                <i class="fas fa-chevron-right"></i>
            </button>
        </div>
    </main>

 

    <!-- <script>
        // Динамическое обновление счетчика онлайн пользователей
        function updateOnlineCount() {
            const onlineCount = document.getElementById('onlineCount');
            // В реальном приложении здесь будет AJAX запрос
            const randomChange = Math.floor(Math.random() * 10) - 3; // -3 до +7
            let current = parseInt(onlineCount.textContent);
            current = Math.max(100, current + randomChange);
            onlineCount.textContent = current;
            
            // Анимация обновления
            onlineCount.style.transform = 'scale(1.2)';
            setTimeout(() => {
                onlineCount.style.transform = 'scale(1)';
            }, 300);
        }
        
        // Обновляем каждые 30 секунд
        setInterval(updateOnlineCount, 30000);
        
        // Поиск пользователей
        const searchInput = document.querySelector('.search-input');
        const usersGrid = document.getElementById('usersGrid');
        
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const userCards = usersGrid.querySelectorAll('.user-card');
            
            userCards.forEach(card => {
                const userName = card.querySelector('.user-name').textContent.toLowerCase();
                const userUsername = card.querySelector('.user-username span').textContent.toLowerCase();
                
                if (userName.includes(searchTerm) || userUsername.includes(searchTerm)) {
                    card.style.display = 'block';
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 10);
                } else {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        card.style.display = 'none';
                    }, 300);
                }
            });
        });
        
        // Фильтрация по статусу
        const filterSelect = document.querySelector('.filter-select');
        
        filterSelect.addEventListener('change', function() {
            const filterValue = this.value;
            const userCards = usersGrid.querySelectorAll('.user-card');
            
            userCards.forEach(card => {
                const statusElement = card.querySelector('.user-status');
                const status = statusElement.classList.contains('status-online') ? 'online' : 
                              statusElement.classList.contains('status-away') ? 'away' : 'offline';
                
                if (filterValue === 'all' || filterValue === status) {
                    card.style.display = 'block';
                    setTimeout(() => {
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 10);
                } else {
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        card.style.display = 'none';
                    }, 300);
                }
            });
        });
        
        // Пагинация
        const pageButtons = document.querySelectorAll('.page-btn:not(.disabled)');
        pageButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Убираем активный класс у всех кнопок
                pageButtons.forEach(btn => btn.classList.remove('active'));
                // Добавляем активный класс текущей кнопке
                this.classList.add('active');
                
                // В реальном приложении здесь будет загрузка новой страницы
                console.log('Загрузка страницы:', this.textContent);
                
                // Имитация загрузки
                usersGrid.style.opacity = '0.5';
                setTimeout(() => {
                    usersGrid.style.opacity = '1';
                }, 300);
            });
        });
        
        // Инициализация при загрузке страницы
        document.addEventListener('DOMContentLoaded', function() {
            // Можно добавить другие инициализации здесь
        });
    </script> -->
</body>
</html>