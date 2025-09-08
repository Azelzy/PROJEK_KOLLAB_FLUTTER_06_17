import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';
import 'package:project_17_6/widgets/todo_card.dart';
import 'package:project_17_6/Routes/routes.dart';

class HomePage extends GetView<TodoController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo Home")),
      body: Obx(() {
        final list = controller.aktifList;
        if (list.isEmpty) {
          return const Center(child: Text("Belum ada todo. Tekan + untuk menambah."));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: list.length,
          itemBuilder: (_, i) {
            final t = list[i];
            return TodoCard(
              todo: t,
              onChanged: (val) => controller.toggleSelesai(t.id, val ?? false),
              onDelete: () => controller.hapus(t.id),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add),
      ),
    );
  }
}