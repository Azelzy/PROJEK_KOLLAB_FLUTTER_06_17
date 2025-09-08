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

  Color _getPriorityColor() {
    switch (todo.tingkatKepentingan.toLowerCase()) {
      case 'urgent':
        return const Color(0xFFB45253);
      case 'high':
        return const Color(0xFFFCB53B);
      case 'normal':
        return const Color(0xFFFFE797);
      case 'low':
        return const Color(0xFF84994F);
      default:
        return Colors.grey;
    }
  }

  Color _getTextColor() {
    switch (todo.tingkatKepentingan.toLowerCase()) {
      case 'urgent':
      case 'high':
      case 'low':
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: _getPriorityColor(),
          border: Border.all(color: Colors.black, width: 3),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: todo.selesai,
                onChanged: onChanged,
                fillColor: WidgetStateProperty.all(Colors.black),
                checkColor: _getPriorityColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
            title: Text(
              todo.judul,
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "${todo.deskripsi}\n${todo.kategori.toUpperCase()} • ${todo.tingkatKepentingan.toUpperCase()}",
              style: TextStyle(
                color: _getTextColor().withOpacity(0.8),
                height: 1.5,
              ),
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: _getTextColor(),
                size: 28,
              ),
              onPressed: onDelete,
            ),
          ),
        ),
      ),
    );
  }
}
