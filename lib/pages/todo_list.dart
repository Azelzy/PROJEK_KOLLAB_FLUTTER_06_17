import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/widgets/brutalist_drawer.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const BrutalistDrawer(),
      appBar: AppBar(
        title: const Text("TODO LIST"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        final activeList = todoController.activeList;
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
            return Dismissible(
              key: Key(todo.id),
              direction: DismissDirection.startToEnd, // swipe kanan
              onDismissed: (_) {
                todoController.toggleComplete(todo.id, true);
                Get.snackbar(
                  "UPDATED",
                  "Aktivitas dipindahkan ke HISTORY!",
                  backgroundColor: const Color(0xFF84994F),
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(16),
                );
              },
              background: Container(
                color: Colors.green,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                child: const Icon(Icons.check, color: Colors.white),
              ),
              child: TodoCard(
                todo: todo,
                onChanged: (value) =>
                    todoController.toggleComplete(todo.id, value ?? false),
                onDelete: () {
                  todoController.deleteTodo(todo.id);
                  Get.snackbar(
                    "DELETED",
                    "Aktivitas berhasil dihapus!",
                    backgroundColor: const Color(0xFFB45253),
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(16),
                  );
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            final result = await Get.toNamed(AppRoutes.todoListEdit);
            if (result == "added") {
              Get.snackbar(
                "ADDED",
                "Aktivitas baru berhasil ditambahkan!",
                backgroundColor: const Color(0xFF84994F),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.all(16),
              );
            } else if (result == "updated") {
              Get.snackbar(
                "UPDATED",
                "Aktivitas berhasil diedit!",
                backgroundColor: const Color(0xFF84994F),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.all(16),
              );
            }
          },
          icon: const Icon(Icons.add, color: Colors.white),
          iconSize: 32,
        ),
      ),
    );
  }
}
