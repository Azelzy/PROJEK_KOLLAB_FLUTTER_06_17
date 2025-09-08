import 'package:get/get.dart';
import 'package:project_17_6/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  final _uuid = const Uuid();

  // Master list
  var todos = <Todo>[].obs;

  // Derived getters
  List<Todo> get selesaiList => todos.where((t) => t.selesai).toList();
  List<Todo> get aktifList => todos.where((t) => !t.selesai).toList();

  // CRUD
  void tambahTodo({required String judul, required String deskripsi, required String kategori}) {
    todos.add(Todo(
      id: _uuid.v4(),
      judul: judul,
      deskripsi: deskripsi,
      kategori: kategori,
    ));
  }

  void toggleSelesai(String id, bool value) {
    final idx = todos.indexWhere((t) => t.id == id);
    if (idx != -1) {
      todos[idx].selesai = value;
      todos.refresh();
    }
  }

  void hapus(String id) {
    todos.removeWhere((t) => t.id == id);
  }
}