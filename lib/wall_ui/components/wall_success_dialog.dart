import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../base_components/wall_elevated_button.dart';

class WallSuccessDialog extends StatelessWidget {
  final String title;
  final String imagePath;
  const WallSuccessDialog({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350),
        child: SvgPicture.asset(imagePath),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WallElevatedButton(onPressed: () => Modular.to.pop(), label: 'ok'),
          ],
        ),
      ],
    );
  }
}
