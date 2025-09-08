import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';
import 'package:project_17_6/widgets/todo_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("HISTORY"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        final completedList = controller.completedList;
        if (completedList.isEmpty) {
          return const Center(
            child: Text(
              "NO COMPLETED TASKS",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.grey,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: completedList.length,
          itemBuilder: (context, index) {
            final todo = completedList[index];
            return TodoCard(
              todo: todo,
              onChanged: (value) {
                if (!(value ?? true)) {
                  controller.toggleComplete(todo.id, false);
                  Get.snackbar(
                    "UPDATED",
                    "Aktivitas dikembalikan ke daftar aktif!",
                    backgroundColor: const Color(0xFF84994F),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                  );
                }
              },
              onDelete: () {
                controller.deleteTodo(todo.id);
                Get.snackbar(
                  "DELETED",
                  "Aktivitas berhasil dihapus!",
                  backgroundColor: const Color(0xFFB45253),
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(16),
                );
              },
            );
          },
        );
      }),
    );
  }
}
