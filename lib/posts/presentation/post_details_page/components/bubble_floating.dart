import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';

import '../../../../wall_ui/tokens/wall_colors.dart';
import '../post_details_page_controller.dart';
import 'delete_dialog.dart';

class BubbleFloating extends StatefulWidget {
  final PostDetailsPageController controller;
  const BubbleFloating({Key? key, required this.controller}) : super(key: key);

  @override
  State<BubbleFloating> createState() => _BubbleFloatingState();
}

class _BubbleFloatingState extends State<BubbleFloating> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late ThemeData theme;
  bool expanded = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    _animationController.addListener(() => setState(() {
          expanded = !expanded;
        }));

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    theme = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: <Bubble>[
        Bubble(
          title: "Delete",
          iconColor: Colors.white,
          bubbleColor: theme.primaryColor,
          icon: Icons.delete_outline,
          titleStyle: theme.textTheme.button!,
          onPress: () => showDialog(
            context: context,
            builder: (context) => DeleteDialog(
              onPressed: () => widget.controller.deletePost(context),
            ),
          ),
        ),
        Bubble(
          title: "Edit",
          iconColor: Colors.white,
          bubbleColor: theme.primaryColor,
          icon: Icons.edit_outlined,
          titleStyle: theme.textTheme.button!,
          onPress: () {
            _animationController.reverse();
          },
        ),
      ],
      animation: _animation,
      onPress: () => _animationController.isCompleted
          ? _animationController.reverse()
          : _animationController.forward(),
      iconColor: WallColors.neutral50,
      iconData: _animationController.isCompleted ? Icons.remove : Icons.add,
      backGroundColor: theme.primaryColor,
    );
  }
}
