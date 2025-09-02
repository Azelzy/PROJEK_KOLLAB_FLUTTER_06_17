import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_17_6/controller/todo_controller.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final txtJudul = TextEditingController();
  final txtDeskripsi = TextEditingController();
  final _kategoriList = const ["sekolah", "pekerjaan", "pribadi"];
  String? kategori;

  @override
  Widget build(BuildContext context) {
    final todo = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: txtJudul,
              decoration: const InputDecoration(labelText: "Judul", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: txtDeskripsi,
              maxLines: 3,
              decoration: const InputDecoration(labelText: "Deskripsi", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              value: kategori,
              decoration: const InputDecoration(labelText: "Kategori", border: OutlineInputBorder()),
              items: _kategoriList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) => setState(() => kategori = v),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Simpan"),
                onPressed: () {
                  if ((kategori ?? "").isEmpty || txtJudul.text.isEmpty) {
                    Get.snackbar("Validasi", "Judul dan Kategori wajib diisi");
                    return;
                  }
                  todo.tambahTodo(
                    judul: txtJudul.text,
                    deskripsi: txtDeskripsi.text,
                    kategori: kategori!,
                  );
                  Get.back();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
