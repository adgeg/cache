enum Status {
  todo,
  doing,
  done;

  static Status fromString(String status) {
    return switch (status) {
      'TO_DO' => Status.todo,
      'DOING' => Status.doing,
      _ => Status.done,
    };
  }
}

class Task {
  final String id;
  final String content;
  final Status status;

  const Task(this.id, this.content, this.status);

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['id'],
      json['content'],
      Status.fromString(json['status']),
    );
  }
}

extension TaskExt on Task {
  bool get isCompleted => status == Status.done;
}
