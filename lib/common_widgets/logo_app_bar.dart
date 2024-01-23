import 'package:flutter/material.dart';
import 'package:npm/common_widgets/logo.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    required this.title,
    required this.trailing,
    this.height = 80.0,
    super.key,
  });

  final Widget title;
  final Widget trailing;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Logo(),
      ),
      leadingWidth: 80,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: height,
      actions: [trailing],
      title: title,
    );
  }

  @override
  Size get preferredSize => Size(AppBar().preferredSize.width, height);
}
