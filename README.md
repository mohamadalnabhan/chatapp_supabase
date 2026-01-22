# Real-Time Chat App (Flutter + Supabase + GetX)

A real-time chat application built with Flutter and Supabase that allows users to send and receive messages instantly. The app uses Supabase Realtime for live updates and follows an MVC architecture with GetX for state management and dependency injection.

---

## 💬 Features

* Real-time messaging using Supabase Realtime
* Send and receive messages instantly
* Messages stored in Supabase Postgres database
* Mark messages as read
* Clean chat UI with chat bubbles
* Reactive UI updates using GetX
* Simple and scalable MVC architecture

---

## 🛠️ Tech Stack

* Flutter
* Dart
* Supabase (Auth, Postgres, Realtime)
* GetX (state management, routing, dependency injection)
* MVC Architecture (Model–View–Controller)

---

## 🧱 Architecture Overview

This project follows the MVC pattern:

* **Model**: Message model for handling chat data and JSON serialization
* **View**: UI screens such as Home Page and Chat Page
* **Controller / Service**: AppService handles Supabase logic, message sending, listening to realtime updates, and marking messages as read

GetX is used to manage state reactively and handle navigation.

---

## 📂 Project Structure

```
lib/
│── controller/
│   └── app_service.dart
│── models/
│   └── message_model.dart
│── view/
│   ├── home.dart
│   ├── chat_page.dart
│   └── widgets/
│       ├── chat_bubble.dart
│── main.dart
```

---

## 🚀 Getting Started

### 1️⃣ Clone the repository

```bash
git clone https://github.com/your-username/chatapp-supabase.git
```

### 2️⃣ Install dependencies

```bash
flutter pub get
```

### 3️⃣ Supabase Setup

* Create a new project on Supabase
* Create a `messages` table with fields like:

  * `id`
  * `content`
  * `sender_id`
  * `is_read`
  * `created_at`
* Enable Realtime on the `messages` table

### 4️⃣ Configure Supabase

Initialize Supabase in `main.dart`:

```dart
await Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_ANON_KEY',
);
```

### 5️⃣ Run the app

```bash
flutter run
```

---

## 🔄 Realtime Messaging

* Messages are inserted into Supabase Postgres
* Supabase Realtime listens for new messages
* UI updates automatically using GetX `Rx` variables and `Obx`

---

## 📸 Screenshots

<!-- Add screenshots here -->
<img width="302" height="647" alt="homepagechat" src="https://github.com/user-attachments/assets/3a1896f8-19c1-4240-814c-4872a4ab9bab" />
<img width="300" height="643" alt="user2pagechat" src="https://github.com/user-attachments/assets/34575e15-284e-4058-b9e3-fadf687b73a7" />
<img width="309" height="644" alt="user1pagechat" src="https://github.com/user-attachments/assets/5639b87f-e77d-4257-96fa-d1b55a8a9bc7" />


---

## ⚠️ Notes

* This project was built as a practice project to understand:

  * Supabase Realtime
  * Chat application architecture
  * GetX state management
* Authentication can be added as an improvement

---

## 🔧 Possible Improvements

* Add Supabase Authentication
* Show online/offline user status
* Push notifications
* Message reactions or attachments

---

## 👨‍💻 Author

Mohamad Nabhan

---

## 📄 License

This project is open-source and intended for learning and educational purposes.
