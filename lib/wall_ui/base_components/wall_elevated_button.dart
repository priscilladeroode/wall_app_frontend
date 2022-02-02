import 'package:flutter/material.dart';
import 'wall_loader.dart';

class WallElevatedButton extends StatelessWidget {
  final double? width;
  final bool loading;
  final VoidCallback? onPressed;
  final String label;
  const WallElevatedButton({
    Key? key,
    this.loading = false,
    required this.label,
    this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        child: loading ? const WallLoader.small() : Text(label.toUpperCase()),
      ),
    );
  }
}
