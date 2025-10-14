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

### 🔄 CRUD Operations
Aplikasi ini mengimplementasikan operasi CRUD lengkap:

| Operation | Method | SQL | Fungsi |
|-----------|--------|-----|--------|
| **Create** | `addTodo()` | `INSERT INTO` | Tambah todo baru |
| **Read** | `loadTodos()`, `getTodoById()` | `SELECT FROM` | Tampilkan/ambil data |
| **Update** | `updateTodo()`, `toggleComplete()` | `UPDATE SET` | Edit todo & ubah status |
| **Delete** | `deleteTodo()` | `DELETE FROM` | Hapus todo |

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

### 🔑 Primary Key Explanation

**Primary Key** adalah kolom yang uniquely identifies setiap record dalam tabel. Di aplikasi ini, `id` adalah primary key dengan karakteristik:

#### Mengapa UUID sebagai Primary Key?
- ✅ **Globally Unique** - Tidak akan ada duplikasi bahkan di sistem terdistribusi
- ✅ **No Auto-increment** - Tidak perlu koordinasi dengan database untuk generate ID
- ✅ **String Format** - Mudah dibaca dan di-debug
- ✅ **36 Characters** - Format: `550e8400-e29b-41d4-a716-446655440000`

#### Mengapa Tipe Data TEXT?
SQLite tidak memiliki tipe UUID native. Pilihan tipe data:

| Tipe | Size | Readable | Konversi | Pilihan |
|------|------|----------|----------|---------|
| TEXT | 36 bytes | ✅ Ya | ❌ Tidak perlu | ✅ **Dipilih** |
| BLOB | 16 bytes | ❌ Tidak | ✅ Perlu | Untuk jutaan records |

TEXT dipilih karena lebih mudah di-maintain dan di-debug untuk skala aplikasi todo list.

#### Penggunaan Primary Key di Aplikasi

**1. Create - Generate ID Unik:**
```dart
final newTodo = Todo(
  id: _uuid.v4(),  // Generate UUID sebagai primary key
  judul: judul,
  // ...
);
```

**2. Read - Query by ID:**
```dart
Future<Todo?> getTodoById(String id) async {
  final result = await db.query('todos', where: 'id = ?', whereArgs: [id]);
}
```

**3. Update - Identifikasi Record:**
```dart
await db.update('todos', todo.toMap(), where: 'id = ?', whereArgs: [id]);
```

**4. Delete - Hapus Record Spesifik:**
```dart
await db.delete('todos', where: 'id = ?', whereArgs: [id]);
```

**5. UI - Widget Key:**
```dart
Dismissible(
  key: Key(todo.id),  // Primary key sebagai widget key
  // ...
)
```

#### Contoh Data dalam Database

| id (PRIMARY KEY) | judul | kategori | selesai |
|------------------|-------|----------|---------|
| `550e8400-e29b-41d4-a716-446655440000` | Belajar Flutter | study | 0 |
| `7c9e6679-7425-40de-944b-e07fc1f90ae7` | Meeting Client | work | 0 |
| `a3bb189e-8bf9-3888-9912-ace4e6543002` | Olahraga Pagi | personal | 1 |

**⚠️ Constraints:**
- ❌ Tidak boleh duplikat
- ❌ Tidak boleh NULL
- ✅ Otomatis terindex untuk performa query

## 🔄 CRUD Operations Detail

Aplikasi ini mengimplementasikan operasi **CRUD (Create, Read, Update, Delete)** lengkap dengan SQLite database.

### 📊 Mapping CRUD Operations

