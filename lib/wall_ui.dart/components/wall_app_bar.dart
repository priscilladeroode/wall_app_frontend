import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../commons/breakpoints.dart';

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

  bool get desktop => breakpoint.device == LayoutClass.desktop;
  double get height => desktop ? 95 : 65;
  double get width => desktop ? 1128 : double.maxFinite;

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
