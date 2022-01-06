import 'package:todo_app/core/model/task_model.dart';

import '../../../core/utils/dbhelper.dart';

class ViewModelAddTask {
  DatabaseHelper dbhelper = DatabaseHelper();
  List<Map<String, Object?>>? todos = [];

  insertData(Todo model) {
    dbhelper.insert(model);
  }
}
