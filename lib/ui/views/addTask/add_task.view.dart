import 'package:flutter/material.dart';

import '../../../core/constant/string_constants.dart';
import '../../../core/model/task_model.dart';
import '../../../core/utils/dbhelper.dart';
import '../../widgets/padding/padding.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView(
      {Key? key,
      this.getDropdownValue,
      this.getRadioButtonItem,
      this.getTitle,
      this.getSubTitle})
      : super(key: key);
  final String? getDropdownValue;
  final String? getRadioButtonItem;
  final String? getTitle;
  final String? getSubTitle;
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late DatabaseHelper _dbhelper;
  @override
  void initState() {
    _dbhelper = DatabaseHelper();
    super.initState();
  }

  String radioButtonItem = 'today';

  int radioId = 1;
  final items = <String>[
    StringConstants.taskNamePersonal,
    StringConstants.taskNameWork
  ];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    titleController.text = "";
    //TODO: push controll
    if (widget.getTitle != null) {
      titleController.text = widget.getTitle!;
    }

    final subTitleController = TextEditingController();
    // TODO: Actions (save-back & delete & back)
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.addNewTask),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const CustomPadding.all(),
              child: textField(titleController),
            ),
            Padding(
              padding: const CustomPadding.all(),
              child: textField(subTitleController),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                radioMethod(StringConstants.today, 1),
                radioMethod(StringConstants.tomorrow, 2),
              ],
            ),
            DropdownButton<String>(
              value: dropdownValue,
              hint: const Text('Select task type'),
              icon: const Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              child: const Text("save"),
              onPressed: () async {
                debugPrint('save');
                await _dbhelper
                    .insert(
                      Todo(
                          title: titleController.text,
                          description: subTitleController.text,
                          day: radioButtonItem,
                          isDone: false,
                          taskType: dropdownValue!),
                    )
                    .then((value) => Navigator.pop(context));
              },
            ),
          ],
        ),
      ),
    );
  }

  Row radioMethod(String getDay, int getId) {
    return Row(
      children: [
        Text(getDay),
        Radio(
          value: getId,
          groupValue: radioId,
          onChanged: (value) {
            setState(
              () {
                radioButtonItem = getDay;
                radioId = getId;
              },
            );
          },
        ),
      ],
    );
  }

  Widget textField(controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
