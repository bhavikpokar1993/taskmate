import 'package:flutter/material.dart';
import '../../domain/entities/task.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggleComplete;

  const TaskDetailScreen({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggleComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Detail'), elevation: 8, // Higher elevation = deeper shadow
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Task Title:', style: Theme.of(context).textTheme.titleMedium),
              Text(task.title, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 12),

              Text('Task Description:', style: Theme.of(context).textTheme.titleMedium),
              Text(task.description, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 12),

              // Text('Due Date:', style: Theme.of(context).textTheme.titleMedium),
              // Text('${task.dueDate.toLocal()}'),
              // const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onToggleComplete,
                      child: Text(task.isCompleted ? 'Mark as Incomplete' : 'Mark as Complete'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onDelete,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              ),
            ],
          )

      ),
    );
  }
}
