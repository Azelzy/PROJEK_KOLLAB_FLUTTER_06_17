import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/widgets/brutalist_drawer.dart';

class HistoryPageMobile extends StatelessWidget {
  const HistoryPageMobile({super.key});

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
              "NO COMPLETED TASKS YET(つ╥﹏╥)つ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.grey,
              ),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: const [
                  Icon(Icons.swipe_left, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Swipe left to move back to Todo",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
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
                      child:
                          const Icon(Icons.undo, color: Colors.white),
                    ),
                    child: TodoCard(
                      todo: todo,
                      onChanged: (value) => todoController
                          .toggleComplete(todo.id, value ?? false),
                      onDelete: () =>
                          todoController.deleteTodo(todo.id),
                      isHistoryPage: true,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
