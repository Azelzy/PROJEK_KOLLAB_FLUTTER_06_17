import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:project_17_6/models/todo_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //TABEL TODOS
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id TEXT PRIMARY KEY,
        judul TEXT NOT NULL,
        deskripsi TEXT NOT NULL,
        kategori TEXT NOT NULL,
        tingkatKepentingan TEXT NOT NULL,
        selesai INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // CREATE - Tambah Todo
  Future<String> insertTodo(Todo todo) async {
    final db = await database;
    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return todo.id;
  }

  // READ - Ambil semua Todos
  Future<List<Todo>> getAllTodos() async {
    final db = await database;
    final result = await db.query('todos', orderBy: 'judul ASC');
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  // READ - Ambil todo by ID
  Future<Todo?> getTodoById(String id) async {
    final db = await database;
    final result = await db.query('todos', where: 'id = ?', whereArgs: [id]);

    if (result.isNotEmpty) {
      return Todo.fromMap(result.first);
    }
    return null;
  }

  // READ - Ambil active todos (belum selesai)
  Future<List<Todo>> getActiveTodos() async {
    final db = await database;
    final result = await db.query(
      'todos',
      where: 'selesai = ?',
      whereArgs: [0],
      orderBy: 'judul ASC',
    );
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  // READ - Ambil completed todos
  Future<List<Todo>> getCompletedTodos() async {
    final db = await database;
    final result = await db.query(
      'todos',
      where: 'selesai = ?',
      whereArgs: [1],
      orderBy: 'judul ASC',
    );
    return result.map((json) => Todo.fromMap(json)).toList();
  }

  // UPDATE - Update Todo
  Future<int> updateTodo(Todo todo) async {
    final db = await database;
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  // UPDATE - Toggle status selesai
  Future<int> toggleComplete(String id, bool isComplete) async {
    final db = await database;
    return await db.update(
      'todos',
      {'selesai': isComplete ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // DELETE - Hapus Todo
  Future<int> deleteTodo(String id) async {
    final db = await database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }

  // DELETE - Hapus semua Todos (optional, untuk testing)
  Future<int> deleteAllTodos() async {
    final db = await database;
    return await db.delete('todos');
  }

  // Close database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
