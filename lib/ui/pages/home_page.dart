import 'package:flutter/material.dart';
import 'package:to_do_list/ui/pages/settings_page.dart';
import 'package:to_do_list/ui/screens/done_tasks_screen.dart';
import 'package:to_do_list/ui/screens/not_done_tasks_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'To Do List',
          ),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.check_box_outline_blank_sharp)),
              Tab(icon: Icon(Icons.check_box))
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            NotDoneTasks(),
            DoneTasks(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, 'create-task/'),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
