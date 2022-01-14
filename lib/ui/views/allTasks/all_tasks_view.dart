import 'package:flutter/material.dart';

import '../../../core/constant/string_constants.dart';
import '../../../core/utils/dbhelper.dart';
import '../../widgets/icon/custom_list_tile_icon.dart';
import '../../widgets/listView/custom_task_list_builder.dart';
import '../../widgets/padding/padding.dart';
import '../../widgets/text/green_titles_text_widget.dart';
import '../addTask/add_task.view.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late DatabaseHelper _dbhelper;
  @override
  void initState() {
    super.initState();
    _dbhelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.taskNameAll),
        actions: [clearCompletedButton(), refleshData()],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListTile(
              trailing: floatingButtonAdd(),
              title: const GreenTitles(
                textString: StringConstants.today,
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: const CustomPadding.all(),
              child: TaskList(
                myFuture: _dbhelper.getDayTask('today'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              trailing: floatingButtonAdd(),
              title: const GreenTitles(
                textString: StringConstants.tomorrow,
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: const CustomPadding.all(),
              child: TaskList(
                myFuture: _dbhelper.getDayTask('Tomorrow'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton floatingButtonAdd() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      backgroundColor: Colors.green[600],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskView()),
        ).then((value) => setState(() {}));
      },
      heroTag: null,
    );
  }

  ElevatedButton refleshData() {
    return ElevatedButton(
      onPressed: () async {
        setState(() {});
      },
      child: Row(
        children: const [
          Text('Reflesh'),
        ],
      ),
    );
  }

  ElevatedButton clearCompletedButton() {
    return ElevatedButton(
      onPressed: () async {
        _dbhelper.deleteAllTasks().then((value) => setState(() {}));
      },
      child: Row(
        children: const [
          CustomListTileIcon(
            isDone: true,
          ),
          Text(StringConstants.clearAll),
        ],
      ),
    );
  }
}
