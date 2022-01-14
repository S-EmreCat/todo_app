import '../../../core/model/task_model.dart';
import '../../../core/utils/dbhelper.dart';

class ViewModelAllTasks {
  DatabaseHelper dbhelper = DatabaseHelper();
  List<Map<String, Object?>>? todos = [];

  loadData() {
    dbhelper
        .getAllTasks()
        .then((value) => todos = value?.cast<Map<String, Object?>>());
  }

  updateData(Todo model) {
    dbhelper.updateIsDone(model);
  }

  deleteAllDone() {
    dbhelper.deleteAllTasks();
  }
}
