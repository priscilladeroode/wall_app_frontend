import 'package:flutter/material.dart';

import 'wall_app_bar_logo.dart';

class WallMainAppBarArea extends StatelessWidget {
  final List<Widget>? mainActions;
  const WallMainAppBarArea({
    Key? key,
    this.mainActions,
  }) : super(key: key);

  bool get _mainActions => mainActions != null && mainActions!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const WallAppBarLogo(maxHeight: 36),
        if (_mainActions) Row(children: mainActions!),
      ],
    );
  }
}
