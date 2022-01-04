import 'package:flutter/material.dart';
import 'package:todo_app/ui/views/addTask/add_task.view.dart';
import '../text/normal_subtitles_text_widget.dart';
import '../text/normal_titles_text_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.todos}) : super(key: key);
  final List<Map<String, Object?>>? todos;
  @override
  _TaskListState createState() => _TaskListState();
}

//TODO: ontap işlemleri leading içerisinde icon yerine button eklenip oraya taşınacak.
class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.todos == null ? 3 : widget.todos?.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: NormalTitlesTextWidget(textString: index.toString()),
          subtitle: const NormalSubTitlesTextWidget(textString: "data"),
          leading: widget.todos == null
              ? const Text("3")
              : Text(widget.todos![index].toString()),
          // ? const Icon(Icons.ac_unit)
          //: const Icon(Icons.track_changes),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddTaskView()),
            );
            // debugPrint(widget.todos?[index].isDone.toString());
            // widget.todos?[index].isDone = widget.todos?[index].isDone;
            setState(() {});
          },
        ),
      ),
    );
  }
}
