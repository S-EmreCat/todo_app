import 'package:flutter/material.dart';

class NormalSubTitlesTextWidget extends StatelessWidget {
  const NormalSubTitlesTextWidget({Key? key, required this.textString})
      : super(
          key: key,
        );
  final String textString;

  @override
  Widget build(BuildContext context) {
    return Text(
      textString,
      maxLines: 1,
      style: const TextStyle(color: Colors.black54, fontSize: 14),
    );
  }
}
