# Kit Store – Мобильный магазин

Стартовый Flutter‑проект интернет‑магазина с модульной архитектурой, готовой дизайн‑системой и интеграцией Firebase Authentication.

**Клиент:** Flutter (Android / iOS / Web / Desktop)  
**Backend:** Firebase (Auth, с возможностью расширения на Firestore / Storage)  
**State Management:** GetX

---

## Содержание

- [Основные возможности](#основные-возможности)
- [Архитектура проекта](#архитектура-проекта)
- [Функциональность](#функциональность)
- [Технологии](#технологии)
- [Структура проекта](#структура-проекта)
- [Установка и запуск](#установка-и-запуск)
- [Интеграция с Firebase](#интеграция-с-firebase)
- [Дизайн-система](#дизайн-система)
- [Разработка](#разработка)

---

## Основные возможности

### Авторизация
- Экран входа и регистрации (каркас)
- Восстановление пароля и экран успешного сброса
- Auth Gate для маршрутизации по статусу сессии
- Репозиторий и сервисы Firebase Auth
- Локальные ключи хранилища: UID, email, displayName, rememberMe
- Обработка ошибок Firebase Auth на русском языке

### Магазин (Shop)
- Модуль каталога и домашнего экрана магазина
- Заготовка экранов категорий и виджетов home
- Ассеты под товары, баннеры, бренды и категории

### Персонализация
- Модуль профиля пользователя (`personalization`)
- Контроллеры и модели для настроек аккаунта

### UI и инфраструктура
- Единая палитра цветов (`TColors`)
- Система размеров и отступов (`TSizes`)
- Snackbar‑уведомления через GetX (`TLoaders`)
- Full-screen лоадеры
- Темы Material и виджет‑темы (кнопки, поля, AppBar и др.)
- Шрифты Poppins / Coolvetica

---

## Архитектура проекта

Приложение построено по **feature‑first** подходу с разделением на слои данных, UI и утилиты. Это упрощает масштабирование магазина и тестирование отдельных модулей.

### Слои архитектуры

#### 1. Features (функциональные модули)

```
lib/features/
├── authentication/     # Вход, регистрация, сброс пароля, auth gate
│   ├── controllers/
│   ├── models/
│   └── screens/
├── shop/               # Каталог, home магазина, категории
│   ├── controllers/
│   ├── models/
│   └── screens/
└── personalization/    # Профиль и настройки пользователя
    ├── controllers/
    ├── models/
    └── screens/
```

**Принципы:**
- Каждый feature изолирован по папкам
- Экраны не содержат прямых вызовов Firebase
- Контроллеры GetX управляют состоянием UI

#### 2. Data Layer (работа с данными)

```
lib/data/
├── repositories/
│   └── authentication/
│       └── authentication_repository.dart
└── services/
    ├── auch_service.dart                 # Абстракция auth‑сервиса
    └── firebase_auch_service.dart        # Реализация через Firebase Auth
```

**Функции:**
- Инкапсуляция работы с Firebase
- Единая точка доступа к авторизации через репозиторий
- Возможность подмены реализации (мок / другой провайдер)

#### 3. Bindings и маршруты

```
lib/bindings/
└── general_bindings.dart     # DI через GetX

lib/routes/
└── routes.dart               # Именованные маршруты приложения
```

#### 4. Utils (общая инфраструктура)

```
lib/utils/
├── constants/      # Цвета, размеры, строки, ключи хранилища, enum
├── exceptions/     # Firebase Auth / platform / format exceptions
├── popups/         # Snackbar и full-screen loaders
├── theme/          # ThemeData и widget themes
├── validators/     # Валидация форм
├── local_storage/  # Локальное хранилище
├── helpers/        # Утилиты и расчёт цен
└── http/           # HTTP‑клиент
```

### Принципы SOLID

- **SRP** — экраны отвечают за UI, репозиторий — за данные, сервисы — за Firebase
- **OCP** — новый способ входа добавляется через сервис/репозиторий без ломки UI
- **LSP** — реализации auth‑сервиса взаимозаменяемы
- **ISP** — модули shop / auth / personalization разделены по зонам ответственности
- **DIP** — UI зависит от абстракций (`auch_service`), а не от Firebase напрямую

---

## Функциональность

### 1. Точка входа

- `main.dart` → `App` → стартовый экран
- Сейчас в `App` подключён `HomeScreen` (заглушка для разработки)
- Далее планируется переход через `AuthGate` на login / shop home

### 2. Авторизация

**Экраны:**
- `login` — вход по email/password
- `signup` — регистрация
- `forget_password` — запрос сброса пароля
- `reset_password_success` — подтверждение отправки письма
- `auth_gate` — проверка сессии и редирект

**Данные сессии (`TStorageKeys`):**
- `uid`, `email`, `displayName`, `idToken`
- `rememberMe`, `savedEmail`

**Ошибки (`TFirebaseAuthException`):**
- `email-already-in-use`, `wrong-password`, `user-not-found`
- `weak-password`, `network-request-failed`, `too-many-requests` и др.

### 3. Магазин

**Модуль `shop`:**
- Home‑экран магазина и виджеты секций
- Экран категорий
- Контроллеры и модели товаров/каталога

**Ассеты:**
- Товары, баннеры, бренды, категории
- Иконки оплаты, onboarding, отзывы, анимации

### 4. Уведомления UI

Через `TLoaders` (GetX snackbar):
- Успех (зелёный)
- Ошибка (красный)
- Предупреждение (оранжевый)

Через `TFullScreenLoaders`:
- Полноэкранный индикатор загрузки при долгих операциях

---

## Технологии

### Frontend
- **Flutter SDK** / **Dart** ^3.11.1
- **State Management:** `get` ^4.7.3
- **Auth:** `firebase_auth` ^6.5.4
- **Core:** `firebase_core` ^4.11.0
- **UI:** Material Design + кастомная тема
- **Fonts:** Poppins, Coolvetica

### Backend / сервисы
- **Firebase Authentication**
- **FlutterFire** (`firebase_options.dart` для Android / iOS / Web / macOS / Windows)

### Качество кода
- **flutter_lints** ^6.0.0
- **flutter_test**

---

## Структура проекта

```
kit_store_start/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── firebase_options.dart
│   │
│   ├── bindings/
│   │   └── general_bindings.dart
│   │
│   ├── routes/
│   │   └── routes.dart
│   │
│   ├── data/
│   │   ├── repositories/authentication/
│   │   └── services/
│   │
│   ├── features/
│   │   ├── authentication/
│   │   │   ├── controllers/
│   │   │   ├── models/
│   │   │   └── screens/
│   │   │       ├── auth_gate/
│   │   │       ├── login/
│   │   │       ├── signup/
│   │   │       ├── forget_password/
│   │   │       └── home/
│   │   ├── shop/
│   │   │   ├── controllers/
│   │   │   ├── models/
│   │   │   └── screens/
│   │   │       ├── home/
│   │   │       └── catrgory/
│   │   └── personalization/
│   │       ├── controllers/
│   │       ├── models/
│   │       └── screens/
│   │
│   ├── localizations/
│   └── utils/
│       ├── constants/
│       ├── exceptions/
│       ├── popups/
│       ├── theme/
│       ├── validators/
│       ├── helpers/
│       ├── http/
│       ├── local_storage/
│       ├── logging/
│       ├── device/
│       └── formatters/
│
├── assets/
│   ├── fonts/
│   ├── logos/
│   ├── icons/
│   │   ├── brands/
│   │   ├── categories/
│   │   └── payment_methods/
│   └── images/
│       ├── products/
│       ├── banners/
│       ├── animations/
│       ├── content/
│       ├── on_boarding_images/
│       └── reviews/
│
├── android/ ios/ web/ windows/ macos/ linux/
├── pubspec.yaml
└── README.md
```

---

## Установка и запуск

### Требования

- **Flutter SDK** (совместимый с Dart ^3.11.1)
- **Git**
- Аккаунт **Firebase** (для Auth)

### 1. Клонирование репозитория

```bash
git clone https://github.com/pivagosu-byte/store_my_app.git
cd store_my_app
```

### 2. Установка зависимостей

```bash
flutter pub get
```

### 3. Настройка Firebase

1. Создайте проект в [Firebase Console](https://console.firebase.google.com/)
2. Включите **Authentication → Email/Password**
3. При необходимости перегенерируйте конфиг:

```bash
flutterfire configure
```

Файл `lib/firebase_options.dart` уже подготовлен через FlutterFire CLI.

### 4. Запуск приложения

```bash
# Список устройств
flutter devices

# Запуск
flutter run

# Конкретная платформа
flutter run -d chrome
flutter run -d windows
flutter run -d <device-id>
```

### 5. Анализ и форматирование

```bash
flutter analyze
dart format lib/
```

---

## Интеграция с Firebase

### Инициализация

В продакшен‑потоке приложение инициализирует Firebase через:

```dart
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

### Auth‑слой

| Компонент | Назначение |
|-----------|------------|
| `AuchService` | Абстракция операций входа/регистрации |
| `FirebaseAuchService` | Реализация через `firebase_auth` |
| `AuthenticationRepository` | Фасад для UI/контроллеров |
| `TFirebaseAuthException` | Человекочитаемые сообщения об ошибках |
| `TStorageKeys` | Ключи локального сохранения сессии |

### Поддерживаемые платформы в `firebase_options.dart`

- Android
- iOS
- Web
- macOS
- Windows

> Linux пока не сконфигурирован — при необходимости выполните `flutterfire configure` повторно.

---

## Дизайн-система

### Цвета (`TColors`)

| Токен | Назначение |
|-------|------------|
| `primary` / `secondary` | Акценты бренда |
| `textPrimary` / `textSecondary` | Типографика |
| `light` / `dark` / `primaryBackground` | Фоны |
| `success` / `warning` / `error` / `info` | Статусы |
| `buttonPrimary` / `buttonDisabled` | Кнопки |
| `containerBackground` | Карточки и блоки |

### Размеры (`TSizes`)

- Базовые отступы: `xs` → `xxl`
- Кнопки, AppBar, поля ввода
- Карточки товаров и сетка каталога
- Карусель изображений, радиусы, elevation

### Шрифты

В `pubspec.yaml` подключены:
- **Poppins** (Light → Bold, включая italic)
- **Coolvetica** (regular / italic)

---

## Разработка

### Стиль кода

- Правила: `flutter_lints`
- Префикс утилит проекта: `T` (`TColors`, `TSizes`, `TLoaders`)
- Feature‑first структура папок

### Сборка релизной версии

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS (macOS)
flutter build ios --release

# Web
flutter build web --release

# Windows
flutter build windows --release
```

### Hot Reload

- **VS Code / Cursor:** сохранение файла или кнопка Hot Reload
- **Терминал Flutter:** клавиша `r` (hot reload), `R` (hot restart)

---

## Дополнительная информация

### Что уже заложено в основу

1. Модульная структура e‑commerce приложения
2. Каркас auth‑флоу и Firebase Auth
3. Дизайн‑токены (цвета, размеры, темы)
4. UI‑фидбек через snackbar и full-screen loaders
5. Набор ассетов под каталог, бренды, оплату и onboarding

### Возможные улучшения

- [ ] Полноценный UI экранов login / signup / forget password
- [ ] AuthGate с авторедиректом по сессии
- [ ] Каталог товаров и карточка продукта
- [ ] Корзина и оформление заказа
- [ ] Firestore для товаров, заказов и профиля
- [ ] Firebase Storage для изображений
- [ ] Избранное и история заказов
- [ ] Онбординг при первом запуске
- [ ] Локализация (RU / EN)
- [ ] Тёмная тема
- [ ] Push‑уведомления
- [ ] Интеграция платёжных методов

---

