import 'package:flutter/material.dart';
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
                  children: const [
                    MyListsCardItem(
                      itemCount: 9,
                      taskIcon: Icons.notes,
                      taskName: StringConstants.taskNameAll,
                    ),
                    MyListsCardItem(
                      itemCount: 9,
                      taskIcon: Icons.account_box_outlined,
                      taskName: StringConstants.taskNamePersonal,
                    ),
                    MyListsCardItem(
                      itemCount: 9,
                      taskIcon: Icons.work_outline,
                      taskName: StringConstants.taskNamePersonal,
                    ),
                    MyListsCardItem(
                      itemCount: 9,
                      taskIcon: Icons.add,
                      taskName: StringConstants.taskNameAddList,
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
