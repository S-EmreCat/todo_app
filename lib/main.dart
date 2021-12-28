import 'package:flutter/material.dart';
import 'ui/views/MyLists/my_lists_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "Poppins",
          brightness: Brightness.light,
          primaryColor: const Color(0xffC20003), //xxx
          primaryColorBrightness: Brightness.dark,
          primaryColorLight: const Color(0xffffcdd2),
          primaryColorDark: const Color(0xffd32f2f),
          scaffoldBackgroundColor: const Color(0xfffafafa), //xx
        ),
        home: const MyListsWidget(),
        debugShowCheckedModeBanner: false);
  }
}
