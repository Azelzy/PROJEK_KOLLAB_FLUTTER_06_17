import 'package:flutter/material.dart';
import 'package:project_17_6/models/todo_model.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  final ValueChanged<bool?>? onChanged;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final bool isHistoryPage;

  const TodoCard({
    super.key,
    required this.todo,
    required this.onChanged,
    this.onDelete,
    this.onEdit,
    required this.isHistoryPage,
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
    final textColor = _getTextColor();

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
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: todo.selesai
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(
              "${todo.deskripsi}\n${todo.kategori.toUpperCase()} • ${todo.tingkatKepentingan.toUpperCase()}",
              style: TextStyle(
                color: textColor.withOpacity(0.8),
                height: 1.5,
                decoration: todo.selesai
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: Icon(
                isHistoryPage ? Icons.delete_outline : Icons.edit_outlined,
                color: textColor,
                size: 28,
              ),
              onPressed: isHistoryPage
                  ? () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black, width: 4),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(8, 8),
                                  blurRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Header
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(20),
                                  color: Colors.black,
                                  child: const Text(
                                    "KONFIRMASI",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // Content
                                Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: const Text(
                                    "YAKIN INGIN MENGHAPUS TODO INI?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // Buttons
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFB45253),
                                            border: Border.all(color: Colors.black, width: 3),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(4, 4),
                                                blurRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () => Navigator.pop(context),
                                              child: const Center(
                                                child: Text(
                                                  "EH GJDI",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF84994F),
                                            border: Border.all(color: Colors.black, width: 3),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black,
                                                offset: Offset(4, 4),
                                                blurRadius: 0,
                                              ),
                                            ],
                                          ),
                                          child: Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                                if (onDelete != null) {
                                                  onDelete!();
                                                }
                                              },
                                              child: const Center(
                                                child: Text(
                                                  "YA!",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  : onEdit,
            ),
          ),
        ),
      ),
    );
  }
}