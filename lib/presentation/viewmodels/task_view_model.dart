import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';

final taskListProvider = StateNotifierProvider<TaskViewModel, List<Task>>(
      (ref) => TaskViewModel(),
);

class TaskViewModel extends StateNotifier<List<Task>> {
  TaskViewModel() : super([]);

  void addTask(Task task) {
    state = [...state, task];
  }

  void toggleTask(int id) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            title: task.title,
            description: task.description,
            dueDate: task.dueDate,
            isCompleted: !task.isCompleted,
          )
        else
          task
    ];
  }

  void updateTask(Task updatedTask) {
    state = [
      for (final task in state)
        if (task.id == updatedTask.id) updatedTask else task
    ];
  }

  void deleteTask(int id) {
    state = state.where((task) => task.id != id).toList();
  }
}