import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Widget? title,
    List<Widget>? actions,
    Widget? leading,
    Color? backgroundColor,
  }) : super(
          key: key,
          title: title,
          actions: actions,
          leading: leading,
          backgroundColor: backgroundColor,
        );

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      automaticallyImplyLeading: false,
      title: title,
      actions: const [],
      centerTitle: false,
      elevation: 2,
    );
  }
}
