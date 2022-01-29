import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WallAppBarLogo extends StatelessWidget {
  final double maxHeight;
  const WallAppBarLogo({Key? key, this.maxHeight = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }
}
