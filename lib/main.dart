import 'package:cache/dio_tasks_repository.dart';
import 'package:cache/resolution_page.dart';
import 'package:cache/tasks_page.dart';
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
    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.forceCache,
        ),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0E2356)),
        useMaterial3: true,
      ),
      //home: TasksPage(HttpTasksRepository()),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            '2024 resolutions',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ResolutionListPage(),
      )
    );
  }
}
