import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _dbHelper = DatabaseHelper._internal();
  final String taskManagerTableName = "taskmanager";
  final String columnid = "id";
  final String columntitle = "title";
  final String columndescription = "description";
  final String columnDay = "day";
  final String columnisDone = "isDone";
  final String columntaskType = "taskType";

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
    var dir = await getDatabasesPath();
    String path = join(dir, taskManagerTableName);
    var dbTodos = await openDatabase(path, version: 1, onCreate: createDb);
    return dbTodos;
  }

  Future createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $taskManagerTableName($columnid INTEGER PRIMARY KEY AUTOINCREMENT,$columntitle TEXT,$columndescription TEXT,$columnDay TEXT,$columntaskType TEXT,$columnisDone INTEGER)');
  }

  /// tüm db listeye dönüştürme
  Future<List<Todo>?> getAllTasks() async {
    var databasec = await database;
    var result = await databasec?.query(taskManagerTableName);
    List<Todo> todoList = [];
    // return result?.map((e) => Todo.fromMap(e)).toList();
    result?.forEach(
      (element) {
        todoList.add(Todo.fromMap(element));
      },
    );

    return todoList.toList();
  }

  Future<int?> getAllCount() async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(await _database
          .rawQuery('SELECT COUNT (*) FROM $taskManagerTableName'));
      return result;
    }
  }

  Future<int?> getCustomTaskCount(String taskType) async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(await _database.rawQuery(
          'SELECT COUNT (*) FROM $taskManagerTableName WHERE $columntaskType =?',
          [taskType]));
      print(result);
      return result;
    }
  }

  // false-true list
  Future<List<Todo>> getAllDoneTasks(bool isDone) async {
    final mapList = await getAllTasks();
    List<Todo> todoList = [];
    mapList?.forEach((element) {
      todoList.add(Todo.fromMap(element.toMap()));
    });
    if (isDone) {
      return todoList.where((element) => !element.isDone).toList();
    } else {
      return todoList.where((element) => element.isDone).toList();
    }
  }

  /// model alıp insert işlemi yapma
  Future insert(Todo model) async {
    Database? _database = await database;
    var todoMaps = await _database?.insert(taskManagerTableName, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
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
      if (todoMaps.isNotEmpty) {
        return Todo.fromMap(todoMaps.first);
      }
    }
  }

  /// today - Tomorrow
  Future<List<Todo>?> getDayTask(String dene) async {
    var databasec = await database;
    var result = await databasec?.query(
      taskManagerTableName,
      where: '$columnDay = ?',
      columns: [],
      whereArgs: [dene],
    );
    List<Todo> todoList = [];
    // return result?.map((e) => Todo.fromMap(e)).toList();
    result?.forEach(
      (element) {
        todoList.add(Todo.fromMap(element));
      },
    );

    return todoList.toList();
  }

  Future<int> updateIsDone(Todo todo) async {
    Database? _database = await database;
    if (_database != null) {
      var todoMaps = await _database.update('todos', todo.toMap(),
          where: '$columnisDone=?', whereArgs: [todo.id]);
      return todoMaps;
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

  Future<int?> deleteAllTasks() async {
    Database? _database = await database;
    var todoMaps = await _database?.delete(taskManagerTableName);
    return todoMaps;
  }

  Future<void> closedb() async {
    await _db?.close();
  }
}
