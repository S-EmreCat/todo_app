import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.isDone}) : super(key: key);

  final bool isDone;
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 29,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(index.toString()),
          trailing: widget.isDone
              ? (const Icon(Icons.do_not_disturb_on_sharp))
              : const Icon(Icons.text_snippet_outlined),
          subtitle: const Text("data"),
          leading: const Icon(Icons.ac_unit),
          onTap: () {
            setState(() {
              widget.isDone = !widget.isDone;
            });
          },
        ),
      ),
    );
  }
}
