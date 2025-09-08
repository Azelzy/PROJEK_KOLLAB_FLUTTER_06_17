// file: todo_list.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
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
              direction: DismissDirection.startToEnd,
              onDismissed: (_) {
                todoController.toggleComplete(todo.id, true);
                // Get.snackbar yang dihapus
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
                  // Get.snackbar yang dihapus
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
            BoxShadow(color: Colors.grey, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: IconButton(
          onPressed: () async {
            final result = await Get.toNamed(AppRoutes.todoListEdit);
            if (result == "added") {
              // Get.snackbar yang dihapus
            } else if (result == "updated") {
              // Get.snackbar yang dihapus
            }
          },
          icon: const Icon(Icons.add, color: Colors.white),
          iconSize: 32,
        ),
      ),
    );
  }
}