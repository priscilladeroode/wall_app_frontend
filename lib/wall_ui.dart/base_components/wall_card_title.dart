import 'package:flutter/material.dart';
import '../../commons/breakpoints.dart';

class WallCardTitle extends StatelessWidget {
  final String title;
  final LayoutClass device;
  const WallCardTitle({
    Key? key,
    required this.device,
    required this.title,
  }) : super(key: key);

  bool get smallContent => device == LayoutClass.mobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(title,
          maxLines: 3,
          style: smallContent
              ? Theme.of(context).textTheme.headline6!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  )
              : Theme.of(context).textTheme.headline4!.copyWith(
                    overflow: TextOverflow.ellipsis,
                  )),
    );
  }
}
