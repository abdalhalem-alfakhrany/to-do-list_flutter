import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/constances/enums.dart';
import 'package:to_do_list/logic/tasks_dataBase/tasks_database_bloc.dart';
import 'package:to_do_list/ui/widgets/task_card.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TasksDatabaseBloc>(context)
        .add(GetAllTasks(type: TasksType.done));
    return Container(
      child: BlocBuilder<TasksDatabaseBloc, TasksDatabaseState>(
        builder: (context, state) {
          print(state);
          if (state is GettingTasks) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TasksLoaded) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) => TaskCard(
                task: state.tasks[index],
              ),
            );
          } else {
            return Center(
              child: Text('error ya ngm'),
            );
          }
        },
      ),
    );
  }
}
