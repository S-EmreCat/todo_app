import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/core/model/task_model.dart';

class DatabaseHelper {
  final String _taskManagerableName = "taskmanager";
  String columnid = "id";
  String columntitle = "title";
  String columndesc = "desc";
  String columnDone = "Done";
  late Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "taskmanager.db");
    var notesDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return notesDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_taskManagerableName($columnid TEXT PRIMARY KEY,$columntitle TEXT NOT NULL,$columndesc TEXT NOT NULL,$columnDone INT NOT NULL)');
  }

// tüm db listeye dönüştürme
  Future<List<Todo>> getAllNotes() async {
    Database _database = await database;
    List<Map> todoMaps = await _database.query(_taskManagerableName);
    return todoMaps.map((e) => Todo.fromMap()).toList();
  }

  Future<int> insert(Todo model) async {
    Database _database = await database;
    final todoMaps =
        await _database.insert(_taskManagerableName, model.toMap());
    return todoMaps;
  }

// istenilen id ye göre item sorgusu
  Future<Todo?> getItem(int id) async {
    Database _database = await database;
    final todoMaps = await _database.query(
      _taskManagerableName,
      where: '$columnid = ?',
      columns: [columnid],
      whereArgs: [id],
    );
    if (todoMaps.isNotEmpty) {
      return Todo.fromMap(todoMaps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteList(int id) async {
    Database _database = await database;
    final todoMaps = await _database.delete(
      _taskManagerableName,
      where: '$columnid=?',
      whereArgs: [id],
    );
    return todoMaps;
  }

  Future<void> closedb() async {
    await _database.close();
  }
}
