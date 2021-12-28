import 'package:flutter/material.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_sweep),
          )
        ],
      ),
      body: IconButton(
        onPressed: () {},
        icon: const FlutterLogo(),
      ),
    );
  }
}
