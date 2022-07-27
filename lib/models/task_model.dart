final String tasksTable = 'tasks';

class TaskFields {
  static final String id = '_id';
  static final String title = 'title';
  static final String description = 'description';
  static final String done = 'done';
}

class Task {
  final int? id;
  String title;
  String description;
  bool done = false;
  Task({
    this.id,
    required this.title,
    required this.description,
  });
  Task.fromJson(Map<String, dynamic> json)
      : id = json[TaskFields.id],
        title = json[TaskFields.title],
        description = json[TaskFields.description];
  toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.description: description,
        TaskFields.done: 0,
      };
}
