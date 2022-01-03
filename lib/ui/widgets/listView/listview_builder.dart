import 'package:flutter/material.dart';
import '../text/normal_subtitles_text_widget.dart';
import '../text/normal_titles_text_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

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

//TODO: ontap işlemleri leading içerisinde icon yerine button eklenip oraya taşınacak.
//TODO:  ontap işlemi olarak new task nav eklenecek.
class _TaskListState extends State<TaskList> {
  List<ListItem> items = [
    ListItem(title: 'Me', isSelected: true),
    ListItem(title: 'MYSELF', isSelected: true),
    ListItem(title: 'I', isSelected: false),
    ListItem(title: 'Me', isSelected: true),
    ListItem(title: 'MYSELF', isSelected: true),
    ListItem(title: 'I', isSelected: false),
    ListItem(title: 'Me', isSelected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: NormalTitlesTextWidget(textString: index.toString()),
          subtitle: const NormalSubTitlesTextWidget(textString: "data"),
          leading: items[index].isSelected
              ? const Icon(Icons.ac_unit)
              : const Icon(Icons.track_changes),
          onTap: () {
            debugPrint(items[index].isSelected.toString());
            items[index].isSelected = !items[index].isSelected;
            setState(() {});
          },
        ),
      ),
    );
  }
}
