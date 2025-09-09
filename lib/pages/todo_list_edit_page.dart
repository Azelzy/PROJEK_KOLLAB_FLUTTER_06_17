import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_edit_page_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';
import 'package:project_17_6/widgets/brutalist_dropdown.dart';

class TodoListEditPage extends StatelessWidget {
  const TodoListEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoListEditPageController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() => Text(controller.isEditing.value ? "EDIT TODO" : "NEW TODO")),
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
              controller: controller.txtJudul,
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
              controller: controller.txtDeskripsi,
              hint: "Enter todo description",
              label: '',
            ),
            const SizedBox(height: 24),
            const Text(
              "CATEGORY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Obx(() => BrutalistDropdown(
              value: controller.kategori.value,
              items: controller.kategoriList,
              hint: "Select category",
              onChanged: controller.updateKategori,
            )),
            const SizedBox(height: 24),
            const Text(
              "PRIORITY",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Obx(() => BrutalistDropdown(
              value: controller.tingkatKepentingan.value,
              items: controller.tingkatKepentinganList,
              hint: "Select priority",
              onChanged: controller.updateTingkatKepentingan,
            )),
            const SizedBox(height: 40),
            Obx(() => BrutalistButton(
              text: controller.isEditing.value ? "SAVE CHANGES" : "ADD TODO",
              onPressed: controller.saveTodo,
            )),
          ],
        ),
      ),
    );
  }
}