import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/ui/pages/create_task_page.dart';
import 'package:to_do_list/ui/pages/edit_task_page.dart';
import 'package:to_do_list/ui/pages/home_page.dart';
import 'package:to_do_list/ui/pages/settings_page.dart';

class AppRouter {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case 'settings/':
        return MaterialPageRoute(
          builder: (context) => SettingsPage(),
        );
      case 'create-task/':
        return MaterialPageRoute(
          builder: (context) => CreateTaskPage(),
        );
      case 'edit-task/':
        return MaterialPageRoute(
          builder: (context) => EditTaskPage(),
        );
      default:
        return _errorRoutePage(settings.name);
    }
  }

  static Route _errorRoutePage(String? name) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'no route named $name',
            style: TextStyle(fontSize: 40, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
