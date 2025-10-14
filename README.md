# 📝 PROJEKT 6_17 - Flutter Todo List App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![GetX](https://img.shields.io/badge/GetX-9C27B0?style=for-the-badge&logo=flutter&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-07405E?style=for-the-badge&logo=sqlite&logoColor=white)

Sebuah aplikasi Todo List dengan desain **Brutalist** yang dibangun menggunakan Flutter dan state management GetX. Aplikasi ini menampilkan gaya desain yang bold, kontras tinggi, dan interface yang tegas namun fungsional dengan persistent storage menggunakan SQLite.

## ✨ Fitur Utama

### 🔐 Autentikasi
- **Login & Register** dengan validasi
- **Remember Me** menggunakan SharedPreferences
- **Auto-login** pada splash screen
- **Session management** menggunakan GetX
- **Default admin account** (Username: Admin, Password: 12345)

### 📋 Manajemen Todo
- ✅ **Tambah, Edit, Hapus** todo
- 🏷️ **Kategori**: Work, Personal, Study
- ⚡ **Tingkat Prioritas**: Low, Normal, High, Urgent
- 🎨 **Color-coded priority** untuk visual feedback
- ✔️ **Swipe to complete** - swipe kanan untuk menyelesaikan
- 🔄 **Restore completed todos** - swipe kiri di history
- 💾 **Persistent storage** dengan SQLite database

### 🎯 Interface & UX
- 📱 **Responsive Design** - Adaptif untuk mobile dan tablet/desktop
- 🖥️ **Dual Layout** - Mobile layout dan wide-screen layout
- 🚀 **Splash Screen** dengan loading animation
- 📱 **Bottom Navigation** dengan 2 tab utama
- 🗂️ **Active Todos** dan **Completed History**
- 🍔 **Drawer navigation** dengan profil anggota
- 🔔 **Snackbar notifications** untuk feedback
- 💬 **Confirmation dialogs** untuk aksi penting

### 💾 Database & Storage
- **SQLite (sqflite)** - Database lokal untuk menyimpan todos secara permanen
- **SharedPreferences** - Menyimpan credentials dan remember me
- **CRUD Operations** - Create, Read, Update, Delete dengan database
- **Auto-load data** - Data otomatis dimuat saat aplikasi dibuka
- **Data persistence** - Data tetap ada setelah aplikasi ditutup

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
├── database/         # SQLite database helper
├── models/           # Data models
├── pages/           
│   ├── Mobile/       # Mobile-optimized pages
│   └── Widescreen/   # Tablet/Desktop layouts
└── widgets/          # Reusable components
```

### Komponen Utama
- **AuthController** - Manajemen login/logout & SharedPreferences
- **TodoController** - CRUD operations dengan SQLite database
- **NavigationController** - Bottom navigation logic
- **SplashController** - Splash screen & auto-login logic
- **DatabaseHelper** - SQLite database operations
- **Custom Widgets** - Brutalist UI components

### Responsive Design
Aplikasi ini mendukung dua mode layout:
- **Mobile Layout** (< 600px) - Optimized untuk smartphone
- **Wide Layout** (≥ 600px) - Grid layout untuk tablet dan desktop

## 📱 Screenshots

*[Screenshot akan ditambahkan di sini]*

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
  get: ^4.6.6                    # State management & navigation
  uuid: ^4.1.0                   # Unique ID generation
  url_launcher: ^6.2.1           # External URL launching
  loading_animation_widget:      # loading animation
  animations: ^2.0.11
  flutter_staggered_animations: ^1.1.1
  cupertino_icons: ^1.0.8
  sqflite: ^2.3.0               # SQLite database
  path: ^1.8.3                   # Path manipulation
  shared_preferences: ^2.2.2     # Local storage for credentials

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🎯 Cara Penggunaan

### Login
1. Buka aplikasi (splash screen akan muncul)
2. Jika sudah pernah login dengan "Remember Me", akan otomatis login
3. Gunakan akun default: **Admin** / **12345**
4. Atau register akun baru
5. Centang "Remember Me" untuk auto-login di masa depan

### Mengelola Todo
1. **Tambah Todo**: Tap FAB (+) di halaman Todo List
2. **Edit Todo**: Tap icon edit pada todo item
3. **Complete Todo**: Swipe kanan pada todo item
4. **Restore Todo**: Swipe kiri pada completed todo di history
5. **Delete Todo**: Tap delete icon di history page
6. **Data tersimpan otomatis** di SQLite database

### Navigasi
- **Bottom Navigation**: Switch antara Active Todos dan History
- **Drawer Menu**: Akses profil anggota dan logout
- **Responsive**: Layout otomatis menyesuaikan ukuran layar

## 🗄️ Database Structure

### Tabel: `todos`

| Column | Type | Description |
|--------|------|-------------|
| id | TEXT | Primary key (UUID) |
| judul | TEXT | Judul todo |
| deskripsi | TEXT | Deskripsi todo |
| kategori | TEXT | work/personal/study |
| tingkatKepentingan | TEXT | low/normal/high/urgent |
| selesai | INTEGER | 0 = active, 1 = completed |

## 📱 Fitur Responsive

### Mobile Layout (< 600px)
- Single column list view
- Bottom navigation bar
- Compact card design
- Touch-optimized spacing

### Wide Layout (≥ 600px)
- Two-column grid layout
- Split screen login page
- Larger interactive elements
- Better use of screen real estate

## 🔮 Fitur yang Diimplementasikan

- ✅ SQLite Database untuk persistent storage
- ✅ SharedPreferences untuk remember me
- ✅ Splash Screen dengan auto-login
- ✅ Responsive design (mobile & tablet/desktop)
- ✅ CRUD operations dengan database
- ✅ Color-coded priority system
- ✅ Swipe gestures untuk interaksi
- ✅ Real-time data synchronization

## 👥 Tim Pengembang

### Anggota Kelompok XI PPLG 1

| Nama | Absen | Role | GitHub |
|------|-------|------|---------|
| **Azka El Fachrizy** | 06 | UI/UX & Database | [@Azelzy](https://github.com/Azelzy) |
| **Ihsan H.U** | 17 | Spesialis Controller & Logic | [@IhsanHU-coder](https://github.com/IhsanHU-coder) |

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **State Management**: GetX
- **Database**: SQLite (sqflite)
- **Local Storage**: SharedPreferences
- **Architecture**: MVC with GetX pattern
- **Design**: Neo-Brutalism


## 🤝 Kontribusi

### Cara Berkontribusi
1. Fork repository ini
2. Buat branch fitur (`git checkout -b feature/AmazingFeature`)
3. Commit perubahan (`git commit -m 'Add some AmazingFeature'`)
4. Push ke branch (`git push origin feature/AmazingFeature`)
5. Buat Pull Request

## 📞 Kontak

- **Azka El Fachrizy** - [@Azelzy](https://github.com/Azelzy)
- **Ihsan H.U** - [@IhsanHU-coder](https://github.com/IhsanHU-coder)

**Project Link**: [https://github.com/Azelzy/PROJEK_KOLLAB_FLUTTER_06_17](https://github.com/Azelzy/PROJEK_KOLLAB_FLUTTER_06_17)

## 📄 License

Project ini dibuat untuk keperluan pembelajaran dan tidak memiliki lisensi komersial.

---

<div align="center">
<strong>ありがとう ございます ♡ᰔ૮₍ ˃ ⤙ ˂ ₎ა</strong>
</div>
