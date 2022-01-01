import 'package:flutter/material.dart';

class CustomListTileIcon extends Icon {
  // ignore: use_key_in_widget_constructors
  const CustomListTileIcon({required bool isDone})
      : super(isDone ? Icons.clear : Icons.do_not_disturb_on_outlined);
}
