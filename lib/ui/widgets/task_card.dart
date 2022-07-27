import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/models/task_model.dart';

// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  Task task;
  TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: .5, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Slidable(
        actionExtentRatio: .2,
        actions: [
          IconSlideAction(
            color: Colors.green[200],
            caption: 'Done',
            icon: Icons.done,
          ),
          IconSlideAction(
            color: Colors.yellow[200],
            caption: 'Edit',
            icon: Icons.edit,
          ),
        ],
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            caption: 'Delete',
            icon: Icons.delete,
          ),
        ],
        actionPane: SlidableStrechActionPane(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(fontSize: 35),
            ),
            Text(task.description),
          ],
        ),
      ),
    );
  }
}
