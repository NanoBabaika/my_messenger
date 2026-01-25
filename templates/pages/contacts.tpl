<main class="main-container">
        <!-- Page Header -->
        <div class="page-header">
            <h1 class="page-title">
                <i class="fas fa-users"></i>
                Контакты
            </h1>
            <p class="page-subtitle">
                Управляйте своими контактами, друзьями и заявками в друзья
            </p>
        </div>

        <!-- Stats Dashboard -->
        <div class="stats-dashboard">
            <div class="stat-card">
                <div class="stat-icon friends">
                    <i class="fas fa-user-friends"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-number">
                        42
                        <span class="stat-label">Друзей</span>
                    </div>
                    <div class="stat-label">Ваши контакты</div>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon requests">
                    <i class="fas fa-user-plus"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-number">
                        3
                        <span class="stat-badge">новые</span>
                    </div>
                    <div class="stat-label">Заявки в друзья</div>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon messages">
                    <i class="fas fa-comments"></i>
                </div>
                <div class="stat-content">
                    <div class="stat-number">15</div>
                    <div class="stat-label">Непрочитанных сообщений</div>
                </div>
            </div>

        </div>

        <!-- Tabs Navigation -->
        <div class="tabs-navigation">
            <button class="tab-btn active" data-tab="friends">
                <i class="fas fa-user-friends"></i>
                Друзья
                <span class="tab-badge">42</span>
            </button>
            <button class="tab-btn" data-tab="requests">
                <i class="fas fa-user-plus"></i>
                Заявки
                <span class="tab-badge">3</span>
            </button>
            <button class="tab-btn" data-tab="online">
                <i class="fas fa-circle"></i>
                Онлайн
                <span class="tab-badge">12</span>
            </button>
            <button class="tab-btn" data-tab="favorites">
                <i class="fas fa-star"></i>
                Избранное
                <span class="tab-badge">8</span>
            </button>
        </div>

        <!-- Search and Filters -->
        <div class="search-container">
            <div class="search-box">
                <i class="fas fa-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Поиск по контактам...">
            </div>
            <select class="filter-select">
                <option value="all">Все контакты</option>
                <option value="online">Только онлайн</option>
                <option value="offline">Только оффлайн</option>
                <option value="recent">Недавние диалоги</option>
            </select>
        </div>

        <!-- Contacts Grid (Friends Tab) -->
        <div class="contacts-grid" id="friendsTab">
            <!-- Contact Card Example 1 -->
            <div class="contact-card">
                <div class="contact-header">
                    <div class="contact-avatar">
                        <div class="avatar-placeholder">М</div>
                        <div class="contact-status status-online"></div>
                    </div>
                </div>
                <div class="contact-body">
                    <h3 class="contact-name">
                        Мария Петрова
                        <i class="fas fa-star" style="color: #FBBF24;"></i>
                    </h3>
                    <div class="contact-username">
                        <i class="fas fa-at"></i>
                        <span>@maria_design</span>
                    </div>
                    <p class="contact-bio">
                        UI/UX дизайнер. Создаю красивые и удобные интерфейсы.
                    </p>
                    
                    <div class="contact-last-message">
                        Привет! Посмотрела твои правки, все отлично!
                        <div class="last-message-time">10:22</div>
                    </div>
                    
                    <div class="contact-actions">
                        <button class="contact-action-btn message-btn" onclick="location.href='chat.php?id=2'">
                            <i class="fas fa-comment"></i>
                            Написать
                        </button>
                        <button class="contact-action-btn remove-btn" onclick="removeContact(2, 'Мария Петрова')">
                            <i class="fas fa-user-minus"></i>
                            Удалить
                        </button>
                    </div>
                </div>
            </div>

            <!-- Contact Card Example 2 -->
            <div class="contact-card">
                <div class="contact-header">
                    <div class="contact-avatar">
                        <div class="avatar-placeholder">Д</div>
                        <div class="contact-status status-offline"></div>
                    </div>
                </div>
                <div class="contact-body">
                    <h3 class="contact-name">
                        Дмитрий Смирнов
                        <i class="fas fa-star" style="color: #FBBF24;"></i>
                    </h3>
                    <div class="contact-username">
                        <i class="fas fa-at"></i>
                        <span>@dmitry_dev</span>
                    </div>
                    <p class="contact-bio">
                        Backend разработчик на PHP. Увлекаюсь базами данных.
                    </p>
                    
                    <div class="contact-last-message">
                        Код ревью готов, заходи в репозиторий
                        <div class="last-message-time">Вчера, 18:45</div>
                    </div>
                    
                    <div class="contact-actions">
                        <button class="contact-action-btn message-btn" onclick="location.href='chat.php?id=3'">
                            <i class="fas fa-comment"></i>
                            Написать
                        </button>
                        <button class="contact-action-btn remove-btn" onclick="removeContact(3, 'Дмитрий Смирнов')">
                            <i class="fas fa-user-minus"></i>
                            Удалить
                        </button>
                    </div>
                </div>
            </div>

            <!-- Empty State Example (закомментирован) -->
            <!--
            <div class="empty-state">
                <div class="empty-icon">
                    <i class="fas fa-user-slash"></i>
                </div>
                <h3 class="empty-text">Контакты не найдены</h3>
                <p>Начните добавлять друзей или примите заявки</p>
            </div>
            -->
        </div>

        <!-- Friend Requests Tab (скрыт по умолчанию) -->
        <div class="requests-grid" id="requestsTab" style="display: none;">
            <!-- Friend Request Example -->
            <div class="request-card">
                <div class="request-avatar">А</div>
                <div class="request-info">
                    <div class="request-name">Анна Козлова</div>
                    <div class="request-username">@anna_marketing</div>
                    <div class="request-actions">
                        <button class="accept-btn" onclick="acceptRequest(4, 'Анна Козлова')">
                            <i class="fas fa-check"></i>
                            Принять
                        </button>
                        <button class="decline-btn" onclick="declineRequest(4, 'Анна Козлова')">
                            <i class="fas fa-times"></i>
                            Отклонить
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer будет подключен из шаблона -->
    
    <script>
        // Tab Switching
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                // Remove active class from all tabs
                document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                // Hide all tab contents
                document.getElementById('friendsTab').style.display = 'none';
                document.getElementById('requestsTab').style.display = 'none';
                
                // Show selected tab content
                const tab = this.dataset.tab;
                if (tab === 'friends') {
                    document.getElementById('friendsTab').style.display = 'grid';
                } else if (tab === 'requests') {
                    document.getElementById('requestsTab').style.display = 'grid';
                }
            });
        });
        
        // Contact Search
        const searchInput = document.querySelector('.search-input');
        searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const contactCards = document.querySelectorAll('.contact-card');
            
            contactCards.forEach(card => {
                const contactName = card.querySelector('.contact-name').textContent.toLowerCase();
                const contactUsername = card.querySelector('.contact-username span').textContent.toLowerCase();
                
                if (contactName.includes(searchTerm) || contactUsername.includes(searchTerm)) {
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
        
        // Remove Contact Function
        function removeContact(userId, userName) {
            if (confirm(`Удалить ${userName} из контактов?`)) {
                // Отправляем запрос на сервер
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'remove_contact.php';
                form.style.display = 'none';
                
                const userIdInput = document.createElement('input');
                userIdInput.type = 'hidden';
                userIdInput.name = 'user_id';
                userIdInput.value = userId;
                
                const csrfInput = document.createElement('input');
                csrfInput.type = 'hidden';
                csrfInput.name = 'csrf_token';
                csrfInput.value = '<?php echo $_SESSION['csrf_token']; ?>';
                
                form.appendChild(userIdInput);
                form.appendChild(csrfInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
        
        // Accept Friend Request
        function acceptRequest(userId, userName) {
            if (confirm(`Принять заявку в друзья от ${userName}?`)) {
                // Отправляем запрос на сервер
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'accept_request.php';
                form.style.display = 'none';
                
                const userIdInput = document.createElement('input');
                userIdInput.type = 'hidden';
                userIdInput.name = 'user_id';
                userIdInput.value = userId;
                
                form.appendChild(userIdInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
        
        // Decline Friend Request
        function declineRequest(userId, userName) {
            if (confirm(`Отклонить заявку в друзья от ${userName}?`)) {
                // Отправляем запрос на сервер
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'decline_request.php';
                form.style.display = 'none';
                
                const userIdInput = document.createElement('input');
                userIdInput.type = 'hidden';
                userIdInput.name = 'user_id';
                userIdInput.value = userId;
                
                form.appendChild(userIdInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
        
        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            // Focus on search input
            searchInput.focus();
        });
    </script>
</body>
</html>