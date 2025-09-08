// file: todo_list_edit.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';
import 'package:project_17_6/widgets/brutalist_dropdown.dart';
import 'package:project_17_6/Routes/routes.dart';

class TodoListEditPage extends StatefulWidget {
  const TodoListEditPage({super.key});

  @override
  State<TodoListEditPage> createState() => _TodoListEditPageState();
}

class _TodoListEditPageState extends State<TodoListEditPage> {
  final txtJudul = TextEditingController();
  final txtDeskripsi = TextEditingController();
  String? kategori;
  String? tingkatKepentingan;

  final kategoriList = ["work", "personal", "study"];
  final tingkatKepentinganList = ["low", "normal", "high", "urgent"];

  bool isEditing = false;
  String? editingId;

  @override
  void initState() {
    super.initState();
    final args = Get.arguments;
    if (args != null) {
      isEditing = true;
      editingId = args as String;
      _loadTodoData();
    }
  }

  void _loadTodoData() {
    final controller = Get.find<TodoController>();
    final todo = controller.getTodoById(editingId!);
    if (todo != null) {
      txtJudul.text = todo.judul;
      txtDeskripsi.text = todo.deskripsi;
      kategori = todo.kategori;
      tingkatKepentingan = todo.tingkatKepentingan;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(isEditing ? "EDIT TODO" : "NEW TODO"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "TITLE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            BrutalistTextField(
              controller: txtJudul,
              hint: "Enter todo title",
              label: '',
            ),
            const SizedBox(height: 24),
            const Text(
              "DESCRIPTION",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            BrutalistTextField(
              controller: txtDeskripsi,
              hint: "Enter todo description",
              label: '',
            ),
            const SizedBox(height: 24),
            const Text(
              "CATEGORY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            BrutalistDropdown(
              value: kategori,
              items: kategoriList,
              hint: "Select category",
              onChanged: (val) => setState(() => kategori = val),
            ),
            const SizedBox(height: 24),
            const Text(
              "PRIORITY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            BrutalistDropdown(
              value: tingkatKepentingan,
              items: tingkatKepentinganList,
              hint: "Select priority",
              onChanged: (val) => setState(() => tingkatKepentingan = val),
            ),
            const SizedBox(height: 40),
            BrutalistButton(
              text: isEditing ? "SAVE CHANGES" : "ADD TODO",
              onPressed: () {
                if (txtJudul.text.isEmpty ||
                    txtDeskripsi.text.isEmpty ||
                    kategori == null ||
                    tingkatKepentingan == null) {
                  // Get.snackbar yang dihapus
                  return;
                }

                if (isEditing) {
                  controller.updateTodo(
                    id: editingId!,
                    judul: txtJudul.text,
                    deskripsi: txtDeskripsi.text,
                    kategori: kategori!,
                    tingkatKepentingan: tingkatKepentingan!,
                  );
                  Get.back(
                    result: "updated",
                  );
                } else {
                  controller.addTodo(
                    judul: txtJudul.text,
                    deskripsi: txtDeskripsi.text,
                    kategori: kategori!,
                    tingkatKepentingan: tingkatKepentingan!,
                  );
                  Get.back(
                    result: "added",
                  );
                }
                Get.offAllNamed(AppRoutes.base);
              },
            ),
          ],
        ),
      ),
    );
  }
}