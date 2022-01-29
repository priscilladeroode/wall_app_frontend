import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../commons/breakpoints.dart';

class WallAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? mainActions;
  final List<Widget>? actions;
  final LayoutClass device;
  final double? widthScreen;

  const WallAppBar({
    Key? key,
    this.actions,
    this.mainActions,
    required this.device,
    this.widthScreen,
  }) : super(key: key);

  bool get desktop => device == LayoutClass.desktop;
  double get height => desktop ? 95 : 65;
  double get width => desktop ? (widthScreen! * 0.70) : double.maxFinite;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: SizedBox(
        width: width,
        child: desktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 36),
                      child: SvgPicture.asset('assets/images/logo.svg')),
                  if (mainActions != null) Row(children: mainActions!),
                ],
              )
            : ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 24),
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
      ),
      actions: (!desktop && actions != null) ? actions : null,
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, height);
}
