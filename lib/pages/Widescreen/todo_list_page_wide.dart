import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_list_page_controller.dart';
import 'package:project_17_6/Routes/routes.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/widgets/brutalist_drawer.dart';

class TodoListPageWide extends StatelessWidget {
  const TodoListPageWide({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find<TodoController>();

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const BrutalistDrawer(),
      appBar: AppBar(
        title: const Text(
          "TODO LIST",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final activeList = todoController.activeList;

            if (activeList.isEmpty) {
              return const Center(
                child: Text(
                  "NO TASKS YET◝(ᵔᗜᵔ)◜",
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
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 12, top: 4),
                  child: Row(
                    children: const [
                      Icon(Icons.swipe_right, color: Colors.grey, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "Swipe right to mark as done",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      bool isWide = constraints.maxWidth > 500;

                      return GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isWide ? 2 : 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: isWide ? 2.8 : 3.2,
                        ),
                        itemCount: activeList.length,
                        itemBuilder: (context, index) {
                          final todo = activeList[index];

                          return Dismissible(
                            key: Key(todo.id),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (_) {
                              todoController.toggleComplete(todo.id, true);
                            },
                            background: Container(
                              color: Colors.green,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 20),
                              child: const Icon(Icons.check,
                                  color: Colors.white),
                            ),
                            child: TodoCard(
                              todo: todo,
                              onChanged: (value) => todoController
                                  .toggleComplete(todo.id, value ?? false),
                              onEdit: () => Get.toNamed(
                                  AppRoutes.todoListEdit,
                                  arguments: todo.id),
                              isHistoryPage: false,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: const [
            BoxShadow(color: Colors.grey, offset: Offset(4, 4), blurRadius: 0),
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
}
