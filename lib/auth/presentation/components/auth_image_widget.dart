import 'package:flutter/material.dart';
import '../../../commons/breakpoints.dart';

class AuthImageWidget extends StatelessWidget {
  final String imagePath;
  const AuthImageWidget({
    Key? key,
    required this.breakpoint,
    required this.imagePath,
  }) : super(key: key);

  final Breakpoint breakpoint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: breakpoint.screenHeight,
      width: breakpoint.screenWidth * 0.40,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: breakpoint.screenHeight * 0.8),
          child: Image.asset(
            imagePath,
          ),
        ),
      ),
    );
  }
}
