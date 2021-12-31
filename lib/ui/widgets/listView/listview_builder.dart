import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class ListItem {
  String? title;
  bool isSelected;
  ListItem({
    this.title,
    required this.isSelected,
  });
}

class _TaskListState extends State<TaskList> {
  List<ListItem> items = [
    ListItem(title: 'Me', isSelected: true),
    ListItem(title: 'MYSELF', isSelected: true),
    ListItem(title: 'I', isSelected: false),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(index.toString()),
          trailing: items[index].isSelected
              ? (const Icon(Icons.do_not_disturb_on_sharp))
              : const Icon(Icons.text_snippet_outlined),
          subtitle: const Text("data"),
          leading: items[index].isSelected
              ? const Icon(Icons.ac_unit)
              : const Icon(Icons.track_changes),
          onTap: () {
            setState(() {
              debugPrint(items[index].isSelected.toString());
              items[index].isSelected = !items[index].isSelected;
            });
          },
        ),
      ),
    );
  }
}
