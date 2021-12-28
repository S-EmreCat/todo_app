import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TaskIconButton extends StatelessWidget {
  const TaskIconButton(
      {Key? key, required this.onPressed, required this.icon, this.tooltip})
      : super(key: key);
  final Callback onPressed;
  final Icon icon;
  final String? tooltip;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: 50,
      tooltip: tooltip,
    );
  }
}
