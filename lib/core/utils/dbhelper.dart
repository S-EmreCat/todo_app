import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/core/model/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _dbHelper = DatabaseHelper._internal();
  final String taskManagerTableName = "taskmanager";
  String columnid = "id";
  String columntitle = "title";
  String columndescription = "desc";
  String columnDay = "day";
  String columnDone = "done";

  DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _dbHelper;
  }
  static Database? _db;
  Future<Database?> get database async {
    if (_db == null) {
      _db = await initializeDatabase();
    } else {
      return _db;
    }
  }

  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "taskmanager.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: createDb);
    return dbTodos;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskManagerTableName($columnid INT PRIMARY KEY,$columntitle TEXT,$columndescription TEXT ,$columnDay TEXT ,$columnDone INT )');
  }

  /// tüm db listeye dönüştürme
  Future<List<Map<String, Object?>>?> getAllTasks() async {
    Database? _database = await database;
    return await _database?.query('taskmanager');
  }

  Future<int?> getAllCount(String taskType) async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(await _database
          .rawQuery("SELECT COUNT (*) FROM $taskManagerTableName"));
      return result;
    }
  }

  Future<int?> getTaskCount(String taskType) async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(await _database
          .rawQuery("SELECT COUNT (*) FROM $taskManagerTableName"));
      return result;
    }
  }

  /// false-true list
  Future<List<Todo>> getAllDoneTasks(bool isDone) async {
    final mapList = await getAllTasks();
    List<Todo> todoList = [];
    mapList?.forEach((element) {
      todoList.add(Todo.fromMap(element));
    });
    if (isDone) {
      return todoList.where((element) => !element.isDone!).toList();
    } else {
      return todoList.where((element) => element.isDone!).toList();
    }
  }

  /// model alıp insert işlemi yapma
  Future<int?> insert(Todo model) async {
    Database? _database = await database;
    var todoMaps = await _database?.insert(taskManagerTableName, model.toMap());
    return todoMaps;
  }

  /// istenilen id ye göre select sorgusu
  Future<Todo?> getItem(int id) async {
    Database? _database = await database;
    var todoMaps = await _database?.query(
      taskManagerTableName,
      where: '$columnid = ?',
      columns: [columnid],
      whereArgs: [id],
    );
    if (todoMaps != null) {
      if (todoMaps.isEmpty) {
        return Todo.fromMap(todoMaps.first);
      } else {
        return null;
      }
    }
  }

  Future<int> updateIsDone(Todo todo) async {
    Database? _database = await database;
    if (_database != null) {
      return await _database.update('todos', todo.toMap(),
          where: 'columnDone=?', whereArgs: [todo.id]);
    } else {
      throw ('db is null');
    }
  }

  /// istenilen id ye göre delete
  Future<int?> deleteItem(int id) async {
    Database? _database = await database;
    var todoMaps = await _database?.delete(
      taskManagerTableName,
      where: '$columnid=?',
      whereArgs: [id],
    );
    return todoMaps;
  }

  Future<int?> deleteDone() async {
    Database? _database = await database;
    var todoMaps = await _database?.delete(
      taskManagerTableName,
      where: '$columnDone=?',
      whereArgs: [true],
    );
    return todoMaps;
  }

  Future<void> closedb() async {
    await _db?.close();
  }
}
