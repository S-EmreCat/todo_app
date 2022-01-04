import 'package:flutter/material.dart';
import '../../../core/constant/string_constants.dart';
import '../../widgets/padding/padding.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String radioButtonItem = 'today';
  int radioId = 1;
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final subTitleController = TextEditingController();
    // TODO: Actions (save-back & delete & back)
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.addNewTask),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
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
                    radioMethod("today", 1),
                    radioMethod("tomorrow", 2),
                  ],
                ),
                ElevatedButton(
                  child: const Text("save"),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
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
