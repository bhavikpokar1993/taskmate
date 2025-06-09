import 'package:get_it/get_it.dart';

import 'data/data_sources/task_local_data_source.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/usecases/add_task.dart';
import 'domain/usecases/delete_task.dart';
import 'domain/usecases/get_tasks.dart';
import 'domain/usecases/update_task.dart';
import 'domain/repositories/task_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<TaskLocalDataSource>(() => TaskLocalDataSource());

  // Repositories
  sl.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetTasks(sl()));
  sl.registerLazySingleton(() => AddTask(sl()));
  sl.registerLazySingleton(() => DeleteTask(sl()));
  sl.registerLazySingleton(() => UpdateTask(sl()));
}
