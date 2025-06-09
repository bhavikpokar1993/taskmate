import '../../domain/entities/task.dart';

class TaskLocalDataSource {
  final List<Task> _storage = [];

  Future<List<Task>> getTasks() async => _storage;

  Future<void> addTask(Task task) async {
    _storage.add(task);
  }

  Future<void> deleteTask(int id) async {
    _storage.removeWhere((task) => task.id == id);
  }

  Future<void> updateTask(Task updatedTask) async {
    final index = _storage.indexWhere((t) => t.id == updatedTask.id);
    if (index != -1) _storage[index] = updatedTask;
  }
}
