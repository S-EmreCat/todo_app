import 'package:flutter/material.dart';
import 'package:todo_app/ui/views/allTasks/all_tasks_view.dart';
import '../../widgets/card/my_lists_card.dart';
import '../../../core/constant/string_constants.dart';

class MyListsWidget extends StatelessWidget {
  const MyListsWidget({Key? key}) : super(key: key);
  final String _myListsString = "My Lists";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_myListsString),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
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
                          MaterialPageRoute(
                              builder: (context) => const AllTasks()),
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
                          MaterialPageRoute(
                              builder: (context) => const AllTasks()),
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
                          MaterialPageRoute(
                              builder: (context) => const AllTasks()),
                        );
                      },
                    ),
                    MyListsCardItem(
                      itemCount: 9,
                      taskIcon: const Icon(Icons.add),
                      taskName: StringConstants.taskNameAddList,
                      tooltip: "Coming Soon",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllTasks()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ));
  }
}
