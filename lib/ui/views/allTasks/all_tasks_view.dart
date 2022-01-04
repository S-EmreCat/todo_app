import 'package:flutter/material.dart';
import '../addTask/add_task.view.dart';
import 'all_tasks_service.dart';

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
  ViewModelAllTasks deneme3 = ViewModelAllTasks();

  @override
  void initState() {
    super.initState();
  }

  late var deneme2 = deneme3.todos;

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
          Expanded(
            flex: 15,
            child: Padding(
              padding: const CustomPadding.all(),
              child: TaskList(todos: deneme2),
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
            flex: 8,
            child: Padding(
              padding: const CustomPadding.all(),
              child: TaskList(todos: deneme2),
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
      onPressed: () {},
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
