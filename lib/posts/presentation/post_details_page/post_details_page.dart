import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../../../wall_ui/components/wall_error_widget.dart';
import '../../../wall_ui/tokens/wall_colors.dart';
import 'post_details_page_controller.dart';

class PostDetailsPage extends StatefulWidget {
  final String postId;
  final bool owner;
  const PostDetailsPage({Key? key, required this.postId, this.owner = false}) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ModularState<PostDetailsPage, PostDetailsPageController>
    with SingleTickerProviderStateMixin {
  late Breakpoint breakpoint;
  late ThemeData theme;
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool expanded = false;

  @override
  void initState() {
    controller.getPost(widget.postId);
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
    breakpoint = Breakpoint.fromMediaQuery(context);
    theme = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WallAppBar(
        breakpoint: breakpoint,
      ),
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
            return controller.store.loading
                ? SizedBox(
                    height: breakpoint.screenHeight,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : controller.store.error.isNotEmpty
                    ? WallErrorWidget(
                        errorMessage: controller.store.error, screenHeight: breakpoint.screenHeight)
                    : Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: breakpoint.device == LayoutClass.desktop
                              ? breakpoint.screenWidth * 0.15
                              : 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 70, bottom: 16),
                              child: Text(
                                controller.store.post?.title ?? '',
                                style: breakpoint.device == LayoutClass.desktop
                                    ? theme.textTheme.headline2
                                    : breakpoint.device == LayoutClass.tablet
                                        ? theme.textTheme.headline4
                                        : theme.textTheme.headline6,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.store.post?.createdBy ?? '',
                                    style: theme.textTheme.bodyText1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Icon(
                                      Icons.circle_rounded,
                                      size: 8,
                                      color: theme.primaryColor,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM dd, y')
                                        .format(controller.store.post!.createdAt.toLocal())
                                        .toString(),
                                    style: theme.textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24, bottom: 40),
                              child: Text(
                                controller.store.post?.content ?? '',
                                style: theme.textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      );
          },
        ),
      ),
      floatingActionButton: (widget.owner && breakpoint.device == LayoutClass.mobile)
          ? FloatingActionBubble(
              items: <Bubble>[
                Bubble(
                  title: "Delete",
                  iconColor: Colors.white,
                  bubbleColor: theme.primaryColor,
                  icon: Icons.delete_outline,
                  titleStyle: theme.textTheme.button!,
                  onPress: () {
                    // Navigator.push(
                    //     context, new MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                    // _animationController.reverse();
                  },
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
            )
          : null,
    );
  }
}
