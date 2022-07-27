part of 'tasks_database_bloc.dart';

@immutable
abstract class TasksDatabaseEvent {}

// ignore: must_be_immutable
class GetAllTasks extends TasksDatabaseEvent {
  TasksType type;
  GetAllTasks({
    required this.type,
  });
}

// ignore: must_be_immutable
class CreateTask extends TasksDatabaseEvent {
  Task task;
  CreateTask({
    required this.task,
  });
}

// ignore: must_be_immutable
class GetTask extends TasksDatabaseEvent {
  int id;
  GetTask({
    required this.id,
  });
}

// ignore: must_be_immutable
class DeleteTask extends TasksDatabaseEvent {
  int id;
  DeleteTask({
    required this.id,
  });
}

// ignore: must_be_immutable
class UpdateTask extends TasksDatabaseEvent {
  Task task;
  UpdateTask({
    required this.task,
  });
}
