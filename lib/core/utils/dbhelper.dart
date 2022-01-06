import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _dbHelper = DatabaseHelper._internal();
  final String taskManagerTableName = "taskmanager7";
  String columnid = "id";
  String columntitle = "title";
  String columndescription = "description";
  String columnDay = "day";
  String columnisDone = "isDone";
  String columntaskType = "taskType";

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
        'CREATE TABLE $taskManagerTableName($columnid INTEGER PRIMARY KEY,$columntitle TEXT,$columndescription TEXT ,$columnDay TEXT ,$columntaskType TEXT $columnisDone BOOLEAN )');
  }

  /// tüm db listeye dönüştürme
  Future<List<Todo>?> getAllTasks() async {
    var databasec = await database;
    var result = await databasec?.query(taskManagerTableName);
    return result?.map((e) => Todo.fromMap(e)).toList();
  }

  Future<int?> getAllCount(String taskType) async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(await _database
          .rawQuery("SELECT COUNT (*) FROM $taskManagerTableName"));
      return result;
    }
  }

  Future<int?> getCustomTaskCount(String taskType) async {
    Database? _database = await database;
    if (_database != null) {
      var result = Sqflite.firstIntValue(
        await _database.rawQuery(
            "SELECT COUNT (*) FROM $taskManagerTableName where $columntaskType=$taskType"),
      );
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

  Future<int?> deleteDone() async {
    Database? _database = await database;
    var todoMaps = await _database?.delete(
      taskManagerTableName,
      where: '$columnisDone=?',
      whereArgs: [true],
    );
    return todoMaps;
  }

  Future<void> closedb() async {
    await _db?.close();
  }
}
