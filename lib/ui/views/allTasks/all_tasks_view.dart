import 'package:flutter/material.dart';
import '../../../core/constant/string_constants.dart';
import '../../widgets/icon/custom_list_tile_icon.dart';
import '../../widgets/listView/listview_builder.dart';
import '../../widgets/padding/padding.dart';
import '../../widgets/text/text_widget.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.todoapp),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CustomListTileIcon(
              isDone: true,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: ListTile(
              trailing: Icon(Icons.add),
              title: TextWidget(
                textString: "Today",
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: Padding(
              padding: const CustomPadding.all(),
              child: TaskList(),
            ),
          ),
          const Expanded(
              flex: 2,
              child: ListTile(
                title: TextWidget(
                  textString: "Tomorrow",
                ),
              )),
          Expanded(
              flex: 8,
              child: Padding(
                padding: const CustomPadding.all(),
                child: TaskList(),
              )),
        ],
      ),
    );
  }
}
