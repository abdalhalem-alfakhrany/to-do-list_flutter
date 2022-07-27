import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task_model.dart';

class TasksDataBase {
  static final TasksDataBase instance = TasksDataBase._init();

  static Database? _database;

  TasksDataBase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = '/';
    final path = join(dbPath, 'tasks.db');

    return await openDatabase(path, version: 2, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'REAL NOT NULL';

    db.execute('''
      CREATE TABLE $tasksTable (
        ${TaskFields.id} $idType,
        ${TaskFields.title} $textType,
        ${TaskFields.description} $textType,
        ${TaskFields.done} $boolType
      )
      ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

class TasksCRUD {
  static getAllDoneTasks() async {
    final db = await TasksDataBase.instance.database;

    final data = await db.query(
      tasksTable,
      where: '${TaskFields.done} = ?',
      whereArgs: ['t'],
    );
    print(data);
    return data.map((json) => Task.fromJson(json)).toList();
  }

  static getAllNotDoneTasks() async {
    final db = await TasksDataBase.instance.database;

    final data = await db.query(
      tasksTable,
      // where: '${TaskFields.done} = ?',
      // whereArgs: ['f'],
    );
    print(data);
    return data.map((json) => Task.fromJson(json)).toList();
  }

  static createTask(Task task) async {
    final db = await TasksDataBase.instance.database;
    print(await db.insert(tasksTable, task.toJson()));
  }

  static deleteTask(int id) async {
    final db = await TasksDataBase.instance.database;
    await db.delete(
      tasksTable,
      where: '${TaskFields.id} = $id',
    );
  }

  static updateTask(Task task) async {
    final db = await TasksDataBase.instance.database;
    await db.update(
      tasksTable,
      task.toJson(),
      where: '${TaskFields.id} = ${task.id}',
    );
  }
}
