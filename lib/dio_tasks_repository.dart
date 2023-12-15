import 'package:cache/task.dart';
import 'package:dio/dio.dart';

const baseUrl = 'http://10.0.2.2:3000';

class DioTasksRepository {
  final Dio _dio;

  DioTasksRepository(this._dio);

  Future<List<Task>> loadTasks() async {
    var url = '$baseUrl/tasks';
    final response = await _dio.get(url);
    return List<Task>.from(response.data.map(Task.fromJson));
  }
}
