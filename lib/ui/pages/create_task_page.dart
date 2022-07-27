import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/logic/tasks_dataBase/tasks_database_bloc.dart';
import 'package:to_do_list/models/task_model.dart';

// ignore: must_be_immutable
class CreateTaskPage extends StatefulWidget {
  @override
  _CreateTaskPageState createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  String title = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'title',
              ),
            ),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'description',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<TasksDatabaseBloc>(context).add(
                CreateTask(
                  task: Task(title: title, description: description),
                ),
              );
            },
            child: Text(
              'Submit',
            ),
          ),
        ],
      ),
    );
  }
}
