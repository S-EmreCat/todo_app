import 'package:flutter/material.dart';

import '../../../core/constant/string_constants.dart';
import '../../widgets/icon/custom_list_tile_icon.dart';
import '../../widgets/listView/listview_builder.dart';
import '../../widgets/padding/padding.dart';
import '../../widgets/text/green_titles_text_widget.dart';

class AllTasks extends StatefulWidget {
  AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late var deneme = [
    ListItem(title: 'Me', isSelected: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.taskNameAll),
        actions: [
          clearCompletedButton(),
        ],
      ),
      body: deneme.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: const [
                Expanded(
                  flex: 2,
                  child: ListTile(
                    //TODO: icon widget oluştur renk atamaları yap.
                    trailing: Icon(Icons.add),
                    title: GreenTitles(
                      textString: StringConstants.today,
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: CustomPadding.all(),
                    child: TaskList(),
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: ListTile(
                      title: GreenTitles(
                        textString: StringConstants.tomorrow,
                      ),
                    )),
                Expanded(
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
