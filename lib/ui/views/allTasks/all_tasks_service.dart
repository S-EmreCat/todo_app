import 'package:todo_app/core/model/task_model.dart';
import 'package:todo_app/core/utils/dbhelper.dart';

class ViewModelAllTasks {
  DatabaseHelper dbhelper = DatabaseHelper();
  List<Map<String, Object?>>? todos = [];

  loadData() {
    dbhelper.getAllTasks().then((value) => todos = value);
  }

  updateData(Todo model) {
    dbhelper.updateIsDone(model);
  }

  deleteAllDoneData() {
    dbhelper.deleteDone();
  }
}
