import 'package:cache/dio_tasks_repository.dart';
import 'package:cache/task.dart';
import 'package:cache/tasks_repository.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.interceptors.add(DioCacheInterceptor(options: CacheOptions(store: MemCacheStore())));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0E2356)),
        useMaterial3: true,
      ),
      //home: TasksPage(HttpTasksRepository()),
      home: TasksPage(DioTasksRepository(dio)),
    );
  }
}

class TasksPage extends StatefulWidget {
  final TasksRepository _repository;

  TasksPage(this._repository);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Simple HTTP cache', style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<List<Task>>(
        future: widget._repository.loadTasks(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].id),
                subtitle: Text(data[index].content),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => setState(() {}),
        child: const Icon(Icons.refresh, color: Colors.white,),
      ),
    );
  }
}
