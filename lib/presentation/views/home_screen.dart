import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import '../viewmodels/task_view_model.dart';
import 'add_task_screen.dart';
import 'task_detail_screen.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(title: Text('TaskMate'), elevation: 8, // Higher elevation = deeper shadow
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,),
      body: ListView(
        children: taskList
            .map((task) => TaskTile(
          title: task.title,
          isDone: task.isCompleted,
          onTap: () {
            // Navigate to Task Detail Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TaskDetailScreen(
                  task: task,
                  onDelete: () {
                    ref.read(taskListProvider.notifier).deleteTask(task.id);
                    Navigator.pop(context);
                  },
                  onToggleComplete: () {
                    final updatedTask =
                    task.copyWith(isCompleted: !task.isCompleted);
                    ref.read(taskListProvider.notifier).updateTask(updatedTask);
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
          onDelete: () => ref.read(taskListProvider.notifier).deleteTask(task.id),
        ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddTaskScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
