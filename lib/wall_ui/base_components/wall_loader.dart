import 'package:flutter/material.dart';

class WallLoader extends StatelessWidget {
  final double size;
  const WallLoader.small({Key? key, this.size = 24}) : super(key: key);
  const WallLoader.large({Key? key, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
