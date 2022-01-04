import 'package:flutter/material.dart';
import 'package:todo_app/core/constant/string_constants.dart';
import 'package:todo_app/core/enum/radio_button_enum.dart';
import 'package:todo_app/ui/widgets/padding/padding.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  _AddTaskViewState createState() => _AddTaskViewState();
}

enum SingingCharacter { lafayette, jefferson }

class _AddTaskViewState extends State<AddTaskView> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final subTitleController = TextEditingController();
    //singingCharacter? _character = singingCharacter.today;
    SingingCharacter? _character = SingingCharacter.lafayette;

    // TODO: Actions (save-back & delete & back)
    // TODO: title input & suptitle input & today-tomorrow chose
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
                Padding(
                  padding: const CustomPadding.all(),
                  child: Expanded(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('Lafayette'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.lafayette,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Thomas Jefferson'),
                        leading: Radio<SingingCharacter>(
                          value: SingingCharacter.jefferson,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  )),
                ),
                ElevatedButton(
                  child: const Text("save"),
                  onPressed: () {
                    print("save");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
