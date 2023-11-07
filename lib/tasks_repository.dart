import 'package:cache/task.dart';

abstract interface class TasksRepository {
  Future<List<Task>> loadTasks();
}