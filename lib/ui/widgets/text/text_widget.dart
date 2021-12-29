import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.textString})
      : super(
          key: key,
        );
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
    );
  }
}
