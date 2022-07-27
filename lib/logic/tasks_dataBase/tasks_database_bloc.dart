import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/constances/enums.dart';
import 'package:to_do_list/database/tasks_database.dart';
import 'package:to_do_list/models/task_model.dart';

part 'tasks_database_event.dart';
part 'tasks_database_state.dart';

class TasksDatabaseBloc extends Bloc<TasksDatabaseEvent, TasksDatabaseState> {
  TasksDatabaseBloc() : super(TasksDatabaseInital());

  @override
  Stream<TasksDatabaseState> mapEventToState(
    TasksDatabaseEvent event,
  ) async* {
    // retrive tasks //
    if (event is GetAllTasks) {
      yield GettingTasks();
      var tasks;
      if (event.type == TasksType.done) {
        tasks = await TasksCRUD.getAllDoneTasks();
      } else if (event.type == TasksType.notDone) {
        tasks = await TasksCRUD.getAllNotDoneTasks();
      }
      yield TasksLoaded(tasks: tasks);
    }

    // create task //
    if (event is CreateTask) {
      TasksCRUD.createTask(event.task);
    }

    // delete task //
    if (event is DeleteTask) {
      TasksCRUD.deleteTask(event.id);
    }

    // update task //
    if (event is UpdateTask) {
      TasksCRUD.updateTask(event.task);
    }
  }
}
