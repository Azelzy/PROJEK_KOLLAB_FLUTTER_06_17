import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_edit_page_controller.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';
import 'package:project_17_6/widgets/brutalist_textfield.dart';
import 'package:project_17_6/widgets/brutalist_dropdown.dart';

class TodoListEditPageWide extends StatelessWidget {
  const TodoListEditPageWide({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoListEditPageController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Obx(() => Text(
          controller.isEditing.value ? "EDIT TODO" : "NEW TODO",
        )),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Tentukan apakah layar lebar atau tidak
              bool isWide = constraints.maxWidth > 600;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isWide ? 2 : 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: isWide ? 2.8 : 2.0,
                      ),
                      children: [
                        // TITLE
                        BrutalistTextField(
                          controller: controller.txtJudul,
                          hint: "Enter todo title",
                          label: 'TITLE',
                        ),

                        // DESCRIPTION
                        BrutalistTextField(
                          controller: controller.txtDeskripsi,
                          hint: "Enter todo description",
                          label: 'DESCRIPTION',
                        ),

                        // CATEGORY
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CATEGORY",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Obx(() => BrutalistDropdown(
                              value: controller.kategori.value,
                              items: controller.kategoriList,
                              hint: "Select category",
                              onChanged: controller.updateKategori,
                            )),
                          ],
                        ),

                        // PRIORITY
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "PRIORITY",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Obx(() => BrutalistDropdown(
                              value: controller.tingkatKepentingan.value,
                              items: controller.tingkatKepentinganList,
                              hint: "Select priority",
                              onChanged: controller.updateTingkatKepentingan,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // BUTTON di bawah grid
                  Obx(() => BrutalistButton(
                    text: controller.isEditing.value
                        ? "SAVE CHANGES"
                        : "ADD TODO",
                    onPressed: controller.saveTodo,
                  )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
