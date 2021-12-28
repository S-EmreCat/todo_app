import 'package:flutter/material.dart';

class MyListsCardItem extends StatelessWidget {
  const MyListsCardItem({
    Key? key,
    required this.itemCount,
    required this.taskIcon,
    required this.taskName,
  }) : super(key: key);
  final int itemCount;
  final IconData taskIcon;
  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: Icon(
                taskIcon,
                size: 50,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(taskName),
            ),
            Expanded(
              flex: 1,
              child: Text("$itemCount items"),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