| CRUD | Method di Controller | Method di DatabaseHelper | SQL Query | Deskripsi |
|------|---------------------|--------------------------|-----------|-----------|
| **C**reate | `addTodo()` | `insertTodo()` | `INSERT INTO todos` | Menambah todo baru ke database |
| **R**ead | `loadTodos()`, `getTodoById()` | `getAllTodos()`, `getTodoById()`, `getActiveTodos()`, `getCompletedTodos()` | `SELECT FROM todos` | Membaca/menampilkan data dari database |
| **U**pdate | `updateTodo()`, `toggleComplete()` | `updateTodo()`, `toggleComplete()` | `UPDATE todos SET` | Mengubah data todo yang sudah ada |
| **D**elete | `deleteTodo()` | `deleteTodo()` | `DELETE FROM todos` | Menghapus todo dari database |

### 💻 Implementasi di Code

#### 1️⃣ CREATE - Tambah Todo Baru
```dart
// TodoController
Future<void> addTodo({
  required String judul,
  required String deskripsi,
  required String kategori,
  required String tingkatKepentingan,
}) async {
  final newTodo = Todo(
    id: _uuid.v4(),  // Generate unique ID
    judul: judul,
    deskripsi: deskripsi,
    kategori: kategori,
    tingkatKepentingan: tingkatKepentingan,
  );
  
  await _dbHelper.insertTodo(newTodo);  // 📝 INSERT ke database
  todos.add(newTodo);
}
```

**SQL yang dijalankan:**
```sql
INSERT INTO todos (id, judul, deskripsi, kategori, tingkatKepentingan, selesai)
VALUES ('uuid-generated', 'Belajar Flutter', 'Pelajari widget', 'study', 'high', 0);
```

#### 2️⃣ READ - Baca/Tampilkan Data
```dart
// TodoController - Load semua todos
Future<void> loadTodos() async {
  final todosFromDb = await _dbHelper.getAllTodos();  // 📖 SELECT semua
  todos.value = todosFromDb;
}

// DatabaseHelper - Get by ID
Future<Todo?> getTodoById(String id) async {
  final db = await database;
  final result = await db.query(
    'todos',
    where: 'id = ?',  // 📖 SELECT dengan filter
    whereArgs: [id],
  );
  return result.isNotEmpty ? Todo.fromMap(result.first) : null;
}

// DatabaseHelper - Get Active Todos
Future<List<Todo>> getActiveTodos() async {
  final db = await database;
  final result = await db.query(
    'todos',
    where: 'selesai = ?',  // 📖 SELECT todo yang belum selesai
    whereArgs: [0],
  );
  return result.map((json) => Todo.fromMap(json)).toList();
}
```

**SQL yang dijalankan:**
```sql
-- Get semua todos
SELECT * FROM todos ORDER BY judul ASC;

-- Get by ID
SELECT * FROM todos WHERE id = '550e8400-e29b-41d4-a716-446655440000';

-- Get active todos
SELECT * FROM todos WHERE selesai = 0 ORDER BY judul ASC;

-- Get completed todos
SELECT * FROM todos WHERE selesai = 1 ORDER BY judul ASC;
```

#### 3️⃣ UPDATE - Edit/Ubah Data
```dart
// TodoController - Update seluruh todo
Future<void> updateTodo({
  required String id,
  required String judul,
  required String deskripsi,
  required String kategori,
  required String tingkatKepentingan,
}) async {
  final index = todos.indexWhere((todo) => todo.id == id);
  if (index != -1) {
    final updatedTodo = todos[index].copyWith(
      judul: judul,
      deskripsi: deskripsi,
      kategori: kategori,
      tingkatKepentingan: tingkatKepentingan,
    );
    
    await _dbHelper.updateTodo(updatedTodo);  // ✏️ UPDATE database
    todos[index] = updatedTodo;
    todos.refresh();
  }
}

// TodoController - Toggle Complete (update status saja)
Future<void> toggleComplete(String id, bool value) async {
  await _dbHelper.toggleComplete(id, value);  // ✏️ UPDATE status selesai
  
  final index = todos.indexWhere((todo) => todo.id == id);
  if (index != -1) {
    todos[index] = todos[index].copyWith(selesai: value);
    todos.refresh();
  }
}
```

