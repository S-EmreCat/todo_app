import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:todo_app/ui/widgets/text/green_titles_text_widget.dart';
import 'package:todo_app/ui/widgets/text/normal_subtitles_text_widget.dart';

import '../button/mylist_icon_button.dart';

class MyListsCardItem extends StatelessWidget {
  const MyListsCardItem(
      {Key? key,
      required this.itemCount,
      required this.taskIcon,
      required this.taskName,
      required this.onPressed,
      this.tooltip})
      : super(key: key);
  final int itemCount;
  final Icon taskIcon;
  final String taskName;
  final Callback onPressed;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 3,
              child: TaskIconButton(
                icon: taskIcon,
                onPressed: onPressed,
                tooltip: tooltip,
              ),
            ),
            Expanded(
              flex: 1,
              child: GreenTitles(textString: taskName),
            ),
            Expanded(
              flex: 1,
              child: NormalSubTitlesTextWidget(
                textString: "$itemCount items",
              ),
            ),
            const Expanded(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
