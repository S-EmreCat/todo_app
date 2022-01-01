import 'package:flutter/cupertino.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding.all() : super.all(20);
  const CustomPadding.normalHorizontal() : super.symmetric(horizontal: 5);
  const CustomPadding.normalVertical() : super.symmetric(vertical: 5);
}
