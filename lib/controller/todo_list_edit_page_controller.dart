import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/Routes/routes.dart';

class TodoListEditPageController extends GetxController {
  final txtJudul = TextEditingController();
  final txtDeskripsi = TextEditingController();
  
  var kategori = Rxn<String>();
  var tingkatKepentingan = Rxn<String>();
  
  final kategoriList = ["work", "personal", "study"];
  final tingkatKepentinganList = ["low", "normal", "high", "urgent"];
  
  var isEditing = false.obs;
  var editingId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments;
    if (args != null) {
      isEditing.value = true;
      editingId.value = args as String;
      _loadTodoData();
    }
  }

  void _loadTodoData() {
    final controller = Get.find<TodoController>();
    final todo = controller.getTodoById(editingId.value);
    if (todo != null) {
      txtJudul.text = todo.judul;
      txtDeskripsi.text = todo.deskripsi;
      kategori.value = todo.kategori;
      tingkatKepentingan.value = todo.tingkatKepentingan;
    }
  }

  void updateKategori(String? value) {
    kategori.value = value;
  }

  void updateTingkatKepentingan(String? value) {
    tingkatKepentingan.value = value;
  }

  void saveTodo() {
    if (txtJudul.text.isEmpty ||
        txtDeskripsi.text.isEmpty ||
        kategori.value == null ||
        tingkatKepentingan.value == null) {
      Get.snackbar(
        "ERROR",
        "All fields must be filled",
        backgroundColor: const Color(0xFFB45253).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
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
      return;
    }

    final controller = Get.find<TodoController>();

    if (isEditing.value) {
      controller.updateTodo(
        id: editingId.value,
        judul: txtJudul.text,
        deskripsi: txtDeskripsi.text,
        kategori: kategori.value!,
        tingkatKepentingan: tingkatKepentingan.value!,
      );
      Get.offAllNamed(AppRoutes.base);
      Get.snackbar(
        "SUCCESS",
        "Todo updated successfully",
        backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
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
      controller.addTodo(
        judul: txtJudul.text,
        deskripsi: txtDeskripsi.text,
        kategori: kategori.value!,
        tingkatKepentingan: tingkatKepentingan.value!,
      );
      Get.offAllNamed(AppRoutes.base);
      Get.snackbar(
        "SUCCESS",
        "Todo added successfully",
        backgroundColor: const Color(0xFF84994F).withOpacity(0.9),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
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

  @override
  void onClose() {
    txtJudul.dispose();
    txtDeskripsi.dispose();
    super.onClose();
  }
}