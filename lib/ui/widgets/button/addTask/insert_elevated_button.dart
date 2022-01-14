import 'package:flutter/material.dart';
import '../../../../core/constant/string_constants.dart';
import '../../../../core/model/task_model.dart';
import '../../../../core/utils/dbhelper.dart';

class InsertElevatedButton extends StatelessWidget {
  const InsertElevatedButton({
    Key? key,
    required DatabaseHelper dbhelper,
    required this.titleController,
    required this.subTitleController,
    required this.radioButtonItem,
    required this.dropdownValue,
    this.todoid,
    required this.buttonText,
  })  : _dbhelper = dbhelper,
        super(key: key);

  final DatabaseHelper _dbhelper;
  final TextEditingController titleController;
  final TextEditingController subTitleController;
  final String? radioButtonItem;
  final String? dropdownValue;
  final String buttonText;
  final int? todoid;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(buttonText),
      onPressed: () async {
        if (buttonText == StringConstants.save) {
          debugPrint("save");
          await insertTask(context);
        } else if (buttonText == StringConstants.update) {
          debugPrint("degis");
          await updateTask(context);
        }
      },
    );
  }

  Future<void> insertTask(BuildContext context) async {
    return await _dbhelper
        .insert(
          Todo(
              title: titleController.text,
              description: subTitleController.text,
              day: radioButtonItem!,
              isDone: false,
              taskType: dropdownValue!),
        )
        .then((value) => Navigator.pop(context));
  }

  Future<void> updateTask(BuildContext context) async {
    return await _dbhelper
        .updateIsDone(
          Todo(
              id: todoid,
              title: titleController.text,
              description: subTitleController.text,
              day: radioButtonItem!,
              isDone: false,
              taskType: dropdownValue!),
        )
        .then((value) => Navigator.pop(context));
  }
}
