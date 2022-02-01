import 'package:flutter/material.dart';
import '../../wall_app_bar_controller.dart';
import 'wall_main_app_bar_area.dart';

class WallDesktopAppBar extends StatelessWidget {
  final double width;
  final WallAppBarController controller;
  final double height;
  const WallDesktopAppBar({
    Key? key,
    required this.width,
    required this.controller,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: SizedBox(
        width: width,
        child: WallMainAppBarArea(controller: controller),
      ),
    );
  }
}
