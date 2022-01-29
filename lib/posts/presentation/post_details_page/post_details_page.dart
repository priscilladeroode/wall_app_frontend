import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui.dart/components/wall_app_bar/wall_app_bar.dart';
import '../../../wall_ui.dart/components/wall_error_widget.dart';
import 'post_details_page_controller.dart';

class PostDetailsPage extends StatefulWidget {
  final String postId;
  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ModularState<PostDetailsPage, PostDetailsPageController> {
  late Breakpoint breakpoint;
  late ThemeData theme;

  @override
  void initState() {
    controller.getPost(widget.postId);
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
    );
  }
}
