import 'package:flutter/material.dart';
import 'package:todo_app/ui/views/addTask/add_task.view.dart';

import '../../../core/constant/string_constants.dart';
import '../../widgets/card/my_lists_card.dart';
import '../../widgets/padding/padding.dart';
import '../allTasks/all_tasks_view.dart';

class MyListsWidget extends StatelessWidget {
  const MyListsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.myLists),
        ),
        body: Padding(
          padding: const CustomPadding.all(),
          child: gridViewCountMethod(context),
        ));
  }

  GridView gridViewCountMethod(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20,
      children: [
        MyListsCardItem(
          itemCount: 9,
          taskIcon: const Icon(Icons.notes),
          taskName: StringConstants.taskNameAll,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllTasks()),
            );
          },
        ),
        MyListsCardItem(
          itemCount: 9,
          taskIcon: const Icon(Icons.account_box_outlined),
          taskName: StringConstants.taskNamePersonal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllTasks()),
            );
          },
        ),
        MyListsCardItem(
          itemCount: 9,
          taskIcon: const Icon(Icons.work_outline),
          taskName: StringConstants.taskNamePersonal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllTasks()),
            );
          },
        ),
        MyListsCardItem(
          itemCount: 9,
          taskIcon: const Icon(Icons.add),
          taskName: StringConstants.taskNameAddList,
          tooltip: "Coming Soon",
          onPressed: () {
            debugPrint("sdgdfh");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskView()),
            );
          },
        ),
      ],
    );
  }
}
