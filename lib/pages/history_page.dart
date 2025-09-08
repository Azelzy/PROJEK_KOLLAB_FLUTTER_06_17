import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';
import 'package:project_17_6/widgets/todo_card.dart';

class HistoryPage extends GetView<TodoController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("History")),
      body: Obx(() {
        final list = controller.selesaiList;
        if (list.isEmpty) return const Center(child: Text("Belum ada todo selesai."));
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
    );
  }
}