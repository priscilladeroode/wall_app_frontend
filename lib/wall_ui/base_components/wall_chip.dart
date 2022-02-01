import 'package:flutter/material.dart';
import '../tokens/wall_gradients.dart';

class WallChip extends StatelessWidget {
  final String label;
  const WallChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.caption,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: WallGradients.primaryGradient,
      ),
    );
  }
}
