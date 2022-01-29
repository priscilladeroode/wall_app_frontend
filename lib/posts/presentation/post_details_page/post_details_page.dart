import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../commons/breakpoints.dart';
import '../../../wall_ui.dart/components/wall_app_bar.dart';
import 'post_details_page_controller.dart';

class PostDetailsPage extends StatefulWidget {
  final String postId;
  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ModularState<PostDetailsPage, PostDetailsPageController> {
  @override
  void initState() {
    controller.getPost(widget.postId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final device = Breakpoint.fromMediaQuery(context).device;
    return Scaffold(
      appBar: WallAppBar(
        device: device,
        widthScreen: MediaQuery.of(context).size.width,
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return controller.store.loading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.15,
                        top: 70,
                        bottom: 16,
                      ),
                      child: Text(
                        controller.store.post?.title ?? '',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.15,
                        top: 8,
                        bottom: 24,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.store.post?.createdBy ?? '',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.circle_rounded,
                              size: 8,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            DateFormat('MMM dd, y')
                                .format(controller.store.post!.createdAt.toLocal())
                                .toString(),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.15,
                        right: MediaQuery.of(context).size.width * 0.15,
                        top: 24,
                        bottom: 40,
                      ),
                      child: Text(
                        controller.store.post?.content ?? '',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
