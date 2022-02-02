import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback? onPressed;
  const DeleteDialog({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Are you sure you want to delete this post?',
        textAlign: TextAlign.center,
      ),
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350),
        child: SvgPicture.asset('assets/images/confirmation.svg'),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            ElevatedButton.icon(
              onPressed: onPressed,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Delete'),
            ),
          ],
        ),
      ],
    );
  }
}
