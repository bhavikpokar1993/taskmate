import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/task_local_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTask(Task task) => localDataSource.addTask(task);

  @override
  Future<void> deleteTask(int id) => localDataSource.deleteTask(id);

  @override
  Future<List<Task>> getTasks() => localDataSource.getTasks();

  @override
  Future<void> updateTask(Task task) => localDataSource.updateTask(task);
}
