import 'package:flutter/material.dart';
import 'package:lookprior/common/constant/color_const.dart';

class CommaneAppBar extends StatelessWidget {
  Widget? title;
  List<Widget>? actions;
  CommaneAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(child: AppBar(
      backgroundColor: ColorsResources.registerScreen,
      elevation: 0,
      title: title,
      actions: actions,
    ), preferredSize: Size.fromHeight(10));
  }
}
