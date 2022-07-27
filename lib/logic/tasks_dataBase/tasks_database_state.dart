part of 'tasks_database_bloc.dart';

@immutable
abstract class TasksDatabaseState {}

class TasksDatabaseInital extends TasksDatabaseState {}

class GettingTasks extends TasksDatabaseState {}

// ignore: must_be_immutable
class TasksLoaded extends TasksDatabaseState {
  List<Task> tasks;
  TasksLoaded({
    required this.tasks,
  });
}
