import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/dbhelper.dart';
import '../addTask/add_task.view.dart';

import '../../../core/constant/string_constants.dart';
import '../../widgets/icon/custom_list_tile_icon.dart';
import '../../widgets/listView/listview_builder.dart';
import '../../widgets/padding/padding.dart';
import '../../widgets/text/green_titles_text_widget.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late DatabaseHelper _dbhelper;

  @override
  void initState() {
    _dbhelper = DatabaseHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //print(deneme2.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.taskNameAll),
        actions: [
          clearCompletedButton(),
        ],
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
          const Expanded(
            flex: 15,
            child: Padding(
              padding: CustomPadding.all(),
              child: TaskList(),
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
          const Expanded(
            flex: 8,
            child: Padding(
              padding: CustomPadding.all(),
              child: TaskList(),
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
        );
      },
      heroTag: null,
    );
  }

  ElevatedButton clearCompletedButton() {
    return ElevatedButton(
      onPressed: () async {
        await _dbhelper.deleteDone();
        setState(() {});
      },
      child: Row(
        children: const [
          CustomListTileIcon(
            isDone: true,
          ),
          Text(StringConstants.clearCompleted),
        ],
      ),
    );
  }
}