**SQL yang dijalankan:**
```sql
-- Update seluruh todo
UPDATE todos 
SET judul = 'Judul Baru', 
    deskripsi = 'Deskripsi Baru',
    kategori = 'work',
    tingkatKepentingan = 'urgent'
WHERE id = '550e8400-e29b-41d4-a716-446655440000';

-- Toggle complete
UPDATE todos 
SET selesai = 1 
WHERE id = '550e8400-e29b-41d4-a716-446655440000';
```

#### 4️⃣ DELETE - Hapus Data
```dart
// TodoController
Future<void> deleteTodo(String id) async {
  final todo = todos.firstWhere((t) => t.id == id);
  await _dbHelper.deleteTodo(id);  // 🗑️ DELETE dari database
  todos.removeWhere((todo) => todo.id == id);
  
  Get.snackbar("DELETED", "\"${todo.judul}\" has been deleted");
}

// DatabaseHelper
Future<int> deleteTodo(String id) async {
  final db = await database;
  return await db.delete(
    'todos',
    where: 'id = ?',  // 🗑️ DELETE dengan filter ID
    whereArgs: [id],
  );
}
```

**SQL yang dijalankan:**
```sql
DELETE FROM todos 
WHERE id = '550e8400-e29b-41d4-a716-446655440000';
```

### 🎯 Penggunaan di UI

#### CREATE - Tambah Todo
```dart
// Di TodoListEditPageController
void saveTodo() {
  if (!isEditing.value) {
    controller.addTodo(  // ✨ CREATE
      judul: txtJudul.text,
      deskripsi: txtDeskripsi.text,
      kategori: kategori.value!,
      tingkatKepentingan: tingkatKepentingan.value!,
    );
  }
}
```

#### READ - Tampilkan Data
```dart
// Di TodoListPageMobile
@override
Widget build(BuildContext context) {
  final todoController = Get.find<TodoController>();
  
  return Obx(() {
    final activeList = todoController.activeList;  // 📖 READ active todos
    
    return ListView.builder(
      itemCount: activeList.length,
      itemBuilder: (context, index) {
        final todo = activeList[index];  // 📖 READ individual todo
        return TodoCard(todo: todo);
      },
    );
  });
}
```

#### UPDATE - Edit & Toggle
```dart
// Update Todo
onEdit: () => Get.toNamed(
  AppRoutes.todoListEdit, 
  arguments: todo.id  // ✏️ Edit akan UPDATE data
)

// Toggle Complete via Swipe
Dismissible(
  onDismissed: (_) {
    todoController.toggleComplete(todo.id, true);  // ✏️ UPDATE status
  },
)

// Toggle Complete via Checkbox
Checkbox(
  value: todo.selesai,
  onChanged: (value) {
    todoController.toggleComplete(todo.id, value ?? false);  // ✏️ UPDATE
  },
)
```

#### DELETE - Hapus Todo
```dart
// Di History Page
IconButton(
  icon: Icon(Icons.delete),
  onPressed: () {
    todoController.deleteTodo(todo.id);  // 🗑️ DELETE
  },
)
```

### 🔍 Perbedaan READ vs UPDATE

| Aspek | READ 📖 | UPDATE ✏️ |
|-------|---------|-----------|
| Fungsi | Membaca/menampilkan data | Mengubah data yang ada |
| SQL | `SELECT FROM` | `UPDATE SET` |
| Contoh | `loadTodos()`, `getTodoById()` | `updateTodo()`, `toggleComplete()` |
| Effect | Tidak mengubah database | Mengubah data di database |
| Return | Data (List/Object) | Status (int/void) |

**⚠️ Catatan Penting:**
- `toggleComplete()` adalah **UPDATE**, bukan READ, karena mengubah nilai kolom `selesai`
- `activeList` dan `completedList` adalah **READ** karena hanya mem-filter data tanpa mengubah database

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
