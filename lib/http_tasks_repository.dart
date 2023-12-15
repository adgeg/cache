import 'dart:convert';

import 'package:cache/task.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://10.0.2.2:3000';

class TasksRepository {
  Future<List<Task>> loadTasks() async {
    var url = Uri.parse('$baseUrl/tasks');
    final response = await http.get(url);
    return List<Task>
        .from(json.decode(response.body)
        .map(Task.fromJson));
  }
}
