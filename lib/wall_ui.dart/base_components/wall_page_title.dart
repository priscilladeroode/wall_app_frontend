import 'package:flutter/material.dart';
import '../../commons/breakpoints.dart';

class WallPageTitle extends StatelessWidget {
  final String title;
  final Breakpoint breakpoint;
  const WallPageTitle({
    Key? key,
    required this.title,
    required this.breakpoint,
  }) : super(key: key);

  TextStyle getStyle(BuildContext context) {
    switch (breakpoint.device) {
      case LayoutClass.desktop:
        return Theme.of(context).textTheme.headline1!;

      case LayoutClass.tablet:
        return Theme.of(context).textTheme.headline3!;

      default:
        return Theme.of(context).textTheme.headline5!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Text(title, style: getStyle(context)),
    );
  }
}
