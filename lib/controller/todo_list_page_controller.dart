import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  final _uuid = const Uuid();
  var todos = <Todo>[].obs;

  List<Todo> get activeList => todos.where((t) => !t.selesai).toList();
  List<Todo> get completedList => todos.where((t) => t.selesai).toList();

  void addTodo({
    required String judul,
    required String deskripsi,
    required String kategori,
    required String tingkatKepentingan,
  }) {
    todos.add(Todo(
      id: _uuid.v4(),
      judul: judul,
      deskripsi: deskripsi,
      kategori: kategori,
      tingkatKepentingan: tingkatKepentingan,
    ));
  }

  void updateTodo({
    required String id,
    required String judul,
    required String deskripsi,
    required String kategori,
    required String tingkatKepentingan,
  }) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index].judul = judul;
      todos[index].deskripsi = deskripsi;
      todos[index].kategori = kategori;
      todos[index].tingkatKepentingan = tingkatKepentingan;
      todos.refresh();
    }
  }

  void toggleComplete(String id, bool value) {
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = todos[index];
      todos[index].selesai = value;
      todos.refresh();
      
      if (value) {
        Get.snackbar(
          "COMPLETED",
          "\"${todo.judul}\" telah diselesaikan",
          backgroundColor: const Color(0xFF84994F),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
      } else {
        Get.snackbar(
          "RESTORED",
          "\"${todo.judul}\" dipulihkan ke todo aktif",
          backgroundColor: const Color(0xFFFCB53B),
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(16),
        );
      }
    }
  }

  void deleteTodo(String id) {
    final todo = todos.firstWhere((t) => t.id == id);
    todos.removeWhere((todo) => todo.id == id);
    
    Get.snackbar(
      "DELETED",
      "\"${todo.judul}\" telah dihapus",
      backgroundColor: const Color(0xFFB45253),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
    );
  }

  Todo? getTodoById(String id) {
    try {
      return todos.firstWhere((todo) => todo.id == id);
    } catch (e) {
      return null;
    }
  }
}