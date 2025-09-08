import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/widgets/brutalist_drawer.dart';
import 'package:project_17_6/widgets/brutalist_button.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();
    final RxInt currentTab = 0.obs;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const BrutalistDrawer(),
      appBar: AppBar(
        title: const Text("TODO LIST"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => BrutalistButton(
                      text: "TO DO",
                      onPressed: () => currentTab.value = 0,
                      backgroundColor: currentTab.value == 0
                          ? Colors.black
                          : Colors.white,
                      textColor: currentTab.value == 0
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Obx(
                    () => BrutalistButton(
                      text: "HISTORY",
                      onPressed: () => currentTab.value = 1,
                      backgroundColor: currentTab.value == 1
                          ? Colors.black
                          : Colors.white,
                      textColor: currentTab.value == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => currentTab.value == 0
                  ? _buildActiveList(todoController)
                  : _buildHistoryList(todoController),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: IconButton(
          onPressed: () => Get.toNamed(AppRoutes.todoListEdit),
          icon: const Icon(Icons.add, color: Colors.white),
          iconSize: 32,
        ),
      ),
    );
  }

  Widget _buildActiveList(TodoController controller) {
    return Obx(() {
      final activeList = controller.activeList;
      if (activeList.isEmpty) {
        return const Center(
          child: Text(
            "NO ACTIVE TASKS",
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
        itemCount: activeList.length,
        itemBuilder: (context, index) {
          final todo = activeList[index];
          return TodoCard(
            todo: todo,
            onChanged: (value) {
              controller.toggleComplete(todo.id, value ?? false);
              if (value ?? false) {
                Get.snackbar(
                  "UPDATED",
                  "Aktivitas telah dilaksanakan!",
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
    });
  }

  Widget _buildHistoryList(TodoController controller) {
    return Obx(() {
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
              controller.toggleComplete(todo.id, value ?? false);
              if (!(value ?? true)) {
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
    });
  }
}
