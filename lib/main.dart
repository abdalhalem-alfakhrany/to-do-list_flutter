import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/logic/tasks_dataBase/tasks_database_bloc.dart';
import 'package:to_do_list/ui/router/app_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TasksDatabaseBloc>(
      create: (context) => TasksDatabaseBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        onGenerateRoute: AppRouter.onGenerate,
      ),
    );
  }
}
