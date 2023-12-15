import 'package:cache/dio_tasks_repository.dart';
import 'package:cache/task.dart';
import 'package:flutter/material.dart';

class TasksPage extends StatefulWidget {
  final DioTasksRepository _repository;

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
        title: const Text(
          'Simple HTTP cache',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<Task>>(
        future: widget._repository.loadTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              final data = snapshot.data!;
              return RefreshIndicator.adaptive(
                onRefresh: () async => setState(() {}),
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final task = data[index];
                    return ItemTile(task);
                  },
                ),
              );
            } else {
              return _TopThird(_ErrorMessage(() => setState(() {})));
            }
          } else {
            return _TopThird(CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class ItemTile extends StatefulWidget {
  const ItemTile(this.task);

  final Task task;

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  bool isChecked = false;

  @override
  void initState() {
    isChecked = widget.task.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.content),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  final VoidCallback onPressed;

  const _ErrorMessage(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wifi_off, size: 42, color: Colors.red),
        const SizedBox(height: 16),
        const Text('Unable to load data', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 16),
        OutlinedButton(
          onPressed: onPressed,
          child: const Text('Retry', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}

class _TopThird extends StatelessWidget {
  final Widget child;

  const _TopThird(this.child);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Center(child: child)),
        Expanded(child: SizedBox.shrink()),
        Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
