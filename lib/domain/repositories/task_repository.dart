import '../entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTasks();
  Future<void> deleteTask(int id);
  Future<void> updateTask(Task task);
}