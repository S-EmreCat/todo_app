import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 29,
      itemBuilder: (context, index) => const Card(
        child: ListTile(
          title: Text("title"),
          trailing: (Icon(Icons.do_not_disturb_on_sharp)),
          subtitle: Text("data"),
          leading: Icon(Icons.icecream_outlined),
        ),
      ),
    );
  }
}
