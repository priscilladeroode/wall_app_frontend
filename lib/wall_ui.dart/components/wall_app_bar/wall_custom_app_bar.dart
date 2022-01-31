import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'wall_app_bar_controller.dart';
import 'widgets/wall_desktop_app_bar/wall_desktop_app_bar.dart';
import 'widgets/wall_mobile_app_bar.dart';

class WallCustomAppBar extends StatefulWidget {
  final double height;
  final double width;
  final bool desktop;
  final bool hideActions;
  const WallCustomAppBar({
    Key? key,
    required this.height,
    required this.width,
    required this.desktop,
    this.hideActions = false,
  }) : super(key: key);

  @override
  _WallCustomAppBarState createState() => _WallCustomAppBarState();
}

class _WallCustomAppBarState extends ModularState<WallCustomAppBar, WallAppBarController> {
  @override
  Widget build(BuildContext context) {
    return widget.desktop
        ? WallDesktopAppBar(width: widget.width, controller: controller, height: widget.height)
        : WallMobileAppBar(width: widget.width, height: widget.height, controller: controller);
  }
}
