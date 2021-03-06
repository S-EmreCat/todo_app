import 'package:flutter/material.dart';
import '../../../core/constant/string_constants.dart';

import '../../../core/model/task_model.dart';
import '../../views/addTask/add_task.view.dart';
import '../text/normal_subtitles_text_widget.dart';
import '../text/normal_titles_text_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.myFuture}) : super(key: key);
  final Future<List<Todo>?> myFuture;
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.myFuture,
      builder: (BuildContext context, AsyncSnapshot<List<Todo>?> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                title: NormalTitlesTextWidget(
                    textString: snapshot.data![index].title),
                subtitle: NormalSubTitlesTextWidget(
                    textString: snapshot.data![index].description),
                leading: snapshot.data![index].isDone
                    ? const Icon(Icons.ac_unit)
                    : const Icon(Icons.track_changes),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTaskView(
                              getTodoId: snapshot.data![index].id,
                              getPageTitle: StringConstants.updateTaskTitle,
                              getTaskTitle: snapshot.data![index].title,
                              getSubTitle: snapshot.data![index].description,
                              getDropdownValue: snapshot.data![index].taskType,
                              getRadioButtonItem: snapshot.data![index].day,
                            )),
                  ).then((value) => setState(() {}));
                },
              ),
            ),
          );
        }
        return const Text("data");
      },
    );
  }
}
