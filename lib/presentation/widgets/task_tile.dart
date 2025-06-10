import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String title;
  final bool isDone;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const TaskTile({
    required this.title,
    required this.isDone,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:GestureDetector(
        onTap:onTap,
        child: Text(
          title,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
      leading: IconButton(
        icon: Icon(
            isDone ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isDone ? Colors.green : null),
        onPressed: onTap,
      ),
      trailing: onDelete != null
          ? IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: onDelete,
      )
          : null,
    );
  }
}
