import 'package:cache/task.dart';
import 'package:cache/tasks_repository.dart';
import 'package:dio/dio.dart';

class DioTasksRepository implements TasksRepository {
  final Dio _dio;

  DioTasksRepository(this._dio);

  @override
  Future<List<Task>> loadTasks() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await _dio.get('http://10.0.2.2:3000/tasks');
      return List<Task>.from(response.data.map((task) => Task.fromJson(task)));
    } catch (_) {}
    return [];
  }
}
