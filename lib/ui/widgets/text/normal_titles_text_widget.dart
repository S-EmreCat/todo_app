import 'package:flutter/material.dart';

class NormalTitlesTextWidget extends StatelessWidget {
  const NormalTitlesTextWidget({Key? key, required this.textString})
      : super(
          key: key,
        );
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      maxLines: 1,
      style: const TextStyle(
          color: Colors.black87, fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
