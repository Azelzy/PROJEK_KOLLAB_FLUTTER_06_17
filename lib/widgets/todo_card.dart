import 'package:flutter/material.dart';
import 'package:project_17_6/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback onDelete;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: todo.selesai,
          onChanged: onChanged,
        ),
        title: Text(todo.judul),
        subtitle: Text("${todo.deskripsi}\nKategori: ${todo.kategori}"),
        isThreeLine: true,
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
