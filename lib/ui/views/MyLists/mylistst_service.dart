import '../../../core/model/task_model.dart';
import '../../../core/utils/dbhelper.dart';

class ViewModelMyLists {
  final DatabaseHelper _dbhelper = DatabaseHelper();
  List<Map<String, Object?>>? todos = [];

  Future loadData() async {
    return await _dbhelper
        .getAllTasks()
        .then((value) => todos = value?.cast<Map<String, Object?>>());
  }

  Future<int?> getallTaskCount() async {
    return await _dbhelper.getAllCount();
  }

  Future<int?> getCustomCount(String taskType) async {
    return await _dbhelper.getCustomTaskCount(taskType);
  }

  // Future<int> getAllCount() async {
  //   countAll = await _dbhelper.getAllCount();
  //   return countAll;
  // }

  Future<int> updateData(Todo model) async {
    return _dbhelper.updateIsDone(model);
  }

  Future<int?> deleteAllDone() async {
    return _dbhelper.deleteAllTasks();
  }
}
