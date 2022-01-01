import 'package:flutter/material.dart';

class GreenTitles extends StatelessWidget {
  const GreenTitles({Key? key, required this.textString})
      : super(
          key: key,
        );
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      style: TextStyle(
          color: Colors.green[600], fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
