import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/base_components/wall_loader.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../../../wall_ui/components/wall_error_widget.dart';
import '../../../wall_ui/components/wall_theme_mode_switch/wall_theme_mode_switch.dart';
import 'components/bubble_floating.dart';
import 'components/delete_dialog.dart';
import 'post_details_page_controller.dart';

class PostDetailsPage extends StatefulWidget {
  final String postId;
  final String owner;
  const PostDetailsPage({Key? key, required this.postId, this.owner = 'false'}) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ModularState<PostDetailsPage, PostDetailsPageController>
    with SingleTickerProviderStateMixin {
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
                ? SizedBox(height: breakpoint.screenHeight, child: const WallLoader.large())
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
                            const WallThemeModeSwitch(),
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
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
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
                            if (kIsWeb && widget.owner == "true")
                              Wrap(
                                children: [
                                  OutlinedButton.icon(
                                    onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) => DeleteDialog(
                                        onPressed: () => controller.deletePost(context),
                                      ),
                                    ),
                                    icon: const Icon(Icons.delete_outline),
                                    label: Text('Delete'.toUpperCase()),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton.icon(
                                      onPressed: () => Modular.to
                                          .pushNamed('/home/write/${controller.store.post!.id}')
                                          .then((value) =>
                                              controller.getPost(controller.store.post!.id)),
                                      icon: const Icon(Icons.edit_outlined),
                                      label: Text('edit'.toUpperCase()))
                                ],
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
      floatingActionButton:
          (widget.owner == "true" && !kIsWeb) ? BubbleFloating(controller: controller) : null,
    );
  }
}
