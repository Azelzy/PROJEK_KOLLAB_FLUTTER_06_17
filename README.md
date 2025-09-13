# 📝 PROJEKT 6_17 - Flutter Todo List App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-9C27B0?style=for-the-badge&logo=flutter&logoColor=white)

Sebuah aplikasi Todo List dengan desain **Brutalist** yang dibangun menggunakan Flutter dan state management GetX. Aplikasi ini menampilkan gaya desain yang bold, kontras tinggi, dan interface yang tegas namun fungsional.

## ✨ Fitur Utama

### 🔐 Autentikasi
- **Login & Register** dengan validasi
- **Session management** menggunakan GetX
- **Default admin account** (Username: Admin, Password: 12345)

### 📋 Manajemen Todo
- ✅ **Tambah, Edit, Hapus** todo
- 🏷️ **Kategori**: Work, Personal, Study
- ⚡ **Tingkat Prioritas**: Low, Normal, High, Urgent
- 🎨 **Color-coded priority** untuk visual feedback
- ✔️ **Swipe to complete** - swipe kanan untuk menyelesaikan
- 🔄 **Restore completed todos** - swipe kiri di history

### 🎯 Interface & UX
- 📱 **Bottom Navigation** dengan 2 tab utama
- 🗂️ **Active Todos** dan **Completed History**
- 🍔 **Drawer navigation** dengan profil anggota
- 🔔 **Snackbar notifications** untuk feedback
- 💬 **Confirmation dialogs** untuk aksi penting

## 🎨 Desain Brutalist

Aplikasi ini menggunakan filosofi desain **Neo-Brutalism** dengan karakteristik:

- **Bold Typography** - Font tebal dan kontras tinggi
- **Sharp Corners** - Tidak ada border radius, semua sudut tajam
- **High Contrast** - Kombinasi hitam-putih yang tegas
- **Thick Borders** - Border 3-4px untuk efek yang kuat
- **Drop Shadows** - Shadow hitam offset untuk dimensi
- **Flat Colors** - Palet warna solid tanpa gradient

## 🏗️ Arsitektur

### State Management
- **GetX** untuk reactive state management
- **Dependency Injection** dengan bindings
- **Navigation management** dengan GetX routing

### Struktur Proyek
```
lib/
├── Routes/           # Routing & navigation setup
├── bindings/         # Dependency injection
├── controller/       # Business logic & state
├── models/           # Data models
├── pages/           # UI screens
└── widgets/         # Reusable components
```

### Komponen Utama
- **AuthController** - Manajemen login/logout
- **TodoController** - CRUD operations untuk todos
- **NavigationController** - Bottom navigation logic
- **Custom Widgets** - Brutalist UI components

## 📱 Screenshots


## 🚀 Instalasi

### Prerequisites
- Flutter SDK (≥3.0.0)
- Dart SDK
- Android Studio / VS Code
- Device atau emulator Android/iOS

### Langkah Instalasi

1. **Clone repository**
```bash
git clone https://github.com/Azelzy/PROJEK_KOLLAB_FLUTTER_06_17.git
cd project_17_6
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Jalankan aplikasi**
```bash
flutter run
```

## 📦 Dependencies

Aplikasi ini menggunakan beberapa package utama:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6              # State management & navigation
  uuid: ^4.1.0             # Unique ID generation
  url_launcher: ^6.2.1     # External URL launching

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🎯 Cara Penggunaan

### Login
1. Buka aplikasi
2. Gunakan akun default: **Admin** / **12345**
3. Atau register akun baru

### Mengelola Todo
1. **Tambah Todo**: Tap (+) pada halaman Todo List
2. **Edit Todo**: Tap icon edit pada todo item
3. **Complete Todo**: Swipe kanan pada todo item
4. **Restore Todo**: Swipe kiri pada completed todo
5. **Delete Todo**: Tap delete icon di history page

### Navigasi
- **Bottom Navigation**: Switch antara Active Todos dan History
- **Drawer Menu**: Akses profil anggota dan logout

## 👥 Tim Pengembang

### Anggota Kelompok XI PPLG 1

| Nama | Absen | Role | GitHub |
|------|-------|------|---------|
| **Azka El Fachrizy** | 06 | UI/UX | [@Azelzy](https://github.com/Azelzy) |
| **Ihsan H.U** | 17 | Spesialis Controller | [@IhsanHU-coder](https://github.com/IhsanHU-coder) |

## 🔮 Pengembangan Selanjutnya

### Kontribusi
1. Fork repository ini
2. Buat branch fitur (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## 📞 Kontak

- **Azka El Fachrizy** - [@Azelzy](https://github.com/Azelzy)
- **Ihsan H.U** - [@IhsanHU-coder](https://github.com/IhsanHU-coder)

**Project Link**: [https://github.com/username/projekt-6-17-flutter-todo](https://github.com/username/projekt-6-17-flutter-todo)

---

<div align="center">
<strong> ありがとう ございます ♡ᰔ૮₍ ˃ ⤙ ˂ ₎ა </strong>
</div>
