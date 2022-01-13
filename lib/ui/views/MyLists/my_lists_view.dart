import 'package:flutter/material.dart';
import '../../../core/utils/dbhelper.dart';
import '../addTask/add_task.view.dart';

import '../../../core/constant/string_constants.dart';
import '../../widgets/card/my_lists_card.dart';
import '../../widgets/padding/padding.dart';
import '../allTasks/all_tasks_view.dart';

class MyListsWidget extends StatefulWidget {
  const MyListsWidget({Key? key}) : super(key: key);

  @override
  State<MyListsWidget> createState() => _MyListsWidgetState();
}

class _MyListsWidgetState extends State<MyListsWidget> {
  final DatabaseHelper _dbhelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringConstants.myLists),
        ),
        body: Padding(
          padding: const CustomPadding.all(),
          child: customFutureBuilder(),
        ));
  }

// itemcount: all - personal - work count
  FutureBuilder customFutureBuilder() {
    setState(() {});
    return FutureBuilder<List>(
      future: Future.wait([
        _dbhelper.getAllCount(),
        _dbhelper.getCustomTaskCount(StringConstants.taskNamePersonal),
        _dbhelper.getCustomTaskCount(StringConstants.taskNameWork),
      ]),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            debugPrint("d");
            if (snapshot.hasError) {
              debugPrint("i");
              return Text('Error: ${snapshot.error}');
            } else {
              debugPrint("e");
              return FutureBuilder<List>(
                  future: Future.wait([
                    _dbhelper.getAllCount(),
                    _dbhelper
                        .getCustomTaskCount(StringConstants.taskNamePersonal),
                    _dbhelper.getCustomTaskCount(StringConstants.taskNameWork),
                  ]),
                  builder: (context, snapshot1) {
                    if (!snapshot1.hasData) {
                      return const CircularProgressIndicator();
                    } else if (snapshot1.hasData) {
                      return gridViewMethod(snapshot1, context);
                    } else {
                      return Container();
                    }
                  });
            }
          case ConnectionState.waiting:
            debugPrint("s");
            return const CircularProgressIndicator();
          default:
            debugPrint("Snapshot " + snapshot.toString());
            return Container();
        }
      },
    );
  }

  GridView gridViewMethod(
      AsyncSnapshot<List<dynamic>> snapshot1, BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 20,
      children: [
        MyListsCardItem(
          itemCount: int.parse(snapshot1.data![0].toString()),
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
          itemCount: int.parse(snapshot1.data![1].toString()),
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
          itemCount: int.parse(snapshot1.data![2].toString()),
          taskIcon: const Icon(Icons.work_outline),
          taskName: StringConstants.taskNameWork,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllTasks()),
            );
          },
        ),
        MyListsCardItem(
          itemCount: int.parse(snapshot1.data![0].toString()),
          taskIcon: const Icon(Icons.add),
          taskName: StringConstants.taskNameAddTask,
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
