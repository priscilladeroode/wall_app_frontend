import 'package:flutter/material.dart';

import '../../../commons/breakpoints.dart';
import 'wall_custom_app_bar.dart';

class WallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Breakpoint breakpoint;
  final bool hideActions;

  const WallAppBar({
    Key? key,
    required this.breakpoint,
    this.hideActions = false,
  }) : super(key: key);

  bool get _desktop => breakpoint.device == LayoutClass.desktop;
  double get _height => _desktop ? 95 : 65;
  double get _width => _desktop ? (breakpoint.screenWidth * 0.70) : double.maxFinite;

  @override
  Widget build(BuildContext context) {
    return WallCustomAppBar(
      height: _height,
      width: _width,
      desktop: _desktop,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, _height);
}
