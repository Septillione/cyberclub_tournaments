# 🏆 CyberClub Tournaments

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![NestJS](https://img.shields.io/badge/nestjs-E0234E?style=for-the-badge&logo=nestjs&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)

**CyberClub Tournaments** — это кроссплатформенная экосистема для организации и проведения киберспортивных турниров. Приложение позволяет игрокам создавать команды, регистрироваться в турнирах и отслеживать прогресс по турнирной сетке в реальном времени, а организаторам — полностью автоматизировать управление матчами.

---

## 📱 Скриншоты

| Лента турниров | Детали турнира | Мои турниры | Мои команды | Профиль |
|:---:|:---:|:---:|:---:|:---:|
| <img width="200" alt="Screenshot_1769102463" src="https://github.com/user-attachments/assets/cdf415c0-b5a3-4a37-8829-5da89295d144" /> | <img width="200" alt="Screenshot_1769102757" src="https://github.com/user-attachments/assets/41bcff61-4e23-4e9f-9c00-d25997d4a5f3" /> | <img width="200" alt="Screenshot_1769103441" src="https://github.com/user-attachments/assets/9795f4f1-99a4-48a8-a6fb-b64122d673d7" /> | <img width="200" alt="Screenshot_1769104725" src="https://github.com/user-attachments/assets/af681a8c-a92d-406b-b80f-77f3aefab3ab" /> | <img width="200" alt="Screenshot_1769104239" src="https://github.com/user-attachments/assets/a4f39e52-26e2-450e-abbf-206e260ab336" />


---

## 🔥 Ключевые возможности

### Для Игроков
*   **Регистрация и Профиль:** Загрузка аватара, статистика побед/поражений, история участия.
*   **Команды:** Создание команд (логотип, тег, описание), приглашение участников по никнейму.
*   **Турниры:** Фильтрация (статус, дисциплина, формат), регистрация (Solo/Team), просмотр соперников.
*   **Интерактивная сетка:** Визуализация турнирной сетки (Bracket) с результатами матчей в реальном времени.

### Для Организаторов и Админов
*   **Dashboard:** Полная статистика по системе (активные турниры, новые пользователи).
*   **Управление турнирами:** Создание, запуск, завершение и отмена турниров.
*   **Генерация сетки:** Автоматический алгоритм построения сетки (Single Elimination) с поддержкой seeding и "пустых" слотов (BYE).
*   **Модерация:** Бан пользователей/команд, смена ролей, редактирование контента.

---

## 🛠 Технический стек

### 📱 Mobile App (Frontend)
*   **Framework:** Flutter (Dart).
*   **Architecture:** Clean Architecture + BLoC pattern.
*   **State Management:** `flutter_bloc`.
*   **Navigation:** `go_router` (Nested navigation, Deep linking support).
*   **Network:** `dio` (Interceptors for JWT Refresh Token rotation).
*   **Code Gen:** `freezed`, `json_serializable`.
*   **UI:** Custom themes, Gradient components, Adaptive layouts (`InteractiveViewer` for brackets).

### 🖥 Backend (API)
*   **Framework:** NestJS (TypeScript).
*   **Database:** PostgreSQL.
*   **ORM:** Prisma (Code-first approach, Migrations).
*   **Auth:** JWT (Access + Refresh Tokens), Hashing (bcrypt), Role-Based Access Control (RBAC Guards).
*   **File Upload:** Multer (Local storage serving).
*   **Validation:** `class-validator`, `class-transformer`.

### ⚙️ DevOps
*   **Containerization:** Docker & Docker Compose (Full stack setup in one command).
*   **Environment:** Strict separation of Dev/Prod configs using `.env`.


