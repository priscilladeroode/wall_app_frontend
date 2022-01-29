import 'package:flutter/material.dart';

import '../../../commons/breakpoints.dart';
import 'wall_app_bar_logo.dart';
import 'wall_main_app_bar_area.dart';

class WallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? mainActions;
  final List<Widget>? actions;
  final Breakpoint breakpoint;

  const WallAppBar({
    Key? key,
    this.actions,
    this.mainActions,
    required this.breakpoint,
  }) : super(key: key);

  bool get _desktop => breakpoint.device == LayoutClass.desktop;
  double get _height => _desktop ? 95 : 65;
  double get _width => _desktop ? (breakpoint.screenWidth * 0.70) : double.maxFinite;
  bool get _actions => !_desktop && actions != null && actions!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: _height,
      title: SizedBox(
        width: _width,
        child: _desktop ? WallMainAppBarArea(mainActions: mainActions) : const WallAppBarLogo(),
      ),
      actions: _actions ? actions : null,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, _height);
}
