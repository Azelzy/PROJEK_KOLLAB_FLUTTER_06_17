import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/models/todo_model.dart';
import 'package:project_17_6/helper/database_helper.dart';
import 'package:uuid/uuid.dart';

class TodoController extends GetxController {
  final _uuid = const Uuid();
  final _dbHelper = DatabaseHelper.instance;
  
  var todos = <Todo>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  List<Todo> get activeList => todos.where((t) => !t.selesai).toList();
  List<Todo> get completedList => todos.where((t) => t.selesai).toList();

  // Load semua todos dari database
  Future<void> loadTodos() async {
    try {
      isLoading.value = true;
      final todosFromDb = await _dbHelper.getAllTodos();
      todos.value = todosFromDb;
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "Failed to load todos: $e",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addTodo({
    required String judul,
    required String deskripsi,
    required String kategori,
    required String tingkatKepentingan,
  }) async {
    try {
      final newTodo = Todo(
        id: _uuid.v4(),
        judul: judul,
        deskripsi: deskripsi,
        kategori: kategori,
        tingkatKepentingan: tingkatKepentingan,
      );

      await _dbHelper.insertTodo(newTodo);
      todos.add(newTodo);
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "Failed to add todo: $e",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updateTodo({
    required String id,
    required String judul,
    required String deskripsi,
    required String kategori,
    required String tingkatKepentingan,
  }) async {
    try {
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        final updatedTodo = todos[index].copyWith(
          judul: judul,
          deskripsi: deskripsi,
          kategori: kategori,
          tingkatKepentingan: tingkatKepentingan,
        );

        await _dbHelper.updateTodo(updatedTodo);
        todos[index] = updatedTodo;
        todos.refresh();
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "Failed to update todo: $e",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> toggleComplete(String id, bool value) async {
    try {
      final index = todos.indexWhere((todo) => todo.id == id);
      if (index != -1) {
        await _dbHelper.toggleComplete(id, value);
        
        final todo = todos[index];
        todos[index] = todo.copyWith(selesai: value);
        todos.refresh();
        
        if (value) {
          Get.snackbar(
            "COMPLETED",
            "\"${todo.judul}\" has been completed(„• ֊ •„)੭",
            backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
            duration: const Duration(milliseconds: 920),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(16),
            borderRadius: 0,
            borderWidth: 3,
            borderColor: Colors.black,
            boxShadows: [
              const BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 0,
              ),
            ],
          );
        } else {
          Get.snackbar(
            "RESTORED",
            "\"${todo.judul}\" restored to active todos(„• ֊ •„)੭",
            backgroundColor: const Color(0xFFFCB53B).withOpacity(0.9),
            duration: const Duration(milliseconds: 920),
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP,
            margin: const EdgeInsets.all(16),
            borderRadius: 0,
            borderWidth: 3,
            borderColor: Colors.black,
            boxShadows: [
              const BoxShadow(
                color: Colors.black,
                offset: Offset(4, 4),
                blurRadius: 0,
              ),
            ],
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "Failed to toggle todo: $e",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      final todo = todos.firstWhere((t) => t.id == id);
      await _dbHelper.deleteTodo(id);
      todos.removeWhere((todo) => todo.id == id);
      
      Get.snackbar(
        "DELETED",
        "\"${todo.judul}\" has been deleted.·°՞(っ-ᯅ-ς)՞°·.",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        duration: const Duration(milliseconds: 920),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 0,
        borderWidth: 3,
        borderColor: Colors.black,
        boxShadows: [
          const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 0,
          ),
        ],
      );
    } catch (e) {
      Get.snackbar(
        "ERROR",
        "Failed to delete todo: $e",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Todo? getTodoById(String id) {
    try {
      return todos.firstWhere((todo) => todo.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  void onClose() {
    _dbHelper.close();
    super.onClose();
  }
}