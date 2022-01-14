import 'package:flutter/material.dart';

import '../../../core/constant/string_constants.dart';
import '../../../core/utils/dbhelper.dart';
import '../../widgets/button/addTask/insert_elevated_button.dart';
import '../../widgets/padding/padding.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView(
      {Key? key,
      this.getPageTitle,
      this.getDropdownValue,
      this.getRadioButtonItem,
      this.getTaskTitle,
      this.getTodoId,
      this.getSubTitle})
      : super(key: key);
  final String? getPageTitle;
  final String? getDropdownValue;
  final String? getRadioButtonItem;
  final String? getTaskTitle;
  final String? getSubTitle;
  final int? getTodoId;
  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

String? radioButtonItem = 'today';

class _AddTaskViewState extends State<AddTaskView> {
  late DatabaseHelper _dbhelper;
  @override
  void initState() {
    _dbhelper = DatabaseHelper();
    super.initState();
  }

  int radioId = 1;
  final dropDownItems = <String>[
    StringConstants.taskNamePersonal,
    StringConstants.taskNameWork
  ];
  String? dropdownValue;
  @override
  void didUpdateWidget(AddTaskView oldWidget) {
    // dropdownValue = widget.getDropdownValue;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    titleController.text = widget.getTaskTitle ?? '';

    final subTitleController = TextEditingController();
    subTitleController.text = widget.getSubTitle ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.getPageTitle ?? StringConstants.addNewTask),
        actions: [
          Visibility(
            child: deleteTaskButton(),
            visible: widget.getPageTitle == StringConstants.updateTaskTitle,
          ),
        ],
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
            newMethodDropDownButton(),
            InsertElevatedButton(
              todoid: widget.getTodoId,
              dbhelper: _dbhelper,
              titleController: titleController,
              subTitleController: subTitleController,
              radioButtonItem: radioButtonItem,
              dropdownValue: dropdownValue ?? dropDownItems[0],
              buttonText: widget.getPageTitle != StringConstants.updateTaskTitle
                  ? StringConstants.save
                  : StringConstants.update,
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> newMethodDropDownButton() {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: const Text('Select task type'),
      icon: const Icon(Icons.arrow_drop_down),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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

  ElevatedButton deleteTaskButton() {
    return ElevatedButton(
      onPressed: () async {
        _dbhelper.deleteItem(widget.getTodoId!);
        debugPrint("deleted");
      },
      child: Row(
        children: const [
          Icon(Icons.clear),
          Text(StringConstants.deleteTask),
        ],
      ),
    );
  }
}
