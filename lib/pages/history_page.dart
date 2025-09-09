import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/widgets/brutalist_drawer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const BrutalistDrawer(),
      appBar: AppBar(
        title: const Text("HISTORY"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Obx(() {
        final completedList = todoController.completedList;
        if (completedList.isEmpty) {
          return const Center(
            child: Text(
              "NO COMPLETED TASKS YET",
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
            return Dismissible(
              key: Key(todo.id),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                todoController.toggleComplete(todo.id, false);
              },
              background: Container(
                color: Colors.orange,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.undo, color: Colors.white),
              ),
              child: TodoCard(
                todo: todo,
                onChanged: (value) =>
                    todoController.toggleComplete(todo.id, value ?? false),
                onDelete: () => todoController.deleteTodo(todo.id),
                isHistoryPage: true,
              ),
            );
          },
        );
      }),
    );
  }
}
