import 'dart:convert';

import 'package:cache/task.dart';
import 'package:cache/tasks_repository.dart';
import 'package:http/http.dart' as http;

class HttpTasksRepository implements TasksRepository {
  @override
  Future<List<Task>> loadTasks() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:3000/tasks'));
      return List<Task>.from(json.decode(response.body).map((task) => Task.fromJson(task)));
    } catch (_) {}
    return [];
  }
}
